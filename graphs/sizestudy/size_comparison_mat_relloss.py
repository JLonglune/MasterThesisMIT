#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
comparison_data_fig6_1.py

Génère des fichiers TXT contenant les données de la Figure 6.1 – Normalized Mass Loss Rate vs Altitude,
pour chaque matériau et masse de satellite.
"""

import os
import runpy
import argparse
import numpy as np
import xml.etree.ElementTree as ET
from collections import defaultdict

DEFAULT_SATS = [67, 525, 1292, 2583]

def parse_args():
    p = argparse.ArgumentParser(
        description="Exporter les données de Fig.6.1 (Normalized Mass Loss Rate vs Altitude) en fichiers .txt"
    )
    p.add_argument("-s", "--sats", type=int, nargs="+", default=DEFAULT_SATS,
                   help=f"Masses de satellites à comparer (défaut: {DEFAULT_SATS})")
    p.add_argument("-m", "--materials", type=str, nargs="*",
                   help="Liste de matériaux à traiter (défaut: tous présents)")
    return p.parse_args()

def get_paths(root_dir, sat_mass):
    sat_dir  = os.path.join(root_dir, f"sizesat{sat_mass}")
    dm       = os.path.join(sat_dir, "Data_managment")
    script_py= os.path.join(dm, "AeroThermal_MatAblationVSAlt.py")
    data_txt = os.path.join(dm, "MassMat_by_object_file.txt")
    xml_path = os.path.join(sat_dir, "SARA", "REENTRY", "input", "objects.xml")

    for path, desc in (
        (script_py, "script Python"),
        (data_txt, "fichier de données"),
        (xml_path, "fichier XML")
    ):
        if not os.path.isfile(path):
            raise FileNotFoundError(f"{desc} introuvable : {path}")
    return script_py, data_txt, xml_path

def load_results(script_py, data_file):
    globs = runpy.run_path(script_py)
    if "compute_results_by_material" not in globs:
        raise KeyError("compute_results_by_material introuvable dans le script")
    return globs["compute_results_by_material"](data_file)

def load_materials_mass(xml_path):
    tree = ET.parse(xml_path)
    mats = defaultdict(float)
    for obj in tree.getroot().findall('.//object'):
        mat = obj.findtext("material") or "INCONNU"
        try:
            mass = float(obj.findtext("mass") or 0)
        except ValueError:
            mass = 0.0
        try:
            qty  = int(obj.findtext("quantity") or 1)
        except ValueError:
            qty  = 1
        mats[mat] += mass * qty
    return mats

def save_txt_data(mat_name, data_by_mass, out_dir):
    safe_name = mat_name.replace(" ", "_").replace("/", "_")
    file_path = os.path.join(out_dir, f"{safe_name}.txt")
    with open(file_path, "w", encoding="utf-8") as f:
        f.write(f"# Material: {mat_name}\n")
        f.write("# Columns: SatelliteMass [kg]\tAltitude [km]\tNormalizedLossRate [1/km]\n")
        for mass, data in sorted(data_by_mass.items()):
            for alt, rate in zip(data["altitudes"], data["loss_rates"]):
                f.write(f"{mass}\t{alt:.2f}\t{rate:.6e}\n")
    print(f"[TXT écrit] {file_path}")

def main():
    args = parse_args()
    sats = args.sats
    project_root = os.path.abspath(os.path.dirname(__file__))

    all_results = {}
    all_xml     = {}
    for m in sats:
        script_py, data_txt, xml_path = get_paths(project_root, m)
        all_results[m] = load_results(script_py, data_txt)
        all_xml[m]     = xml_path

    if args.materials:
        materials = args.materials
    else:
        mats = set()
        for res in all_results.values():
            mats.update(res.keys())
        materials = sorted(mats)

    out_dir = os.path.join(project_root, "comparison_data_fig6_1_txt")
    os.makedirs(out_dir, exist_ok=True)

    for mat in materials:
        mat_data = {}
        for m in sats:
            results = all_results[m]
            if mat not in results:
                continue

            alts = results[mat]["altitudes"]
            masses = results[mat]["masses"]

            dz = np.diff(alts)
            loss_rate = np.zeros_like(dz)
            valid = dz != 0
            loss_rate[valid] = np.abs(np.diff(masses)[valid] / dz[valid])

            total_mass = sum(load_materials_mass(all_xml[m]).values())
            norm_loss = loss_rate / total_mass

            mat_data[m] = {
                "altitudes": alts[1:],  # aligné avec loss_rate
                "loss_rates": norm_loss
            }

        save_txt_data(mat, mat_data, out_dir)

if __name__ == "__main__":
    main()
