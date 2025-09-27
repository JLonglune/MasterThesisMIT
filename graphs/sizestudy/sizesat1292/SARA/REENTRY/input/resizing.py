#!/usr/bin/env python3
import xml.etree.ElementTree as ET

def transformer_dimension(valeur_str):
    """
    Transforme une valeur de dimension selon la règle suivante :
      - Si la valeur > 0.01, on la divise par 0.707.
      - Sinon, on laisse la valeur inchangée.
    Retourne une chaîne formatée à 3 décimales.
    """

    try:
        valeur = float(valeur_str)
    except ValueError:
        # En cas de problème de conversion, on retourne la valeur d'origine.
        return valeur_str
    # Si la valeur est de 0.01 ou moins, ne rien changer
    if valeur <= 0.01:
        return valeur_str
    # Appliquer la transformation
    nouvelle_valeur = valeur * 0.707
    return f"{nouvelle_valeur:.3f}"

# Charger le fichier XML original.
tree = ET.parse("sizesat67/SARA/REENTRY/input/objects.xml")
root = tree.getroot()

# Parcourir tous les objets du fichier.
for objet in root.findall("object"):
    # Transformation de la masse : diviser par 2.
    masse = objet.find("mass")
    if masse is not None and masse.text:
        try:
            masse_num = float(masse.text)
            masse.text = f"{masse_num / 2:.3f}"
        except ValueError:
            # En cas de valeur incorrecte, on laisse inchangée.
            pass

    # Transformation des paramètres dans la primitive.
    primitive = objet.find("primitive")
    if primitive is not None:
        # Les éléments sous <primitive> peuvent être par exemple <cylinder> ou <box>.
        for forme in primitive:
            # Pour chaque paramètre de la forme (ex. <radius>, <height>, <width>, <length>)
            for parametre in forme:
                if parametre.text and parametre.text.strip():
                    parametre.text = transformer_dimension(parametre.text)

# Sauvegarder le nouveau fichier XML avec les modifications
tree.write("SARA/REENTRY/input/objects_transformed.xml", encoding="UTF-8", xml_declaration=True)

print("Le fichier 'objects_transformed.xml' a été créé avec succès.")
