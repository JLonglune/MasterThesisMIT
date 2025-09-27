import xml.etree.ElementTree as ET
import pandas as pd
import glob
import os
from collections import defaultdict

# === 1. Mapping Objet -> Matériau depuis le XML ===
xml_path = "SARA/REENTRY/input/objects.xml"
tree = ET.parse(xml_path)
root = tree.getroot()

obj_to_material = {}
for obj in root.findall('object'):
    name = obj.find('name').text.strip() if obj.find('name') is not None else None
    material = obj.find('material').text.strip() if obj.find('material') is not None else "Unknown"
    if name:
        obj_to_material[name] = material

print("✔️ Mapping Objet -> Matériau extrait.")

# === 2. Chercher tous les fichiers AeroThermalHistory dans tous les sous-dossiers ===
output_dir = "SARA/REENTRY/output"
object_files = glob.glob(os.path.join(output_dir, "**", "sara.*.*_AeroThermalHistory.txt"), recursive=True)
print(f"🔍 {len(object_files)} fichiers AeroThermalHistory trouvés")

# Grouper les fichiers par nom d'objet (ex: IFring, etc.)
object_name_map = defaultdict(list)
for path in object_files:
    basename = os.path.basename(path)
    parts = basename.split('.')
    if len(parts) > 2:
        name = parts[1]
        object_name_map[name].append(path)

# === 3. Fusionner tous les fichiers d’un même objet ===
final_data = []

for obj_name, paths in object_name_map.items():
    dfs = []
    for path in paths:
        try:
            df = pd.read_csv(path, comment='#', sep=r'\s+', header=None)
            if df.shape[1] < 4:
                print(f"⚠️ Trop peu de colonnes dans {path} → ignoré")
                continue
            # Forcer noms colonnes minimales
            df.columns = ['Time [s]', 'Altitude [km]', 'Temp [K]', 'Mass [kg]'] + [
                f"extra_{i}" for i in range(df.shape[1] - 4)
            ]
            dfs.append(df)
        except Exception as e:
            print(f"❌ Erreur lecture {path} : {e}")
            continue

    if not dfs:
        print(f"⚠️ Aucun fichier valide pour {obj_name}")
        continue

    # Concaténer toutes les données pour cet objet
    df_all = pd.concat(dfs, ignore_index=True)
    df_all.sort_values(by='Altitude [km]', inplace=True)

    # Nettoyage : on ne garde que l’essentiel
    df_clean = pd.DataFrame({
        "Altitude (km)": df_all['Altitude [km]'],
        "Objet": obj_name,
        "Matériau": obj_to_material.get(obj_name, "Unknown"),
        "Mass (kg)": df_all['Mass [kg]']
    })

    final_data.append(df_clean)
    print(f"✔️ {obj_name} : {len(df_clean)} lignes fusionnées à partir de {len(paths)} fichier(s)")

# === 4. Enregistrement du fichier final ===
if final_data:
    df_final = pd.concat(final_data, ignore_index=True)
    output_file = "Data_managment/MassMat_cleaned.txt"
    df_final.to_csv(output_file, sep='\t', index=False)
    print(f"\n🎯 Fichier final créé : {output_file} ({len(df_final)} lignes)")
else:
    print("⚠️ Aucun fichier AeroThermalHistory valide traité.")
