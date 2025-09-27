import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math
import xml.etree.ElementTree as ET
from collections import defaultdict
import shutil
import os
import csv

############################################
# Data Loading
############################################
def load_data(file_path):
    return pd.read_csv(file_path, sep="\t")

############################################
# Load total mass per material from XML
############################################
def load_materials_mass(xml_path):
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
# Compute Results
############################################
def compute_results_by_material(file_path):
    df = load_data(file_path)
    results = {}
    for material in df["Matériau"].unique():
        mat_df = df[df["Matériau"] == material]
        zmin, zmax = mat_df["Altitude (km)"].min(), mat_df["Altitude (km)"].max()
        altitude_grid = np.linspace(zmin, zmax, 100)
        mass_sum = np.zeros_like(altitude_grid)
        for obj in mat_df["Objet"].unique():
            sub = mat_df[mat_df["Objet"] == obj].sort_values("Altitude (km)")
            mass_sum += np.interp(altitude_grid, sub["Altitude (km)"], sub["Mass (kg)"])
        results[material] = {"altitudes": altitude_grid, "masses": mass_sum, "initial_mass": mass_sum[0]}
    return results

############################################
# Main Execution
############################################
if __name__ == "__main__":
    file_csv = "sizesat2583/Data_managment/MassMat_by_object_file.txt"
    file_xml = "sizesat2583/SARA/REENTRY/input/objects.xml"

    # Prevent matplotlib from closing figures
    plt.show = lambda *args, **kwargs: None

    # Compute total mass and create output directory
    total_mass = int(round(sum(load_materials_mass(file_xml).values())))
    dir_name = f"Graph{total_mass}"
    output_dir = os.path.join("sizesat2583", dir_name)
    os.makedirs(output_dir, exist_ok=True)

    # Save data files
    data_dir = os.path.join(output_dir, "data")
    os.makedirs(data_dir, exist_ok=True)
    shutil.copy(file_csv, os.path.join(data_dir, os.path.basename(file_csv)))
    shutil.copy(file_xml, os.path.join(data_dir, os.path.basename(file_xml)))

    # Load and save data for Figure 1
    df = load_data(file_csv)
    fig1_data_path = os.path.join(data_dir, "figure1_mass_per_object.csv")
    with open(fig1_data_path, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(["Material", "Object", "Altitude (km)", "Mass (kg)"])
        for material in df["Matériau"].unique():
            mat_df = df[df["Matériau"] == material]
            for obj in mat_df["Objet"].unique():
                sub = mat_df[mat_df["Objet"] == obj]
                for _, row in sub.iterrows():
                    writer.writerow([material, obj, row["Altitude (km)"], row["Mass (kg)"]])

    # Compute and save data for Figure 5.1 and 5.2
    results = compute_results_by_material(file_csv)
    fig51_data_path = os.path.join(data_dir, "figure5_1_loss_rate_by_material.csv")
    with open(fig51_data_path, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(["Material", "Altitude (km)", "Mass Loss Rate (kg/km)"])
        for mat, res in results.items():
            dz = np.diff(res["altitudes"])
            loss = np.zeros_like(dz)
            valid = dz != 0
            loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
            for alt, rate in zip(res["altitudes"][1:], loss):
                writer.writerow([mat, alt, rate])

    fig52_data_path = os.path.join(data_dir, "figure5_2_total_loss_rate.csv")
    all_alts = np.concatenate([res["altitudes"][1:] for res in results.values()])
    common_z = np.linspace(all_alts.min(), all_alts.max(), 200)
    total_loss = np.zeros_like(common_z)
    for res in results.values():
        dz = np.diff(res["altitudes"])
        loss = np.zeros_like(dz)
        valid = dz != 0
        loss[valid] = np.abs(np.diff(res["masses"])[valid] / dz[valid])
        total_loss += np.interp(common_z, res["altitudes"][1:], loss, left=0, right=0)

    with open(fig52_data_path, mode='w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(["Altitude (km)", "Total Mass Loss Rate (kg/km)"])
        for alt, rate in zip(common_z, total_loss):
            writer.writerow([alt, rate])
