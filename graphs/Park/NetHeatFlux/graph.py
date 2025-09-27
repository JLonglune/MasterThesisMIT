import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline
from scipy.signal import savgol_filter

def smooth_curve(x, y, num_points=300):
    # Convertir en tableaux numpy en float
    x = np.array(x, dtype=float)
    y = np.array(y, dtype=float)
    
    # Filtrer les valeurs non-finies
    mask = np.isfinite(x) & np.isfinite(y)
    x = x[mask]
    y = y[mask]
    
    # Trier les données par x
    sorted_indices = np.argsort(x)
    x_sorted = x[sorted_indices]
    y_sorted = y[sorted_indices]
    
    # Supprimer les doublons dans x en gardant la première occurrence
    unique_x, unique_indices = np.unique(x_sorted, return_index=True)
    unique_y = y_sorted[unique_indices]
    
    # Créer un ensemble dense de valeurs x
    x_new = np.linspace(unique_x.min(), unique_x.max(), num_points)
    
    # Interpolation par spline cubique
    spline = make_interp_spline(unique_x, unique_y, k=3)
    y_new = spline(x_new)
    
    # Lissage supplémentaire avec Savitzky–Golay
    window_length = 21
    if window_length > len(x_new):
        window_length = len(x_new) if len(x_new) % 2 == 1 else len(x_new) - 1
    y_new = savgol_filter(y_new, window_length=window_length, polyorder=3)
    
    return x_new, y_new

plt.figure(figsize=(10, 6))

# --- DRAMA Heat Flux ---
# Le fichier DRAMA contient les colonnes 'Convective Heat [W]' et 'Altitude (km)'
df_drama = pd.read_csv("NetHeatFlux/case1_DRAMA_heat_alt.csv", header=0)
print("DRAMA columns:", df_drama.columns.tolist())
# Utilisation de l'altitude comme axe des x et du heat flux comme y
x_drama, y_drama = smooth_curve(df_drama["Altitude (km)"], df_drama["Convective Heat [W]"])
plt.plot(x_drama, y_drama, label="DRAMA Heat Flux", linewidth=4)

# --- ORSAT Heat Flux ---
# On suppose que le fichier ORSAT possède une colonne "Altitude (km)" et une colonne "Heatflux (W/m²)"
df_orsat = pd.read_csv("NetHeatFlux/ORSAT.csv", header=0)
print("ORSAT columns:", df_orsat.columns.tolist())
x_orsat, y_orsat = smooth_curve(df_orsat["Altitude (km)"], df_orsat["Heatflux (W/m²)"])
plt.plot(x_orsat, y_orsat, label="ORSAT Heat Flux", linewidth=4)

# --- SCARAB Heat Flux ---
# On suppose que le fichier SCARAB possède une colonne "Altitude (km)" et une colonne "Heatflux (W/m²)"
df_scarab = pd.read_csv("NetHeatFlux/SCARAB.csv", header=0)
print("SCARAB columns:", df_scarab.columns.tolist())
x_scarab, y_scarab = smooth_curve(df_scarab["Altitude (km)"], df_scarab["Heatflux (W/m²)"])
plt.plot(x_scarab, y_scarab, label="SCARAB Heat Flux", linewidth=4)

plt.xlabel("Altitude (km)")
plt.ylabel("Heat Flux")
plt.title("Smooth Heat Flux vs Altitude")
plt.legend()
plt.grid(True)
plt.show()
