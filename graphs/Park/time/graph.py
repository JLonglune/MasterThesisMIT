#!/usr/bin/env python
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline

def smooth_curve(x, y, num_points=300):
    x = np.array(x)
    y = np.array(y)
    mask = np.isfinite(x) & np.isfinite(y)
    x = x[mask]
    y = y[mask]
    sorted_indices = np.argsort(x)
    x_sorted = x[sorted_indices]
    y_sorted = y[sorted_indices]
    unique_x, unique_indices = np.unique(x_sorted, return_index=True)
    unique_y = y_sorted[unique_indices]
    if len(unique_x) < 4:
        return unique_x, unique_y
    x_new = np.linspace(unique_x.min(), unique_x.max(), num_points) 
    spline = make_interp_spline(unique_x, unique_y, k=3)
    y_new = spline(x_new)
    return x_new, y_new

def interpolate_time(x, y, target_alt):
    # Interpolation inverse : altitude → temps
    x = np.array(x)
    y = np.array(y)
    mask = np.isfinite(x) & np.isfinite(y)
    x = x[mask]
    y = y[mask]
    sorted_indices = np.argsort(y)
    y_sorted = y[sorted_indices]
    x_sorted = x[sorted_indices]
    if y_sorted.min() <= target_alt <= y_sorted.max():
        return np.interp(target_alt, y_sorted, x_sorted)
    return np.nan

def main():
    # --- Chargement des données ---
    df = pd.read_csv("time/TimeVSAlt.csv", delimiter=";", header=[0, 1])
    df.columns = ["SCARAB_x", "SCARAB_y", "ORSAT_x", "ORSAT_y", "Present_x", "Present_y"]

    curves = {
    "SCARAB":  ("SCARAB_x",  "SCARAB_y",  "red"),
    "ORSAT":   ("ORSAT_x",   "ORSAT_y",   "blue"),
    "Present": ("Present_x","Present_y","black"),
    }

    present_x, present_y = None, None

    # Trace SCARAB, ORSAT, Present
    for label, (xcol, ycol, color) in curves.items():
        x, y = smooth_curve(df[xcol], df[ycol])
        if label == "Park":
            present_x, present_y = x, y
        plt.plot(x, y, label=label, linewidth=2, color=color)

    # --- DRAMA ---
    df_drama = pd.read_csv("time/case1_DRAMA.csv")
    x_drama, y_drama = smooth_curve(df_drama["Temps (s)"], df_drama["Altitude (km)"])
    plt.plot(x_drama, y_drama, label="DRAMA",linewidth=2, color="green")

    # # --- Différences à 90 km et 1 km ---
    # for alt_target in [90, 1]:
    #     time_present = interpolate_time(present_x, present_y, alt_target)
    #     time_drama = interpolate_time(x_drama, y_drama, alt_target)

    #     if not np.isnan(time_present) and not np.isnan(time_drama):
    #         diff = round(time_drama - time_present, 2)
    #         mid_time = (time_drama + time_present) / 2
    #         plt.plot([time_present, time_drama], [alt_target, alt_target], 'k--')
    #         plt.annotate(
    #             f"Diff @ {alt_target} km: {diff} s",
    #             (mid_time, alt_target),
    #             textcoords="offset points",
    #             xytext=(0, 10),
    #             ha='center',
    #             fontsize=9,
    #             color='black'
    #         )
    #     else:
    #         print(f"[⚠️] Impossible d'interpoler à {alt_target} km")

    # --- Paramètres du graphe ---
    plt.xlabel("Time [s]", fontsize=12)
    plt.ylabel("Altitude [km]", fontsize=12)
    plt.title("Altitude vs Time", fontsize=14)
    plt.legend(fontsize=10)
    plt.grid(True, which="both", linestyle=":")
    plt.tight_layout()

    # --- Enregistrement automatique dans time/ ---
    script_dir = os.path.dirname(__file__)
    out_dir = os.path.join(script_dir, "time")
    # save as PNG
    outpath_png = os.path.join(out_dir, "Altitude_vs_Time.png")
    plt.savefig(outpath_png, dpi=300, bbox_inches="tight")

    # save as PDF
    outpath_pdf = os.path.join(out_dir, "Altitude_vs_Time.pdf")
    plt.savefig(outpath_pdf, format="pdf", bbox_inches="tight")
    print(f"Also saved PDF to {outpath_pdf!r}")
    plt.savefig(out_dir, dpi=300, bbox_inches="tight")
    print(f"Figure saved to {out_dir!r}")

    # --- Affichage à l'écran ---
    plt.show()

if __name__ == "__main__":
    main()
