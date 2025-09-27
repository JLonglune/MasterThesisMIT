#!/usr/bin/env python3
import os
import xml.etree.ElementTree as ET

def calculer_masse_totale(fichier_xml):
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
    # this file lives in …/REENTRY/input
    base_dir = os.path.abspath(os.path.dirname(__file__))
    # objects.xml is right next to this script
    fichier = os.path.join(base_dir, "objects.xml")
    # sanity check
    if not os.path.isfile(fichier):
        raise FileNotFoundError(f"XML introuvable : {fichier}")
    print(f"La masse totale des objets est : {calculer_masse_totale(fichier):.3f}")
