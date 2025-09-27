#!/usr/bin/env python
import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

def connect_points(x, y):
    x = np.array(x, dtype=float)
    y = np.array(y, dtype=float)
    mask = np.isfinite(x) & np.isfinite(y)
    x, y = x[mask], y[mask]
    sorted_idx = np.argsort(x)
    return x[sorted_idx], y[sorted_idx]

def main():
    plt.figure(figsize=(10, 6))

    # --- DRAMA Knudsen (green) ---
    dr_path = os.path.join("knudsen", "case1_DRAMA_Knudsen_altitude.csv")
    df_kn = pd.read_csv(dr_path)
    df_kn = df_kn[(df_kn["Altitude (km)"] >= 40) & (df_kn["Altitude (km)"] <= 120)]
    x_kn, y_kn = connect_points(df_kn["Altitude (km)"], df_kn["Knudsen"])
    plt.plot(x_kn, y_kn, label="DRAMA Knudsen", linewidth=2, color="green")

    # --- SCARAB Data (red dashed) ---
    sc_path = os.path.join("knudsen", "plot-data.csv")
    df_pd = pd.read_csv(sc_path)
    if "Altitude (km)" not in df_pd.columns or "Value" not in df_pd.columns:
        df_pd.columns = ["Altitude (km)", "Value"]
    df_pd = df_pd[(df_pd["Altitude (km)"] >= 40) & (df_pd["Altitude (km)"] <= 120)]
    x_pd, y_pd = connect_points(df_pd["Altitude (km)"], df_pd["Value"])
    plt.plot(x_pd, y_pd, label="SCARAB Data", linewidth=2, color="red")

    # --- Aesthetic tuning ---
    plt.xlabel("Altitude [km]", fontsize=12)
    plt.ylabel("Knudsen Number", fontsize=12)
    plt.title("Knudsen Number vs Altitude", fontsize=14, weight="bold")
    plt.yscale("log")
    plt.xlim(40, 120)
    plt.grid(True, which='both', linestyle=':', linewidth=0.7)
    plt.legend(fontsize=10)
    plt.tight_layout()

    # --- Save PNG & PDF ---
    script_dir = os.path.dirname(os.path.abspath(__file__))
    out_dir = os.path.join(script_dir, "knudsen")
    os.makedirs(out_dir, exist_ok=True)

    png_path = os.path.join(out_dir, "Knudsen_vs_Altitude.png")
    pdf_path = os.path.join(out_dir, "Knudsen_vs_Altitude.pdf")
    plt.savefig(png_path, dpi=300, bbox_inches="tight")
    plt.savefig(pdf_path, format="pdf", bbox_inches="tight")

    print(f"Figure saved to:\n  {png_path!r}\n  {pdf_path!r}")

    plt.show()

if __name__ == "__main__":
    main()
