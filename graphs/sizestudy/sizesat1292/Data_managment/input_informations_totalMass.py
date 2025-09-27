import xml.etree.ElementTree as ET
from collections import defaultdict

# Charger le fichier XML
file_path = "sizesat1292/SARA/REENTRY/input/objects.xml"  # Remplace ceci par le chemin réel de ton fichier XML
tree = ET.parse(file_path)
root = tree.getroot()

# Dictionnaire pour stocker la masse totale par matériau
materials_mass = defaultdict(float)

# Parcourir chaque objet dans le fichier XML
for obj in root.findall(".//object"):
    material = obj.find("material").text
    mass = float(obj.find("mass").text)
    quantity = int(obj.find("quantity").text)
    
    # Ajouter la masse multipliée par la quantité
    materials_mass[material] += mass * quantity

# Affichage des résultats
print("Masse totale par matériau :")
for material, total_mass in materials_mass.items():
    print(f"{material}: {total_mass:.2f} kg")
