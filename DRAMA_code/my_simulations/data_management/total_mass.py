#!/usr/bin/env python3
import os
import xml.etree.ElementTree as ET

def total_mass(fichier_xml):
    tree = ET.parse(fichier_xml)
    root = tree.getroot()
    masse_totale = 0.0
    for objet in root.findall("object"):
        m = objet.findtext("mass")
        try:
            masse_totale += float(m)
        except (TypeError, ValueError):
            pass
    return masse_totale

if __name__ == '__main__':
    #example of file
    base_dir = os.path.abspath(os.path.dirname(__file__))
    print(base_dir)
    file = os.path.join(base_dir, "../../my_simulations/dpz_modif/output/sat_67/objects.xml")
    print(f"Masse totale autre fichier : {total_mass(file):.3f}")
