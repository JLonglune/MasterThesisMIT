#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
size_comparison.py

Generates:
- Fig. 5.2: Total mass loss rate vs altitude
- Fig. 6.2: Normalized total mass loss rate vs altitude

Usage:
    python size_comparison.py
    python size_comparison.py -m 67 1292
"""

import os
import runpy
import argparse
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Default satellite masses (kg)
DEFAULT_MASSES = [67, 525, 1292, 2583]

def get_paths(sat_dir):
    dm = os.path.join(sat_dir, "Data_managment")
    script_py = os.path.join(dm, "AeroThermal_MatAblationVSAlt.py")
    data_file = os.path.join(dm, "MassMat_by_object_file.txt")
    xml_file  = os.path.join(sat_dir, "SARA", "REENTRY", "input", "objects.xml")
    for p in (script_py, data_file, xml_file):
        if not os.path.isfile(p):
            raise FileNotFoundError(f"Missing file: {p}")
    return script_py, data_file, xml_file

def compute_results(script_py, data_file):
    globs = runpy.run_path(script_py)
    if "compute_results_by_material" not in globs:
        raise KeyError("compute_results_by_material not defined in the script")
    results = globs["compute_results_by_material"](data_file)
    return results, globs

def total_loss_rate(results, smooth_window=10):
    all_z = np.concatenate([r["altitudes"][1:] for r in results.values()])
    zs = np.linspace(all_z.min(), all_z.max(), 200)
    loss = np.zeros_like(zs)
    for r in results.values():
        dz = np.diff(r["altitudes"])
        raw_loss = np.zeros_like(dz)
        valid = dz != 0
        raw_loss[valid] = np.abs(np.diff(r["masses"])[valid] / dz[valid])

        # Apply smoothing
        smoothed_loss = (
            pd.Series(raw_loss)
            .rolling(window=smooth_window, center=True, min_periods=1)
            .mean()
            .to_numpy()
        )

        # Interpolate onto shared altitude grid
        loss += np.interp(zs, r["altitudes"][1:], smoothed_loss, left=0, right=0)
    return zs, loss

def parse_args():
    p = argparse.ArgumentParser(description="Compare total and normalized mass loss rates for various satellite sizes.")
    p.add_argument(
        "-m", "--masses",
        type=int, nargs="+",
        default=DEFAULT_MASSES,
        help=f"Satellite masses to compare (default: {DEFAULT_MASSES})"
    )
    return p.parse_args()

def main():
    args = parse_args()
    MASSES = args.masses

    fig5, ax5 = plt.subplots(figsize=(8,6))  # Total loss rate
    fig6, ax6 = plt.subplots(figsize=(8,6))  # Normalized loss rate
    base = os.path.dirname(__file__)
    out = os.path.join(base, "comparison_plots")
    os.makedirs(out, exist_ok=True)

    # Color palette
    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
    alt_max = 0

    for idx, m in enumerate(MASSES):
        sat_dir = os.path.join(base, f"sizesat{m}")
        script_py, data_file, xml_file = get_paths(sat_dir)

        results, globs = compute_results(script_py, data_file)
        zs, loss = total_loss_rate(results)

        alt_max = max(alt_max, zs.max())

        color = colors[idx % len(colors)]
        ax5.plot(loss, zs, color=color, linewidth=2.0, label=f"{m} kg")

        total_mass = sum(globs["load_materials_mass"](xml_file).values())
        normalized_loss = loss / total_mass
        ax6.plot(normalized_loss, zs, color=color, linewidth=2.0, label=f"{m} kg")

    # Common settings
    for ax in [ax5, ax6]:
        ax.set_ylim(0, alt_max)
        ax.grid(True)

    # Figure 5.2 – Total loss
    ax5.set_xlabel("Total Mass Loss Rate (kg/km)")
    ax5.set_ylabel("Altitude (km)")
    ax5.set_title("Fig. 5.2 – Total Mass Loss Rate vs Altitude")
    ax5.legend(title="Satellite mass", loc='upper left', bbox_to_anchor=(1, 1))

    # Figure 6.2 – Normalized loss
    ax6.set_xlabel("Normalized Mass Loss Rate (1/km)")
    ax6.set_ylabel("Altitude (km)")
    ax6.set_title("Fig. 6.2 – Normalized Mass Loss Rate vs Altitude")
    ax6.legend(title="Satellite mass", loc='upper left', bbox_to_anchor=(1, 1))

    # Save figures
    fig5.savefig(os.path.join(out, "fig5_2_total_loss_rate.png"), dpi=300, bbox_inches='tight')
    fig6.savefig(os.path.join(out, "fig6_2_normalized_loss_rate.png"), dpi=300, bbox_inches='tight')
    print(f"[OK] Figures saved in {out}/")

if __name__ == "__main__":
    main()
