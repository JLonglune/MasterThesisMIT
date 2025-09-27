#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
compare_figure6_1_multisats.py

Génère la Figure 6.1 – Normalized Mass Loss Rate vs Altitude pour chaque matériau,
uniquement pour les satellites de masse spécifiés (par défaut 525, 1009 et 1292 kg),
et sauvegarde dans un dossier dédié.

Usage :
    python compare_figure6_1_multisats.py
    python compare_figure6_1_multisats.py -s 525 1292 -m Aluminum Copper
"""
import os
import runpy
import argparse
import numpy as np
import matplotlib.pyplot as plt
import xml.etree.ElementTree as ET
from collections import defaultdict

# satellites ciblés par défaut
DEFAULT_SATS = [525, 1000, 1292]

# CLI
def parse_args():
    parser = argparse.ArgumentParser(
        description="Tracer Fig.6.1 pour des satellites de masses données"
    )
    parser.add_argument(
        "-s", "--sats",
        type=int, nargs='+',
        default=DEFAULT_SATS,
        help=f"Masses de satellites à comparer (défaut: {DEFAULT_SATS})"
    )
    parser.add_argument(
        "-m", "--materials",
        nargs='*',
        default=None,
        help="Liste de matériaux à tracer (défaut: tous disponibles)"
    )
    return parser.parse_args()

# Construction des chemins pour un satellite donné
def get_paths(root_dir, sat_mass):
    sat_dir = os.path.join(root_dir, f"sizesat{sat_mass}")
    dm = os.path.join(sat_dir, "Data_managment")
    script_py = os.path.join(dm, "AeroThermal_MatAblationVSAlt.py")
    data_txt = os.path.join(dm, "MassMat_by_object_file.txt")
    xml_path = os.path.join(sat_dir, "SARA", "REENTRY", "input", "objects.xml")
    for path, desc in ((script_py, "script Python"), (data_txt, "fichier de données"), (xml_path, "fichier XML")):
        if not os.path.isfile(path):
            raise FileNotFoundError(f"{desc} introuvable : {path}")
    return script_py, data_txt, xml_path

# Chargement des résultats du script externe
def load_results(script_py, data_file):
    globs = runpy.run_path(script_py)
    return globs["compute_results_by_material"](data_file)

# Lecture de la masse totale initiale depuis XML
def load_materials_mass(xml_path):
    tree = ET.parse(xml_path)
    mats = defaultdict(float)
    for obj in tree.getroot().findall('.//object'):
        mat = obj.findtext('material', default='UNKNOWN')
        mass = float(obj.findtext('mass') or 0)
        qty = int(obj.findtext('quantity') or 1)
        mats[mat] += mass * qty
    return mats

# Fonction principale

def main():
    args = parse_args()
    sats = args.sats
    root = os.path.abspath(os.path.dirname(__file__))

    # Charger résultats et chemins XML
    all_results = {}
    all_xml = {}
    for m in sats:
        script_py, data_txt, xml_path = get_paths(root, m)
        all_results[m] = load_results(script_py, data_txt)
        all_xml[m] = xml_path

    # Déterminer les matériaux à tracer
    if args.materials:
        materials = args.materials
    else:
        mats = set()
        for res in all_results.values():
            mats.update(res.keys())
        materials = sorted(mats)

    # Dossier de sortie
    sats_str = '_'.join(str(s) for s in sats)
    out_dir = os.path.join(root, f"plots_{sats_str}kg")
    os.makedirs(out_dir, exist_ok=True)

    colors = plt.rcParams['axes.prop_cycle'].by_key()['color']

    # Tracer par matériau
    for idx_mat, mat in enumerate(materials):
        fig, ax = plt.subplots(figsize=(8, 6))
        for idx_sat, m in enumerate(sats):
            res = all_results[m]
            if mat not in res:
                continue
            alts = res[mat]['altitudes']
            masses = res[mat]['masses']
            dz = np.diff(alts)
            loss = np.zeros_like(dz)
            valid = dz != 0
            loss[valid] = np.abs(np.diff(masses)[valid] / dz[valid])
            total_mass = sum(load_materials_mass(all_xml[m]).values())
            norm_loss = loss / total_mass

            color = colors[idx_sat % len(colors)]
            ax.plot(norm_loss, alts[1:], color=color, lw=2,
                    label=f"{m} kg")

        ax.set_xlabel('Normalized Mass Loss Rate (1/km)')
        ax.set_ylabel('Altitude (km)')
        title_sats = ', '.join(str(s) for s in sats)
        ax.set_title(f"Fig.6.1 – Material: {mat} ({title_sats} kg)")
        ax.grid(True)
        ax.legend(title='Satellite mass', loc='upper left', bbox_to_anchor=(1, 1))

        safe = mat.replace(' ', '_').replace('/', '_')
        fname = os.path.join(out_dir, f"fig6_1_{safe}.png")
        fig.savefig(fname, dpi=300, bbox_inches='tight')
        plt.close(fig)
        print(f"[OK] {fname}")

if __name__ == '__main__':
    main()
