#!/usr/bin/env python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
import os
from collections import defaultdict

# --- 0) Paths to adapt ---
csv_sam_titanium    = 'SAM_Titanium.csv'
csv_scarab_titanium = 'SCARAB_Titanium.csv'
tsv_file            = 'sizesat1000/Data_managment/MassMat_by_object_file.txt'
xml_file            = 'sizesat1000/SARA/REENTRY/input/objects.xml'

# --- 1) Load & processing functions ---
def load_data(file_path, sep='\t'):
    return pd.read_csv(file_path, sep=sep)

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
        objs = sub.get('Objet', pd.Series([None])).unique()
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

# --- 2) Load CSV titanium models ---
df_ti_sam = pd.read_csv(csv_sam_titanium)
df_ti_sca = pd.read_csv(csv_scarab_titanium)
for df in (df_ti_sam, df_ti_sca):
    if ' y' in df.columns:
        df.rename(columns={' y': 'y'}, inplace=True)

# --- 3) Compute area under CSV curves ---
area_ti_sam = np.trapz(df_ti_sam['x'], df_ti_sam['y'])
area_ti_sca = np.trapz(df_ti_sca['x'], df_ti_sca['y'])
print(f"Total normalized mass loss SAM – Titanium     : {area_ti_sam:.6e}")
print(f"Total normalized mass loss SCARAB – Titanium : {area_ti_sca:.6e}")

# --- 4) Compute DRAMA-TiAl6v4 mass loss ---
results = compute_results_by_material(tsv_file)
materials_mass = load_materials_mass(xml_file)
m_total = sum(materials_mass.values())

d = results['drama-TiAl6v4']
alts = d['altitudes']
masses = d['masses']
dz = np.diff(alts)
loss_raw = np.abs(np.diff(masses) / dz) / m_total
area_drama = np.trapz(loss_raw, alts[1:])
print(f"Total normalized mass loss drama-TiAl6v4       : {area_drama:.6e}")

# --- 5) Plotting ---
plt.figure(figsize=(10,7))

# Color definitions (matching previous plots)
sam_color    = 'tab:blue'
scarab_color = 'tab:orange'
drama_color  = 'tab:green'

# SAM – Titanium (solid)
plt.plot(df_ti_sam['y'], df_ti_sam['x'], '-', lw=2,
         color=sam_color,
         label=f'SAM – Titanium (area={area_ti_sam:.2e})')

# SCARAB – Titanium (dashed)
plt.plot(df_ti_sca['y'], df_ti_sca['x'], '-', lw=2,
         color=scarab_color,
         label=f'SCARAB – Titanium (area={area_ti_sca:.2e})')

# DRAMA – Titanium (dashed with marker)
plt.plot(loss_raw, alts[1:], '-', lw=2,
         color=drama_color,
         label=f'drama-TiAl6v4 (area={area_drama:.2e})')

# --- 6) Final formatting ---
plt.xlabel('Normalized mass loss per km [1/km]')
plt.ylabel('Altitude [km]')
plt.title('Titanium model comparison')
plt.legend(loc='best')
plt.grid(True)
plt.tight_layout()

# --- 7) Save figure as PNG and PDF ---
script_dir = os.path.dirname(os.path.abspath(__file__))
out_dir    = os.path.join(script_dir, "figures")
os.makedirs(out_dir, exist_ok=True)

png_path = os.path.join(out_dir, "titanium_deposition_comparison.png")
pdf_path = os.path.join(out_dir, "titanium_deposition_comparison.pdf")
plt.savefig(png_path, dpi=300, bbox_inches="tight")
plt.savefig(pdf_path, format='pdf', bbox_inches="tight")
print(f"Saved {png_path!r}")
print(f"Saved {pdf_path!r}")

# --- 8) Display plot ---
plt.show()
