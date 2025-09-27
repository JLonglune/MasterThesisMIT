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
plots_dir = 'drama_plots'
data_dir  = 'drama_data'
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

# --- Process individual materials ---
materials = [
    'drama-AA7075', 'drama-HC-AA7075', 'drama-A316', 'drama-Bat-NiCd',
    'drama-CFRP', 'drama-Copper', 'drama-El-Mat',
    'drama-SolarPanel-Mat', 'drama-TiAl6v4'
]
for mat in materials:
    d = results[mat]
    alts = d['altitudes']
    masses = d['masses']

    # 1) Compute absolute loss per km (kg/km)
    loss = np.abs(np.diff(masses) / np.diff(alts))

    # 2) Compute smoothed curve (rolling average, window=10)
    smoothed = (
        pd.Series(loss)
          .rolling(window=10, center=True, min_periods=1)
          .mean()
          .to_numpy()
    )

    # 3) Compute area under brute and smoothed curves
    area_raw     = np.trapz(loss, alts[1:])
    area_smoothed= np.trapz(smoothed, alts[1:])

    # 4) Affichage dans le terminal
    print(f"{mat} : aire brute = {area_raw:.2f} kg, aire lissée = {area_smoothed:.2f} kg")

    # 5) Save individual plot with both courbes
    plt.figure()
    plt.plot(loss, alts[1:], '-', lw=2, label='Brut')
    plt.plot(smoothed, alts[1:], '--', lw=2, label='Lissé')
    plt.xlabel('Mass loss per km [kg/km]')
    plt.ylabel('Altitude [km]')
    plt.title(f'{mat} Loss Profile\nAire brut={area_raw:.2f} kg • lissé={area_smoothed:.2f} kg')
    plt.legend(loc='best')
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(os.path.join(plots_dir, f'{mat}.png'))
    plt.close()

    # 6) Save individual data
    df_out = pd.DataFrame({
        'Altitude_km':        alts[1:],
        'Loss_raw_kg_per_km': loss,
        'Loss_smoothed_kg_per_km': smoothed
    })
    df_out.to_csv(os.path.join(data_dir, f'{mat}.csv'), index=False)

# --- Process combined Aluminium (drama-AA7075 + drama-HC-AA7075) ---
d1 = results['drama-AA7075']
d2 = results['drama-HC-AA7075']
alts = d1['altitudes']
m1 = d1['masses']
m2 = d2['masses']

# Compute combined absolute loss per km
combined_loss = np.abs(np.diff(m1 + m2) / np.diff(alts))
smoothed_combined = (
    pd.Series(combined_loss)
      .rolling(window=10, center=True, min_periods=1)
      .mean()
      .to_numpy()
)

# Areas
area_comb_raw = np.trapz(combined_loss, alts[1:])
area_comb_smooth = np.trapz(smoothed_combined, alts[1:])
print(f"drama-Aluminium combiné : aire brute = {area_comb_raw:.2f} kg, aire lissée = {area_comb_smooth:.2f} kg")

# Plot combined
plt.figure()
plt.plot(combined_loss, alts[1:], '-', lw=1.5, label='Brut combiné')
plt.plot(smoothed_combined, alts[1:], '--', lw=2, label='Lissé combiné')
plt.xlabel('Mass loss per km [kg/km]')
plt.ylabel('Altitude [km]')
plt.title(f'drama-Aluminium Loss Profile\nAire brut={area_comb_raw:.2f} kg • lissé={area_comb_smooth:.2f} kg')
plt.legend(loc='best')
plt.grid(True)
plt.tight_layout()
plt.savefig(os.path.join(plots_dir, 'drama-Aluminium.png'))
plt.close()

# Save combined data
df_combined = pd.DataFrame({
    'Altitude_km':              alts[1:],
    'Loss_raw_kg_per_km':       combined_loss,
    'Loss_smoothed_kg_per_km':  smoothed_combined
})
df_combined.to_csv(os.path.join(data_dir, 'drama-Aluminium.csv'), index=False)

print('Plots saved in', plots_dir)
print('Data saved in', data_dir)
