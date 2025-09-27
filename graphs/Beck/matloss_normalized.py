import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
from collections import defaultdict

# --- 0) CHEMINS À ADAPTER ---
tsv_file     = 'sizesat1000/Data_managment/MassMat_by_object_file.txt'
xml_file     = 'sizesat1000/SARA/REENTRY/input/objects.xml'

# --- Create output directories ---
plots_dir = 'Normalized/drama_plots'
data_dir  = 'Normalized/drama_data'
os.makedirs(plots_dir, exist_ok=True)
os.makedirs(data_dir, exist_ok=True)

# --- 1) Fonctions de chargement & calcul ---
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

# --- Load data and compute ---
results = compute_results_by_material(tsv_file)
m_total = sum(load_materials_mass(xml_file).values())

# --- Process individual materials ---
materials = ['drama-AA7075', 'drama-HC-AA7075', 'drama-A316', 'drama-Bat-NiCd', 'drama-CFRP', 'drama-Copper', 'drama-El-Mat', 'drama-SolarPanel-Mat', 'drama-TiAl6v4']
for mat in materials:
    d = results[mat]
    alts = d['altitudes']
    masses = d['masses']

    # Compute normalized loss per km
    loss = np.abs(np.diff(masses) / np.diff(alts)) / m_total

    # Save individual plot
    plt.figure()
    plt.plot(loss, alts[1:], '-', lw=2)
    plt.xlabel('Normalized mass loss per km [1/km]')
    plt.ylabel('Altitude [km]')
    plt.title(f'{mat} Loss Profile')
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(os.path.join(plots_dir, f'{mat}.png'))
    plt.close()

    # Save individual data
    df_out = pd.DataFrame({
        'Altitude_km': alts[1:],
        'Loss_per_km': loss
    })
    df_out.to_csv(os.path.join(data_dir, f'{mat}.csv'), index=False)

# --- Process combined Aluminium (drama-AA7075 + drama-HC-AA7075) ---
d1 = results['drama-AA7075']
d2 = results['drama-HC-AA7075']
alts = d1['altitudes']
m1 = d1['masses']
m2 = d2['masses']

# Compute combined normalized loss per km
combined_m = m1 + m2
combined_loss = np.abs(np.diff(combined_m) / np.diff(alts)) / m_total

# Compute smoothed loss (rolling average)
smoothed_loss = (
    pd.Series(combined_loss)
      .rolling(window=10, center=True, min_periods=1)
      .mean()
      .to_numpy()
)

# Save combined plot with raw and smoothed curves
plt.figure()
plt.plot(combined_loss, alts[1:], '-', lw=1.5, label='Raw combined')
plt.plot(smoothed_loss, alts[1:], '--', lw=2, label='Smoothed combined')
plt.xlabel('Normalized mass loss per km [1/km]')
plt.ylabel('Altitude [km]')
plt.title('drama-Aluminium Loss Profile')
plt.legend(loc='best')
plt.grid(True)
plt.tight_layout()
plt.savefig(os.path.join(plots_dir, 'drama-Aluminium.png'))
plt.close()

# Save combined data with raw and smoothed loss
df_combined = pd.DataFrame({
    'Altitude_km': alts[1:],
    'Loss_per_km_raw': combined_loss,
    'Loss_per_km_smoothed': smoothed_loss
})
df_combined.to_csv(os.path.join(data_dir, 'drama-Aluminium.csv'), index=False)

print('Plots saved in', plots_dir)
print('Data saved in', data_dir)
