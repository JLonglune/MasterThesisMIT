import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# -----------------------------
# DRAMA DATA
# -----------------------------
drama_files = {
    "Case 3 Hollow": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt",
    "Case 3 Solid": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt",
    "Case 4 Hollow": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt",
    "Case 4 Solid": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt",
    "Parent": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"
}

drama_columns = [
    "Time", "Altitude", "Latitude", "Longitude", "Velocity", "Downrange",
    "Drag", "Lift", "Side", "Knudsen", "Mach", "Flight_Path", "Heading", "Density"
]

drama_data = {}
for label, path in drama_files.items():
    df = pd.read_csv(path, sep=r'\s+', engine='python', comment='#', names=drama_columns, skiprows=1)
    drama_data[label] = df

# -----------------------------
# NEQ DATA
# -----------------------------
neq_files = {
    "Case 3 Solid": "BreakUP0.28NEQ/Time/NEQ_case3_solid.csv",
    "Case 3 Hollow": "BreakUP0.28NEQ/Time/NEQ_Case3_hollow.csv",
    "Case 4 Solid": "BreakUP0.28NEQ/Time/NEQ_Case4_solid.csv",
    "Case 4 Hollow": "BreakUP0.28NEQ/Time/NEQ_Case4_hollow.csv"
}

neq_data = {}
for label, path in neq_files.items():
    df = pd.read_csv(path)
    df.columns = df.columns.str.strip()
    neq_data[label] = df

# -----------------------------
# FUNCTION: interpolate at altitude
# -----------------------------
def get_value_at_altitude(df, altitude_col, value_col, target_altitude):
    df_sorted = df.sort_values(by=altitude_col)
    if df_sorted[altitude_col].min() > target_altitude or df_sorted[altitude_col].max() < target_altitude:
        return np.nan
    return np.interp(target_altitude, df_sorted[altitude_col], df_sorted[value_col])

# -----------------------------
# PLOT: Altitude vs Time
# -----------------------------
plt.figure(figsize=(12, 6))
color_map = {
    "Case 3 Hollow": "tab:blue",
    "Case 3 Solid": "tab:orange",
    "Case 4 Hollow": "tab:green",
    "Case 4 Solid": "tab:red",
    "Parent": "tab:purple"  # si tu veux l’inclure aussi
}

# --- DRAMA curves (lignes pleines) ---
for label, df in drama_data.items():
    color = color_map.get(label, "gray")
    plt.plot(df["Time"], df["Altitude"], label=f"{label} (DRAMA)", linestyle='-', color=color)

# --- NEQ curves (lignes pointillées) ---
for label, df in neq_data.items():
    color = color_map.get(label, "gray")
    plt.plot(df["x"], df["y"], label=f"{label} (NEQ)", linestyle='--', color=color)


# -----------------------------
# LIGNE DIFF CASE 3 HOLLOW @ ALTITUDE MAX
# -----------------------------
ref_label = "Case 3 Hollow"
drama_ref = drama_data[ref_label]
neq_ref = neq_data[ref_label]

alt_max = 90  
time_drama = get_value_at_altitude(drama_ref, "Altitude", "Time", alt_max)
time_neq = get_value_at_altitude(neq_ref, "y", "x", alt_max)

if not np.isnan(time_drama) and not np.isnan(time_neq):
    diff_time = round(time_drama - time_neq, 2)
    mid_time = (time_drama + time_neq) / 2

    plt.plot([time_drama, time_neq], [alt_max, alt_max], 'b--')  # Ligne bleue
    plt.annotate(f"{ref_label} max alt diff: {diff_time} s",
                 (mid_time, alt_max),
                 textcoords="offset points",
                 xytext=(0, 10),
                 ha='center',
                 fontsize=9,
                 color='blue')
else:
    print(f"[⚠️] Impossible d'interpoler à {alt_max:.2f} km pour {ref_label}")

# -----------------------------
# LIGNES DIFF POUR ENFANTS À 1 KM
# -----------------------------
children_labels = ["Case 3 Hollow", "Case 3 Solid", "Case 4 Hollow", "Case 4 Solid"]
target_alt = 1
offset_step = 10

for i, label in enumerate(children_labels):
    drama_df = drama_data[label]
    neq_df = neq_data[label]

    t_drama = get_value_at_altitude(drama_df, "Altitude", "Time", target_alt)
    t_neq = get_value_at_altitude(neq_df, "y", "x", target_alt)

    if not np.isnan(t_drama) and not np.isnan(t_neq):
        diff = round(t_drama - t_neq, 2)
        mid_t = (t_drama + t_neq) / 2
        offset_y = 10 + i * offset_step

        plt.plot([t_drama, t_neq], [target_alt, target_alt], 'r--')
        plt.annotate(f"{label}: {diff} s",
                     (mid_t, target_alt),
                     textcoords="offset points",
                     xytext=(0, offset_y),
                     ha='center',
                     fontsize=8,
                     color='red')
    else:
        print(f"[⚠️] Impossible d’interpoler à {target_alt} km pour {label}")

# -----------------------------
# FINALISATION DU PLOT
# -----------------------------
plt.xlabel("Time [s]")
plt.ylabel("Altitude [km]")
plt.title("Comparison: DRAMA vs NEQ — Altitude vs Time")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
