#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
import os
from collections import defaultdict

# --- 0) Paths to adapt ---
csv_sam_copper    = 'SAM_Copper.csv'
csv_scarab_copper = 'SCARAB_Copper.csv'
tsv_file          = 'sizesat1000/Data_managment/MassMat_by_object_file.txt'
xml_file          = 'sizesat1000/SARA/REENTRY/input/objects.xml'

# --- 1) Load & processing functions ---
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

# --- 2) Load CSV copper models ---
df_cu_sam = pd.read_csv(csv_sam_copper)
df_cu_sca = pd.read_csv(csv_scarab_copper)
for df in (df_cu_sam, df_cu_sca):
    if ' y' in df.columns:
        df.rename(columns={' y': 'y'}, inplace=True)

# --- 3) Compute area under curve ---
area_cu_sam = np.trapz(df_cu_sam['x'], df_cu_sam['y'])
area_cu_sca = np.trapz(df_cu_sca['x'], df_cu_sca['y'])

# --- 4) Plot CSV models ---
plt.figure(figsize=(8,6))

# Color definitions (match previous model)
sam_color    = 'tab:blue'
scarab_color = 'tab:orange'
drama_color  = 'tab:green'

# SAM – Copper (solid)
plt.plot(df_cu_sam['y'], df_cu_sam['x'], '-', lw=2,
         color=sam_color,
         label=f'SAM – Copper (area={area_cu_sam:.2e})')

# SCARAB – Copper (dashed)
plt.plot(df_cu_sca['y'], df_cu_sca['x'], '-', lw=2,
         color=scarab_color,
         label=f'SCARAB – Copper (area={area_cu_sca:.2e})')

# --- 5) DRAMA Copper from tsv + xml ---
results = compute_results_by_material(tsv_file)
materials_mass = load_materials_mass(xml_file)
m_total = sum(materials_mass.values())

d = results['drama-Copper']
alts = d['altitudes']
masses = d['masses']

# calculate normalized mass loss
dz        = np.diff(alts)
loss_raw  = np.abs(np.diff(masses) / dz) / m_total
area_drama_cu = np.trapz(loss_raw, alts[1:])

# plot DRAMA Copper (solid)
plt.plot(loss_raw, alts[1:], '-', lw=2,
         color=drama_color,
         label=f'drama-Copper (area={area_drama_cu:.2e})')

# --- 6) Final formatting ---
plt.xlabel('Normalized mass loss per km [1/km]')
plt.ylabel('Altitude [km]')
plt.title('Copper model comparison')
plt.legend(loc='best')
plt.grid(True)
plt.tight_layout()

# --- 7) Save figure as PNG and PDF ---
script_dir = os.path.dirname(os.path.abspath(__file__))
out_dir    = os.path.join(script_dir, "figures")
os.makedirs(out_dir, exist_ok=True)

png_path = os.path.join(out_dir, "copper_deposition_comparison.png")
pdf_path = os.path.join(out_dir, "copper_deposition_comparison.pdf")
plt.savefig(png_path, dpi=300, bbox_inches="tight")
plt.savefig(pdf_path, format='pdf', bbox_inches="tight")
print(f"Saved {png_path!r}")
print(f"Saved {pdf_path!r}")

# --- 8) Display ---
plt.show()
