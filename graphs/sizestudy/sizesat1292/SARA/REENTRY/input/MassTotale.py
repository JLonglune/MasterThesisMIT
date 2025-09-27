#!/usr/bin/env python3
import xml.etree.ElementTree as ET

def calculer_masse_totale(fichier_xml):
    # Charger le fichier XML
    tree = ET.parse(fichier_xml)
    root = tree.getroot()
    masse_totale = 0.0

    # Pour chaque objet, on récupère la masse et on l'ajoute au total
    for objet in root.findall("object"):
        masse_elem = objet.find("mass")
        if masse_elem is not None and masse_elem.text:
            try:
                masse = float(masse_elem.text)
                masse_totale += masse
            except ValueError:
                # En cas d'erreur de conversion, on ignore cette masse
                pass
    return masse_totale

if __name__ == '__main__':
    fichier = "sizesat1292/SARA/REENTRY/input/objects.xml"  # Assurez-vous que ce fichier est dans le même dossier que ce script
    masse_totale = calculer_masse_totale(fichier)
    print(f"La masse totale des objets est : {masse_totale:.3f}")
