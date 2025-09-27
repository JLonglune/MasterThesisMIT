#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compare_figure2_and_4_3_materials.py

– Compare la Figure 2 (Total Mass vs Altitude) par matériau et satellite
– Génère la Figure 4.3 (Mass Loss Rate vs Altitude) pour chaque matériau,
  avec une courbe par satellite.

Structure attendue sous la racine du projet :
  • sizesat<M>/Data_managment/AeroThermal_MatAblationVSAlt.py
  • sizesat<M>/Data_managment/MassMat_by_object_file.txt
  • sizesat<M>/SARA/REENTRY/input/objects.xml

Usage :
  python compare_figure2_and_4_3_materials.py
  python compare_figure2_and_4_3_materials.py -s 67 1292 -m Aluminum Copper
"""

import os
import runpy
import argparse
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Masses satellites par défaut
DEFAULT_SATS = [67, 525, 1292, 2583]

def parse_args():
    p = argparse.ArgumentParser(
        description="Comparer Fig.2 et Fig.4.3 par matériau et par satellite"
    )
    p.add_argument(
        "-s", "--sats",
        type=int, nargs="+",
        default=DEFAULT_SATS,
        help=f"Masses de satellites à comparer (défaut: {DEFAULT_SATS})"
    )
    p.add_argument(
        "-m", "--materials",
        type=str, nargs="*",
        help="Matériaux à tracer (défaut: tous présents)"
    )
    return p.parse_args()

def get_paths(root_dir, sat_mass):
    sat_dir    = os.path.join(root_dir, f"sizesat{sat_mass}")
    dm         = os.path.join(sat_dir, "Data_managment")
    script_py  = os.path.join(dm, "AeroThermal_MatAblationVSAlt.py")
    data_file  = os.path.join(dm, "MassMat_by_object_file.txt")
    xml_path   = os.path.join(sat_dir, "SARA", "REENTRY", "input", "objects.xml")

    for path, desc in ((script_py, "script"), (data_file, "données"), (xml_path, "XML")):
        if not os.path.isfile(path):
            raise FileNotFoundError(f"{desc.capitalize()} introuvable : {path}")
    return script_py, data_file, xml_path

def load_results(script_py, data_file):
    globs = runpy.run_path(script_py)
    if "compute_results_by_material" not in globs:
        raise KeyError("compute_results_by_material introuvable dans le script")
    return globs["compute_results_by_material"](data_file)

def main():
    args = parse_args()
    sats = args.sats

    # 1) Racine du projet = dossier contenant ce script
    project_root = os.path.abspath(os.path.dirname(__file__))

    # 2) Charger pour chaque satellite
    all_results = {}
    all_xml     = {}
    for m in sats:
        script_py, data_file, xml_path = get_paths(project_root, m)
        results = load_results(script_py, data_file)
        all_results[m] = results
        all_xml[m]     = xml_path

    # 3) Déterminer la liste des matériaux
    if args.materials:
        materials = args.materials
    else:
        mats = set()
        for res in all_results.values():
            mats.update(res.keys())
        materials = sorted(mats)

    # 4) Préparer dossier de sortie
    out_dir = os.path.join(project_root, "comparison_plots_fig34")
    os.makedirs(out_dir, exist_ok=True)

    # 5) Palette matplotlib
    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']

    # ——— FIGURE 2 : Total Mass vs Altitude par matériau ———
    for idx_mat, mat in enumerate(materials):
        fig, ax = plt.subplots(figsize=(8, 6))
        alt_max = 0
        for idx_sat, m in enumerate(sats):
            results = all_results[m]
            if mat not in results:
                print(f"[!] {mat} absent pour satellite {m} kg, skip")
                continue

            alts   = results[mat]["altitudes"]
            masses = results[mat]["masses"]
            alt_max = max(alt_max, alts.max())

            color = colors[idx_sat % len(colors)]
            masses_smoothed = pd.Series(masses).rolling(window=10, center=True, min_periods=1).mean().to_numpy()
            ax.plot(
                masses_smoothed, alts,
                color=color, linewidth=2.0,
                label=f"{m} kg"
            )


        ax.set_xlabel("Mass (kg)")  
        ax.set_ylabel("Altitude (km)")
        ax.set_title(f"Fig. 2 – Material: {mat}")
        ax.set_ylim(0, alt_max)
        ax.grid(True)
        ax.legend(title="Satellite mass", loc="upper left", bbox_to_anchor=(1,1))

        safe = mat.replace(" ", "_").replace("/", "_")
        fname = os.path.join(out_dir, f"fig34_{safe}.png")
        fig.savefig(fname, dpi=300, bbox_inches='tight')
        plt.close(fig)
        print(f"[OK] {fname}")

    # ——— FIGURE 4.3 : Mass Loss Rate vs Altitude pour chaque matériau ———
    for idx_mat, mat in enumerate(materials):
        fig, ax = plt.subplots(figsize=(8, 6))
        for idx_sat, m in enumerate(sats):
            results = all_results[m]
            if mat not in results:
                continue
            alts  = results[mat]["altitudes"]
            mass  = results[mat]["masses"]
            dz    = np.diff(alts)
            loss_rate = np.zeros_like(dz)
            valid = dz != 0
            loss_rate[valid] = np.abs(np.diff(mass)[valid] / dz[valid])

            # Smooth using rolling average (window=5)
            loss_rate_smoothed = (
                pd.Series(loss_rate)
                .rolling(window=10, center=True, min_periods=1)
                .mean()
                .to_numpy()
)


            color = colors[idx_sat % len(colors)]
            ax.plot(
                loss_rate_smoothed, alts[1:],
                color=color, linewidth=2.0,
                label=f"{m} kg"
            )


        ax.set_xlabel("Mass Loss Rate (kg/km)")
        ax.set_ylabel("Altitude (km)")
        ax.set_title(f"Fig. 4.3 – Mass Loss Rate vs Altitude\nMaterial: {mat}")
        ax.grid(True)
        ax.legend(title="Satellite mass", loc="upper left", bbox_to_anchor=(1,1))

        safe = mat.replace(" ", "_").replace("/", "_")
        fname = os.path.join(out_dir, f"fig4_3_{safe}.png")
        fig.savefig(fname, dpi=300, bbox_inches='tight')
        plt.close(fig)
        print(f"[OK] {fname}")

            # === Mass vs Altitude pour tous les matériaux (Fig. 2 combinée) ===
    fig2, axes2 = plt.subplots(len(materials), 1, figsize=(10, 4 * len(materials)), sharex=False)

    if len(materials) == 1:
        axes2 = [axes2]

    for idx_mat, mat in enumerate(materials):
        ax = axes2[idx_mat]
        alt_max = 0
        for idx_sat, m in enumerate(sats):
            results = all_results[m]
            if mat not in results:
                continue
            alts = results[mat]["altitudes"]
            mass = results[mat]["masses"]
            alt_max = max(alt_max, alts.max())

            color = colors[idx_sat % len(colors)]
            mass_smoothed = pd.Series(mass).rolling(window=10, center=True, min_periods=1).mean().to_numpy()
            ax.plot(mass_smoothed, alts, color=color, linewidth=2.0, label=f"{m} kg")


        ax.set_ylabel("Altitude (km)")
        ax.set_title(f"[{mat}] Mass vs Altitude")
        ax.grid(True)

        if idx_mat == 0:
            ax.legend(title="Satellite mass", loc="upper right")

    axes2[-1].set_xlabel("Mass (kg)")
    fig2.tight_layout(h_pad=2.5)
    combined_fig2_path = os.path.join(out_dir, "all_materials_combined_fig2.png")
    fig2.savefig(combined_fig2_path, dpi=300, bbox_inches="tight")
    print(f"[OK] {combined_fig2_path}")

        # === Mass Loss Rate vs Altitude pour tous les matériaux (Fig. 4.3 combinée) ===
    fig43, axes43 = plt.subplots(len(materials), 1, figsize=(10, 4 * len(materials)), sharex=False)

    if len(materials) == 1:
        axes43 = [axes43]

    for idx_mat, mat in enumerate(materials):  # ✅ Boucle sur les matériaux
        ax = axes43[idx_mat]
        for idx_sat, m in enumerate(sats):
            results = all_results[m]
            if mat not in results:
                continue

            alts = results[mat]["altitudes"]
            mass = results[mat]["masses"]
            dz = np.diff(alts)
            loss_rate = np.zeros_like(dz)
            valid = dz != 0
            loss_rate[valid] = np.abs(np.diff(mass)[valid] / dz[valid])
            loss_rate_smoothed = (
                pd.Series(loss_rate)
                .rolling(window=10, center=True, min_periods=1)
                .mean()
                .to_numpy()
            )

            color = colors[idx_sat % len(colors)]
            ax.plot(loss_rate_smoothed, alts[1:], color=color, linewidth=2.0, label=f"{m} kg")

        ax.set_ylabel("Altitude (km)")
        ax.set_title(f"[{mat}] Mass Loss Rate vs Altitude")
        ax.grid(True)

        if idx_mat == 0:
            ax.legend(title="Satellite mass", loc="upper right")

    axes43[-1].set_xlabel("Mass Loss Rate (kg/km)")
    fig43.tight_layout(h_pad=2.5)
    combined_fig43_path = os.path.join(out_dir, "all_materials_combined_fig4_3.png")
    fig43.savefig(combined_fig43_path, dpi=300, bbox_inches="tight")
    print(f"[OK] {combined_fig43_path}")



if __name__ == "__main__":
    main()
