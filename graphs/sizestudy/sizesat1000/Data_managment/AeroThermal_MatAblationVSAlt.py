import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math
import xml.etree.ElementTree as ET
from collections import defaultdict

############################################
# Data Loading
############################################
def load_data(file_path):
    """
    Load tab-separated data into a pandas DataFrame.
    """
    return pd.read_csv(file_path, sep="\t")

############################################
# Load total mass per material from XML
############################################
def load_materials_mass(xml_path):
    """
    Parse an XML file of objects to compute total mass per material.
    """
    tree = ET.parse(xml_path)
    root = tree.getroot()
    materials_mass = defaultdict(float)
    for obj in root.findall('.//object'):
        material = obj.find('material').text
        mass = float(obj.find('mass').text)
        quantity = int(obj.find('quantity').text)
        materials_mass[material] += mass * quantity
    return materials_mass

############################################
# Figure 1: Contribution of Each Object by Material
############################################
def plot_contributions_by_material(file_path, xml_path):
    """
    Plot mass vs altitude for each object within each material.
    Includes satellite total mass in title.
    Figure 1: Contribution of Each Object by Material (Satellite: XXX kg)
    """
    df = load_data(file_path)
    materials = df["Matériau"].unique()
    total_mass = sum(load_materials_mass(xml_path).values())

    n_materials = len(materials)
    ncols = 2
    nrows = math.ceil(n_materials / ncols)
    fig, axes = plt.subplots(nrows, ncols, figsize=(15, 5 * nrows))
    axes = axes.flatten() if n_materials > 1 else [axes]
    for ax in axes[n_materials:]:
        ax.set_visible(False)
    for i, material in enumerate(materials):
        ax = axes[i]
        mat_df = df[df["Matériau"] == material]
        objects = mat_df["Objet"].unique() if "Objet" in mat_df.columns else mat_df.index
        for obj in objects:
            sub = mat_df[mat_df["Objet"] == obj] if "Objet" in mat_df.columns else mat_df.loc[[obj]]
            sub = sub.sort_values("Altitude (km)")
            ax.plot(sub["Mass (kg)"].values,
                    sub["Altitude (km)"].values,
                    marker='o', markersize=4,
                    linestyle='-', linewidth=1.2,
                    label=str(obj))
        ax.set_title(f"Material: {material}")
        ax.set_xlabel("Mass (kg)")
        ax.set_ylabel("Altitude (km)")
        ax.grid(True)
        ax.legend(title="Object", fontsize=6, ncol=2)

    fig.suptitle(f"Figure 1: Contribution of Each Object by Material (Satellite: {total_mass:.2f} kg)", fontsize=16)
    plt.tight_layout(rect=[0,0,1,0.96])
    plt.show()
    

############################################
# Figure 2: Total Interpolated Mass by Material
############################################
def plot_total_mass_by_material(file_path, xml_path):
    """
    Plot total interpolated mass vs altitude for each material, plus global.
    Figure 2: Total Interpolated Mass by Material (Satellite: XXX kg)
    """
    df = load_data(file_path)
    materials = df["Matériau"].unique()
    total_mass = sum(load_materials_mass(xml_path).values())

    n_materials = len(materials)
    ncols, nrows = 2, math.ceil((n_materials + 1) / 2)
    fig, axes = plt.subplots(nrows, ncols, figsize=(15, 5 * nrows))
    axes = axes.flatten()
    for ax in axes[n_materials+1:]:
        ax.set_visible(False)

    altitude_grid = None
    global_sum = None

    for i, material in enumerate(materials):
        ax = axes[i]
        mat_df = df[df["Matériau"] == material]
        objects = mat_df["Objet"].unique() if "Objet" in mat_df.columns else mat_df.index
        zmin, zmax = mat_df["Altitude (km)"].min(), mat_df["Altitude (km)"].max()
        altitude_grid = np.linspace(zmin, zmax, 100) if altitude_grid is None else altitude_grid
        mass_sum = np.zeros_like(altitude_grid)
        for obj in objects:
            sub = mat_df[mat_df["Objet"] == obj] if "Objet" in mat_df.columns else mat_df.loc[[obj]]
            sub = sub.sort_values("Altitude (km)")
            mass_sum += np.interp(altitude_grid, sub["Altitude (km)"].values, sub["Mass (kg)"].values)
        global_sum = mass_sum.copy() if global_sum is None else global_sum + mass_sum
        ax.plot(mass_sum, altitude_grid,
                marker='o', markersize=4,
                linestyle='-', linewidth=1.2)
        ax.set_title(f"Total Mass for {material}")
        ax.set_xlabel("Mass (kg)")
        ax.set_ylabel("Altitude (km)")
        ax.grid(True)

    ax_global = axes[n_materials]
    ax_global.plot(global_sum, altitude_grid,
                   marker='o', markersize=4,
                   linestyle='-', color='black', linewidth=1.5)
    ax_global.set_title("Total Mass - All Materials")
    ax_global.set_xlabel("Mass (kg)")
    ax_global.set_ylabel("Altitude (km)")
    ax_global.grid(True)

    fig.suptitle(f"Figure 2: Total Interpolated Mass by Material (Satellite: {total_mass:.2f} kg)", fontsize=16)
    plt.tight_layout(rect=[0,0,1,0.96])
    plt.show()

############################################
# Utility: Compute Mass Profiles by Material
############################################
def compute_results_by_material(file_path):
    df = load_data(file_path)
    results = {}
    for material in df["Matériau"].unique():
        mat_df = df[df["Matériau"] == material]
        zmin, zmax = mat_df["Altitude (km)"].min(), mat_df["Altitude (km)"].max()
        altitude_grid = np.linspace(zmin, zmax, 100)
        mass_sum = np.zeros_like(altitude_grid)
        objects = mat_df["Objet"].unique() if "Objet" in mat_df.columns else mat_df.index
        for obj in objects:
            sub = mat_df[mat_df["Objet"] == obj] if "Objet" in mat_df.columns else mat_df.loc[[obj]]
            sub = sub.sort_values("Altitude (km)")
            mass_sum += np.interp(altitude_grid, sub["Altitude (km)"].values, sub["Mass (kg)"].values)
        results[material] = {"altitudes": altitude_grid,
                              "masses": mass_sum,
                              "initial_mass": mass_sum[0]}
    return results

############################################
# Figure 4: Mass, Lost Mass, and Loss Rate by Material
############################################
def plot_figure_4(file_path, xml_path):
    """
    Three subplots: mass, lost mass, and loss rate by material.
    Figure 4: Mass, Lost Mass, and Loss Rate by Material (Satellite: XXX kg)
    """
    results = compute_results_by_material(file_path)
    total_mass = sum(load_materials_mass(xml_path).values())

    fig, axes = plt.subplots(3, 1, figsize=(10, 15))
    # Mass vs Altitude
    for mat, res in results.items():
        axes[0].plot(res["masses"], res["altitudes"],
                     marker='o', markersize=4,
                     linestyle='-', linewidth=1.2,
                     label=mat)
    axes[0].set_xlabel("Mass (kg)")
    axes[0].set_ylabel("Altitude (km)")
    axes[0].set_title("Mass vs Altitude by Material")
    axes[0].grid(True)
    axes[0].legend(title="Material", fontsize=8, ncol=2)

    # Lost Mass vs Altitude
    for mat, res in results.items():
        lost = res["initial_mass"] - res["masses"]
        axes[1].plot(lost, res["altitudes"],
                     marker='o', markersize=4,
                     linestyle='-', linewidth=1.2,
                     label=mat)
    axes[1].set_xlabel("Lost Mass (kg)")
    axes[1].set_ylabel("Altitude (km)")
    axes[1].set_title("Lost Mass vs Altitude by Material")
    axes[1].grid(True)
    axes[1].legend(title="Material", fontsize=8, ncol=2)

    # Mass Loss Rate vs Altitude
    for mat, res in results.items():
        alts = res["altitudes"]
        mass = res["masses"]
        dz = np.diff(alts)
        loss_rate = np.zeros_like(dz)
        valid = dz != 0
        loss_rate[valid] = np.abs(np.diff(mass)[valid] / dz[valid])
        axes[2].plot(loss_rate, alts[1:],
                     marker='o', markersize=4,
                     linestyle='-', linewidth=1.2,
                     label=mat)
    axes[2].set_xlabel("Mass Loss Rate (kg/km)")
    axes[2].set_ylabel("Altitude (km)")
    axes[2].set_title("Mass Loss Rate vs Altitude by Material")
    axes[2].grid(True)
    axes[2].legend(title="Material", fontsize=8, ncol=2)

    fig.suptitle(f"Figure 4: Mass, Lost Mass, and Loss Rate by Material (Satellite: {total_mass:.2f} kg)", fontsize=16)
    plt.tight_layout(rect=[0,0,1,0.96])
    plt.show()

############################################
# Figure 5: Mass Loss Rate by km for Each Material + Total
############################################
def plot_mass_loss_per_km_by_material(file_path, xml_path):
    """
    Two subplots: individual and total mass-loss rate.
    Figure 5: Mass Loss Rate by km vs Altitude (Satellite: XXX kg)
    """
    results = compute_results_by_material(file_path)
    total_mass = sum(load_materials_mass(xml_path).values())

    fig, axes = plt.subplots(2, 1, figsize=(10, 12))
    # Individual
    for mat, res in results.items():
        dz = np.diff(res["altitudes"])
        loss = np.zeros_like(dz)
        valid = dz != 0
        loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
        axes[0].plot(loss, res["altitudes"][1:],
                     marker='o', markersize=4,
                     linestyle='-', linewidth=1.2,
                     label=mat)
    axes[0].set_xlabel("Mass Loss per km (kg/km)")
    axes[0].set_ylabel("Altitude (km)")
    axes[0].set_title("Mass Loss Rate by Material")
    axes[0].grid(True)
    axes[0].legend(title="Material", fontsize=8, ncol=2)

    # Total
    all_alts = np.concatenate([res["altitudes"][1:] for res in results.values()])
    zmin, zmax = all_alts.min(), all_alts.max()
    common_z = np.linspace(zmin, zmax, 200)
    total_loss = np.zeros_like(common_z)
    for res in results.values():
        dz = np.diff(res["altitudes"])
        loss = np.zeros_like(dz)
        valid = dz != 0
        loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
        total_loss += np.interp(common_z, res["altitudes"][1:], loss, left=0, right=0)
    axes[1].plot(total_loss, common_z,
                 marker='o', markersize=4,
                 linestyle='-', linewidth=1.5,
                 color='black')
    axes[1].set_xlabel("Total Mass Loss per km (kg/km)")
    axes[1].set_ylabel("Altitude (km)")
    axes[1].set_title("Total Mass Loss Rate (All Materials)")
    axes[1].grid(True)

    fig.suptitle(f"Figure 5: Mass Loss Rate by km vs Altitude (Satellite: {total_mass:.2f} kg)", fontsize=16)
    plt.tight_layout(rect=[0,0,1,0.96])
    plt.show()

############################################
# Figure 6: Normalized Mass Loss Rate by km vs Altitude
############################################
def plot_normalized_mass_loss_per_km(file_path, xml_path):
    """
    Same as Figure 5 but normalized by the overall total initial mass.
    Figure 6: Normalized Mass Loss Rate by km vs Altitude (Satellite: XXX kg)
    """
    results = compute_results_by_material(file_path)
    total_mass = sum(load_materials_mass(xml_path).values())

    fig, axes = plt.subplots(2, 1, figsize=(10, 12))
    # Normalized individual
    for mat, res in results.items():
        dz = np.diff(res["altitudes"])
        loss = np.zeros_like(dz)
        valid = dz != 0
        loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
        norm_loss = loss / total_mass
        axes[0].plot(norm_loss, res["altitudes"][1:],
                     marker='o', markersize=4,
                     linestyle='-', linewidth=1.2,
                     label=mat)
    axes[0].set_xlabel("Normalized Mass Loss per km (1/km)")
    axes[0].set_ylabel("Altitude (km)")
    axes[0].set_title("Normalized Mass Loss Rate by Material (Overall)")
    axes[0].grid(True)
    axes[0].legend(title="Material", fontsize=8, ncol=2)

    # Normalized total
    all_alts = np.concatenate([res["altitudes"][1:] for res in results.values()])
    zmin, zmax = all_alts.min(), all_alts.max()
    common_z = np.linspace(zmin, zmax, 200)
    total_loss = np.zeros_like(common_z)
    for res in results.values():
        dz = np.diff(res["altitudes"])
        loss = np.zeros_like(dz)
        valid = dz != 0
        loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
        total_loss += np.interp(common_z, res["altitudes"][1:], loss, left=0, right=0)
    norm_total = total_loss / total_mass
    axes[1].plot(norm_total, common_z,
                 marker='o', markersize=4,
                 linestyle='-', linewidth=1.5,
                 color='black')
    axes[1].set_xlabel("Normalized Total Mass Loss per km (1/km)")
    axes[1].set_ylabel("Altitude (km)")
    axes[1].set_title("Normalized Total Mass Loss Rate")
    axes[1].grid(True)

    fig.suptitle(f"Figure 6: Normalized Mass Loss Rate by km vs Altitude (Satellite: {total_mass:.2f} kg)", fontsize=16)
    plt.tight_layout(rect=[0,0,1,0.96])
    plt.show()

############################################
# Example Usage
############################################
import matplotlib.pyplot as plt

# === Overwrite show pour qu'il ne ferme PLUS les figures ===
plt.show = lambda *args, **kwargs: None


import matplotlib.pyplot as plt
import os
from collections import defaultdict
import xml.etree.ElementTree as ET

if __name__ == "__main__":
    file_csv = "sizesat1000/Data_managment/MassMat_by_object_file.txt"
    file_xml = "sizesat1000/SARA/REENTRY/input/objects.xml"

    # Génération des graphiques (vos fonctions appellent plt.show(), 
    # mais ici ça ne fera rien)
    plot_contributions_by_material(file_csv, file_xml)
    plot_total_mass_by_material(file_csv, file_xml)
    plot_figure_4(file_csv, file_xml)
    plot_mass_loss_per_km_by_material(file_csv, file_xml)
    plot_normalized_mass_loss_per_km(file_csv, file_xml)

    # Calcul du poids total pour nommer le dossier
    from collections import defaultdict
    import xml.etree.ElementTree as ET
    def load_materials_mass(xml_path):
        tree = ET.parse(xml_path)
        mats = defaultdict(float)
        for obj in tree.getroot().findall('.//object'):
            m = float(obj.find('mass').text)
            q = int(obj.find('quantity').text)
            mats[obj.find('material').text] += m * q
        return mats

    total_mass = int(round(sum(load_materials_mass(file_xml).values())))
    dir_name = f"Graph{total_mass}"
    
    import os
    os.makedirs(dir_name, exist_ok=True)

    # Sauvegarde de toutes les figures ouvertes
    for num in plt.get_fignums():
        fig = plt.figure(num)
        fname = os.path.join(dir_name, f"{dir_name}_figure_{num}.png")
        fig.savefig(fname, dpi=300, bbox_inches='tight')
        print(f"Saved figure {num} → {fname}")
