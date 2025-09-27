#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
import os
from collections import defaultdict

# --- 0) Paths to adapt ---
csv_improved = 'SAM_Al_improvedmatmodel.csv'
csv_scarab   = 'SAM_Al_scarabmatmodel.csv'
csv_alum     = 'SCARAB_alum.csv'
tsv_file     = 'sizesat1000/Data_managment/MassMat_by_object_file.txt'
xml_file     = 'sizesat1000/SARA/REENTRY/input/objects.xml'

# --- 1) Load and process data ---
def load_data(file_path):
    return pd.read_csv(file_path, sep='\t')

def load_materials_mass(xml_path):
    tree = ET.parse(xml_path)
    mats = defaultdict(float)
    for obj in tree.getroot().findall('.//object'):
        mat = obj.find('material').text
        m   = float(obj.find('mass').text)
        q   = int(obj.find('quantity').text)
        mats[mat] += m * q
    return mats

def compute_results_by_material(file_path):
    df = load_data(file_path)
    results = {}
    for material in df['Matériau'].unique():
        sub = df[df['Matériau'] == material]
        zmin, zmax = sub['Altitude (km)'].min(), sub['Altitude (km)'].max()
        alt_grid = np.linspace(zmin, zmax, 100)
        mass_sum = np.zeros_like(alt_grid)
        objs = sub['Objet'].unique() if 'Objet' in sub.columns else [None]
        for obj in objs:
            part = sub[sub['Objet'] == obj] if obj is not None else sub
            part = part.sort_values('Altitude (km)')
            mass_sum += np.interp(
                alt_grid,
                part['Altitude (km)'].values,
                part['Mass (kg)'].values
            )
        results[material] = {'altitudes': alt_grid, 'masses': mass_sum}
    return results

# --- 2) Load CSVs ---
df_imp = pd.read_csv(csv_improved)
df_sca = pd.read_csv(csv_scarab)
df_alu = pd.read_csv(csv_alum)
for df in (df_imp, df_sca, df_alu):
    if ' y' in df.columns:
        df.rename(columns={' y': 'y'}, inplace=True)

# --- 3) Plot CSV models and compute areas ---
plt.figure(figsize=(8,6))

area_imp = np.trapz(df_imp['x'], df_imp['y'])
area_sca = np.trapz(df_sca['x'], df_sca['y'])
area_alu = np.trapz(df_alu['x'], df_alu['y'])

# Colors
sam_color   = 'tab:blue'
scarab_color = 'tab:orange'
drama_color = 'tab:green'

# SAM – Improved (solid) & SAM – SCARAB (dashed)
plt.plot(df_imp['y'], df_imp['x'], '-', lw=2,
         color=sam_color,
         label=f'SAM – Improved (area={area_imp:.2e})')
plt.plot(df_sca['y'], df_sca['x'], '--', lw=1,
         color=sam_color,
         label=f'SAM – SCARAB (area={area_sca:.2e})')

# SCARAB – alum
plt.plot(df_alu['y'], df_alu['x'], '-', lw=2,
         color=scarab_color,
         label=f'SCARAB – alum (area={area_alu:.2e})')

# --- 4) Extract and align DRAMA materials ---
results = compute_results_by_material(tsv_file)
m_total = sum(load_materials_mass(xml_file).values())

d1 = results['drama-AA7075']
d2 = results['drama-HC-AA7075']

alts_common = d1['altitudes']
m1 = np.interp(alts_common, d1['altitudes'], d1['masses'], left=0, right=0)
m2 = np.interp(alts_common, d2['altitudes'], d2['masses'], left=0, right=0)

# --- 5) Compute normalized mass loss and areas ---
combined_m    = m1 + m2
combined_loss = np.abs(np.diff(combined_m) / np.diff(alts_common)) / m_total

loss_raw     = combined_loss
area_raw     = np.trapz(loss_raw, alts_common[1:])
smoothed_loss = pd.Series(loss_raw).rolling(window=10, center=True, min_periods=1).mean().to_numpy()
area_smooth  = np.trapz(smoothed_loss, alts_common[1:])

# Plot DRAMA raw (dashed) & smooth (solid)
plt.plot(loss_raw, alts_common[1:], '--', lw=1,
         color=drama_color,
         label=f'drama-Aluminium (raw, area={area_raw:.2e})')
plt.plot(smoothed_loss, alts_common[1:], '-', lw=2,
         color=drama_color,
         label=f'drama-Aluminium (smooth, area={area_smooth:.2e})')

# --- 6) Final formatting ---
plt.xlabel('Normalized mass loss per km [1/km]')
plt.ylabel('Altitude [km]')
plt.title("Model comparison for normalized aluminium deposition")
plt.legend(loc='best')
plt.grid(True)
plt.tight_layout()

# --- 7) Save figure as PNG and PDF ---
script_dir = os.path.dirname(os.path.abspath(__file__))
out_dir    = os.path.join(script_dir, "figures")
os.makedirs(out_dir, exist_ok=True)

png_path = os.path.join(out_dir, "aluminum_deposition_comparison.png")
pdf_path = os.path.join(out_dir, "aluminum_deposition_comparison.pdf")
plt.savefig(png_path, dpi=300, bbox_inches="tight")
plt.savefig(pdf_path, format='pdf', bbox_inches="tight")
print(f"Saved {png_path!r}")
print(f"Saved {pdf_path!r}")

# --- 8) Display ---
plt.show()
