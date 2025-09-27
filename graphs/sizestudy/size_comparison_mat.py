#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compare_figure2_materials.py

Compare la Figure 2 (Total Mass vs Altitude) pour plusieurs satellites et matériaux.
On utilise la fonction compute_results_by_material du script original pour obtenir
les courbes lissées (interpolation par objet avant somme).

Structure attendue pour chaque dossier sizesat<M> :
  • sizesat<M>/Data_managment/AeroThermal_MatAblationVSAlt.py
  • sizesat<M>/Data_managment/MassMat_by_object_file.txt

Usage :
  # tracer tous les matériaux pour les satellites 67,525,1292,2583
  python compare_figure2_materials.py

  # ne tracer que Aluminum et Copper pour 67 et 1292 kg
  python compare_figure2_materials.py -s 67 1292 -m Aluminum Copper
"""

import os
import runpy
import argparse
import numpy as np
import matplotlib.pyplot as plt

# Masses satellites par défaut
DEFAULT_SATS      = [67, 525, 1292, 2583]

def parse_args():
    p = argparse.ArgumentParser(
        description="Comparer Fig.2 (Total Mass vs Altitude) par matériau et par satellite"
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

def get_paths(sat_dir):
    """
    Retourne (script_py, data_file) pour un dossier sizesat<M>.
    """
    dm = os.path.join(sat_dir, "Data_managment")
    script_py = os.path.join(dm, "AeroThermal_MatAblationVSAlt.py")
    data_file = os.path.join(dm, "MassMat_by_object_file.txt")
    if not os.path.isfile(script_py):
        raise FileNotFoundError(f"Script non trouvé : {script_py}")
    if not os.path.isfile(data_file):
        raise FileNotFoundError(f"Données non trouvées : {data_file}")
    return script_py, data_file

def load_results(script_py, data_file):
    """
    Exécute le script et retourne le dict results = compute_results_by_material(data_file).
    """
    globs = runpy.run_path(script_py)
    if "compute_results_by_material" not in globs:
        raise KeyError("compute_results_by_material introuvable dans le script")
    return globs["compute_results_by_material"](data_file)

def main():
    args    = parse_args()
    sats    = args.sats
    base    = os.path.dirname(__file__)

    # 1) charger tous les résultats
    all_results = {}
    for m in sats:
        sat_dir = os.path.join(base, f"sizesat{m}")
        script_py, data_file = get_paths(sat_dir)
        results = load_results(script_py, data_file)
        all_results[m] = results

    # 2) déterminer la liste des matériaux
    if args.materials:
        materials = args.materials
    else:
        # union des matériaux présents dans tous les satellites
        mats = set()
        for res in all_results.values():
            mats.update(res.keys())
        materials = sorted(mats)

    # préparer dossier de sortie
    out_dir = os.path.join(base, "comparison_plots_fig2")
    os.makedirs(out_dir, exist_ok=True)

    # palette de couleurs
    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']

    # 3) pour chaque matériau, tracer un PNG
    for mat in materials:
        fig, ax = plt.subplots(figsize=(8,6))
        alt_max = 0

        for idx, m in enumerate(sats):
            results = all_results[m]
            if mat not in results:
                print(f"[!] {mat} absent pour satellite {m} kg, skip")
                continue

            alts   = results[mat]["altitudes"]
            masses = results[mat]["masses"]

            alt_max = max(alt_max, alts.max())
            color   = colors[idx % len(colors)]
            ax.plot(
                masses, alts,
                color=color,
                linewidth=2.0,
                label=f"{m} kg"
            )

        # mise en forme
        ax.set_xlabel("Mass (kg)")
        ax.set_ylabel("Altitude (km)")
        ax.set_title(f"Fig. 2 – Material: {mat}")
        ax.set_ylim(0, alt_max)
        ax.grid(True)
        ax.legend(title="Satellite mass", loc="upper left", bbox_to_anchor=(1,1))

        # sauvegarde
        safe = mat.replace(" ", "_").replace("/", "_")
        fname = os.path.join(out_dir, f"fig2_{safe}.png")
        fig.savefig(fname, dpi=300, bbox_inches='tight')
        plt.close(fig)
        print(f"[OK] {fname}")

if __name__ == "__main__":
    main()
