#!/usr/bin/env python3
import os
import xml.etree.ElementTree as ET
from collections import defaultdict

def analyser_materials(fichier_xml):
    """
    Parcourt tous les objets du XML et retourne deux dicts :
    - material -> masse_totale (mass * quantity)
    - material -> nombre_total_objets (sum(quantity))
    """
    if not os.path.isfile(fichier_xml):
        raise FileNotFoundError(f"Fichier XML introuvable : {fichier_xml}")

    tree = ET.parse(fichier_xml)
    root = tree.getroot()
    materials_mass  = defaultdict(float)
    materials_count = defaultdict(int)

    for obj in root.findall(".//object"):
        mat = obj.findtext("material") or "INCONNU"
        try:
            mass = float(obj.findtext("mass") or 0)
        except ValueError:
            mass = 0.0
        try:
            qty = int(obj.findtext("quantity") or 1)
        except ValueError:
            qty = 1

        materials_mass[mat]  += mass * qty
        materials_count[mat] += qty

    return materials_mass, materials_count

if __name__ == "__main__":
    # Répertoire de ce script : .../sizesat2583/Data_managment
    base_dir = os.path.abspath(os.path.dirname(__file__))
    xml_path = os.path.normpath(
        os.path.join(base_dir, "..", "SARA", "REENTRY", "input", "objects.xml")
    )

    mass_dict, count_dict = analyser_materials(xml_path)

    # Calcul de la masse totale globale
    total_mass = sum(mass_dict.values()) or 1  # éviter division par zéro

    print("Masse totale par matériau :")
    for mat, total in sorted(mass_dict.items()):
        print(f"  • {mat:10s} : {total:.2f} kg")

    print("\nNombre total d'objets par matériau :")
    for mat, count in sorted(count_dict.items()):
        print(f"  • {mat:10s} : {count} objet(s)")

    print("\nPart relative de chaque matériau dans la masse totale :")
    for mat, total in sorted(mass_dict.items()):
        rel = (total / total_mass) * 100
        print(f"  • {mat:10s} : {rel:.2f}%")
