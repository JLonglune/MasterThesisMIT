#!/usr/bin/env python
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.interpolate import make_interp_spline
from scipy.signal import savgol_filter

def smooth_curve(x, y, num_points=300):
    # Convert to numpy floats and drop non-finite
    x = np.array(x, dtype=float)
    y = np.array(y, dtype=float)
    mask = np.isfinite(x) & np.isfinite(y)
    x, y = x[mask], y[mask]

    # Sort & remove duplicates
    idx = np.argsort(x)
    x_sorted, y_sorted = x[idx], y[idx]
    ux, ui = np.unique(x_sorted, return_index=True)
    uy = y_sorted[ui]

    # Cubic spline interpolation
    x_new = np.linspace(ux.min(), ux.max(), num_points)
    spline = make_interp_spline(ux, uy, k=3)
    y_new = spline(x_new)

    # Savitzky–Golay smoothing
    wl = 21
    if wl > len(x_new):
        wl = len(x_new) if len(x_new) % 2 else len(x_new) - 1
    y_new = savgol_filter(y_new, window_length=wl, polyorder=3)

    return x_new, y_new

def main():
    plt.figure(figsize=(8,6))

    # --- DRAMA (with header row) ---
    drama_path = "relative_velocity/case1_DRAMA_velocity_altitude.csv"
    df_drama = pd.read_csv(drama_path, header=0)
    df_drama["Velocity (km/s)"] = pd.to_numeric(df_drama["Velocity (km/s)"], errors="coerce")
    df_drama["Altitude (km)"]   = pd.to_numeric(df_drama["Altitude (km)"],   errors="coerce")
    df_drama = df_drama.dropna(subset=["Velocity (km/s)", "Altitude (km)"])
    df_drama = df_drama[df_drama["Velocity (km/s)"].between(0, 8)]
    x_d, y_d = smooth_curve(df_drama["Velocity (km/s)"], df_drama["Altitude (km)"])
    plt.plot(x_d, y_d, label="DRAMA", linewidth=2, color="green")

    # --- SCARAB (no header row) ---
    scarab_path = "relative_velocity/SCARAB.csv"
    df_scarab = pd.read_csv(
        scarab_path,
        header=None,
        names=["Velocity (km/s)", "Altitude (km)"]
    )
    df_scarab["Velocity (km/s)"] = pd.to_numeric(df_scarab["Velocity (km/s)"], errors="coerce")
    df_scarab["Altitude (km)"]   = pd.to_numeric(df_scarab["Altitude (km)"],   errors="coerce")
    df_scarab = df_scarab.dropna(subset=["Velocity (km/s)", "Altitude (km)"])
    df_scarab = df_scarab[df_scarab["Velocity (km/s)"].between(0, 8)]
    x_s, y_s = smooth_curve(df_scarab["Velocity (km/s)"], df_scarab["Altitude (km)"])
    plt.plot(x_s, y_s, label="SCARAB", linewidth=2, color="red")

    # --- Final styling ---
    plt.xlabel("Relative Velocity [km/s]", fontsize=12)
    plt.ylabel("Altitude [km]", fontsize=12)
    plt.title("Velocity vs Altitude", fontsize=14)
    plt.grid(True, which="both", linestyle=":")
    plt.legend(fontsize=10)
    plt.tight_layout()

    # --- Save PNG & PDF ---
    script_dir = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(script_dir, "relative_velocity")
    os.makedirs(out_dir, exist_ok=True)

    png_path = os.path.join(out_dir, "Velocity_vs_Altitude.png")
    plt.savefig(png_path, dpi=300, bbox_inches="tight")

    pdf_path = os.path.join(out_dir, "Velocity_vs_Altitude.pdf")
    plt.savefig(pdf_path, format="pdf", bbox_inches="tight")

    print(f"Figure saved to:\n  {png_path!r}\n  {pdf_path!r}")

    plt.show()

if __name__ == "__main__":
    main()
