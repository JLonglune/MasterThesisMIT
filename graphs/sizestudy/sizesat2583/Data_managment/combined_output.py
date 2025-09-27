import os
import glob
import pandas as pd
import numpy as np
from collections import defaultdict

def extract_object_name(filename):
    name = os.path.basename(filename)
    parts = name.split(".")
    if "_AeroThermalHistory" in name or "_Trajectory" in name:
        return parts[2].split("_")[0]
    return None

def process_and_export_object_data(input_dir, output_dir):
    """
    Merges AeroThermalHistory and Trajectory files per object,
    and saves one combined file per object.
    """
    aero_files = glob.glob(os.path.join(input_dir, "sara.*.*_AeroThermalHistory.txt"))
    traj_files = glob.glob(os.path.join(input_dir, "sara.*.*_Trajectory.txt"))

    aero_map = {extract_object_name(f): f for f in aero_files}
    traj_map = {extract_object_name(f): f for f in traj_files}
    common_objects = sorted(set(aero_map.keys()) & set(traj_map.keys()))

    print(f"Aero files: {len(aero_map)} | Trajectory files: {len(traj_map)} | Common: {len(common_objects)}")
    os.makedirs(output_dir, exist_ok=True)

    for obj_name in common_objects:
        try:
            aero_df = pd.read_csv(aero_map[obj_name], sep=r'\s+', comment='#', header=None)
            traj_df = pd.read_csv(traj_map[obj_name], sep=r'\s+', comment='#', header=None)

            if aero_df.shape[1] < 7 or traj_df.shape[1] < 6:
                print(f"⚠️ Skipped {obj_name}: insufficient columns")
                continue

            aero_df.columns = ['Time [s]', 'Altitude [km]', 'Temp [K]', 'Mass [kg]',
                               'Convective Heat [W/m²]', 'Integrated Heat [J/m²]'] + \
                              [f"extra_aero_{i}" for i in range(aero_df.shape[1] - 6)]

            traj_df.columns = ['Time [s]', 'Altitude [km]', 'Latitude [deg]', 'Longitude [deg]',
                               'Velocity [m/s]', 'Flight Path Angle [deg]'] + \
                              [f"extra_traj_{i}" for i in range(traj_df.shape[1] - 6)]

            merged = pd.merge(aero_df, traj_df, on='Time [s]', suffixes=('_aero', '_traj'))
            merged['Object'] = obj_name
            merged['Material'] = "unknown"

            merged_clean = merged[[
                'Time [s]',
                'Altitude [km]_aero',
                'Latitude [deg]',
                'Longitude [deg]',
                'Velocity [m/s]',
                'Temp [K]',
                'Mass [kg]',
                'Convective Heat [W/m²]',
                'Integrated Heat [J/m²]',
                'Object',
                'Material'
            ]]
            merged_clean.columns = [
                'Time [s]', 'Altitude [km]', 'Latitude [deg]', 'Longitude [deg]',
                'Velocity [m/s]', 'Temperature [K]', 'Mass [kg]',
                'Convective Heat [W/m²]', 'Integrated Heat [J/m²]', 'Object', 'Material'
            ]

            output_path = os.path.join(output_dir, f"combined_{obj_name}.txt")
            merged_clean.to_csv(output_path, sep='\t', index=False)
            print(f"✔️ {obj_name} → {output_path} ({len(merged_clean)} rows)")

        except Exception as e:
            print(f"❌ Error processing {obj_name}: {e}")

def merge_all_objects_to_one_file(source_dir, output_file):
    """
    Merges all combined_<object>.txt files into a single DataFrame.
    """
    all_files = glob.glob(os.path.join(source_dir, "combined_*.txt"))
    dfs = []
    for file in all_files:
        try:
            df = pd.read_csv(file, sep='\t')
            dfs.append(df)
        except Exception as e:
            print(f"❌ Error reading {file}: {e}")
    if dfs:
        full_df = pd.concat(dfs, ignore_index=True)
        os.makedirs(os.path.dirname(output_file), exist_ok=True)
        full_df.to_csv(output_file, sep='\t', index=False)
        print(f"📦 Merged file created: {output_file} ({len(full_df)} rows)")
    else:
        print("⚠️ No combined files found for merging.")

def group_by_mass_and_material_with_avg(input_file, output_file):
    """
    Groups objects by (mass, material), averages lat/lon/time, and merges profiles.
    """
    df = pd.read_csv(input_file, sep='\t')

    required_cols = {
        'Time [s]', 'Altitude [km]', 'Latitude [deg]', 'Longitude [deg]',
        'Mass [kg]', 'Object', 'Material'
    }
    if not required_cols.issubset(df.columns):
        raise ValueError(f"Missing required columns: {required_cols - set(df.columns)}")

    grouped = df.groupby('Object')
    obj_info = []
    for name, sub in grouped:
        sub = sub.sort_values("Altitude [km]")
        initial_mass = sub["Mass [kg]"].iloc[0]
        material = sub["Material"].iloc[0]
        obj_info.append((name, round(initial_mass, 6), material))

    grouping = defaultdict(list)
    for name, mass, mat in obj_info:
        grouping[(mass, mat)].append(name)

    print(f"🔍 {len(grouping)} grouped profiles from {len(obj_info)} objects.")

    result_rows = []
    for (mass, mat), obj_list in grouping.items():
        dfs = []
        for obj in obj_list:
            sub = df[df["Object"] == obj].sort_values("Altitude [km]")
            dfs.append(sub)

        zmin = max(d["Altitude [km]"].min() for d in dfs)
        zmax = min(d["Altitude [km]"].max() for d in dfs)
        if zmax <= zmin:
            print(f"⚠️ Skipped group ({mass}, {mat}) — incompatible altitude ranges.")
            continue

        altitude_grid = np.linspace(zmin, zmax, 100)
        avg_data = {
            'Time [s]': np.zeros_like(altitude_grid),
            'Altitude [km]': altitude_grid,
            'Latitude [deg]': np.zeros_like(altitude_grid),
            'Longitude [deg]': np.zeros_like(altitude_grid),
            'Mass [kg]': np.zeros_like(altitude_grid),
        }

        for d in dfs:
            for key in avg_data:
                if key == 'Altitude [km]': continue
                avg_data[key] += np.interp(altitude_grid, d["Altitude [km]"], d[key])

        for key in avg_data:
            if key != 'Altitude [km]':
                avg_data[key] /= len(dfs)

        for i in range(len(altitude_grid)):
            result_rows.append({
                'Time [s]': avg_data['Time [s]'][i],
                'Altitude [km]': avg_data['Altitude [km]'][i],
                'Latitude [deg]': avg_data['Latitude [deg]'][i],
                'Longitude [deg]': avg_data['Longitude [deg]'][i],
                'Mass [kg]': avg_data['Mass [kg]'][i],
                'Group': f"{mass:.6f}kg_{mat}",
                'Material': mat
            })

    result_df = pd.DataFrame(result_rows)
    os.makedirs(os.path.dirname(output_file), exist_ok=True)
    result_df.to_csv(output_file, sep='\t', index=False)
    print(f"✅ Grouped data written to: {output_file}")

# === Main Usage ===
if __name__ == "__main__":
    object_dir = "sizesat2583/Data_management_data/object/"
    combined_file = "sizesat2583/Data_management/combined_object_data.txt"
    grouped_output = "sizesat2583/Data_management/grouped_mass_material_with_coords.txt"

    process_and_export_object_data(
        input_dir="sizesat2583/SARA/REENTRY/output",
        output_dir=object_dir
    )

    merge_all_objects_to_one_file(
        source_dir=object_dir,
        output_file=combined_file
    )

    group_by_mass_and_material_with_avg(
        input_file=combined_file,
        output_file=grouped_output
    )
