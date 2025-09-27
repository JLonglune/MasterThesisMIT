import os
import xml.etree.ElementTree as ET
import numpy as np
import matplotlib.pyplot as plt

#------------------------------------------------------------------------------
# 1. Création du mapping objet → matériau à partir du fichier XML
#------------------------------------------------------------------------------
xml_file = "SARA/REENTRY/input/objects.xml"
tree = ET.parse(xml_file)
root = tree.getroot()

obj_to_material = {}
for obj in root.findall('object'):
    name = obj.find('name').text if obj.find('name') is not None else None
    material = obj.find('material').text if obj.find('material') is not None else "Unknown"
    if name:
        obj_to_material[name] = material

#------------------------------------------------------------------------------
# 2. Lecture des fichiers AeroThermalHistory pour extraire altitude & masse
#------------------------------------------------------------------------------
output_dir = "SARA/REENTRY/output"
MassMat_by_object_file = "Data_managment/MassMat_by_object_file.txt"

files = [f for f in os.listdir(output_dir) if "AeroThermalHistory" in f]
if not files:
    print("Aucun fichier 'AeroThermalHistory' trouvé dans le dossier output.")
    exit()

results = {}
for file in files:
    file_path = os.path.join(output_dir, file)
    parts = file.split(".")
    label = parts[1] if len(parts) > 1 else file
    
    altitudes = []
    masses = []
    
    with open(file_path, "r") as f_in:
        for line in f_in:
            line = line.strip()
            if line and not line.startswith("#"):
                data = line.split()
                # data[1] = Altitude [km], data[3] = Mass [kg]
                try:
                    altitude = float(data[1])
                    mass = float(data[3])
                    altitudes.append(altitude)
                    masses.append(mass)
                except Exception:
                    continue
                    
    if len(masses) < 2:
        print(f"Fichier {label} contient trop peu de points.")
        continue

    initial_mass = masses[0]
    final_mass = masses[-1]
    lost_mass = initial_mass - final_mass
    
    results[label] = {
        "initial_mass": initial_mass,
        "final_mass": final_mass,
        "lost_mass": lost_mass,
        "altitudes": altitudes,
        "masses": masses
    }

#------------------------------------------------------------------------------
# 3. Écriture d'un fichier contenant (Altitude, Objet, Matériau, Mass)
#------------------------------------------------------------------------------
with open(MassMat_by_object_file, "w") as f_out:
    f_out.write("Altitude (km)\tObjet\tMatériau\tMass (kg)\n")
    for label, res in results.items():
        material = obj_to_material.get(label, "Unknown")
        for alt, m in zip(res["altitudes"], res["masses"]):
            f_out.write(f"{alt:.3f}\t{label}\t{material}\t{m:.6f}\n")

print(f"Fichier des altitudes, objets, matériaux et masses enregistré: {MassMat_by_object_file}")


#------------------------------------------------------------------------------
# 4. Regroupement par matériau et calcul des masses cumulées
#------------------------------------------------------------------------------
material_results = {}
objects_by_material = {}

for label, res in results.items():
    material = obj_to_material.get(label, "Unknown")
    prev_initial = material_results.get(material, {}).get("total_initial", 0.0)
    prev_lost = material_results.get(material, {}).get("total_lost", 0.0)
    total_initial = prev_initial + res["initial_mass"]
    total_lost = prev_lost + res["lost_mass"]
    material_results[material] = {
        "total_initial": total_initial,
        "total_lost": total_lost,
        "total_remaining": total_initial - total_lost
    }
    if material not in objects_by_material:
        objects_by_material[material] = []
    objects_by_material[material].append({
        "object": label,
        "initial_mass": res["initial_mass"],
        "final_mass": res["final_mass"],
        "lost_mass": res["lost_mass"]
    })

#------------------------------------------------------------------------------
# 5. Affichage dans la console du résumé par matériau + total cumulé
#------------------------------------------------------------------------------
total_initial_all = sum(vals['total_initial'] for vals in material_results.values())
total_lost_all = sum(vals['total_lost'] for vals in material_results.values())
total_remaining_all = total_initial_all - total_lost_all

print("TOTAL TOUS MATÉRIAUX CONFONDUS")
print(f"  Masse initiale totale : {total_initial_all:.6f} kg")
print(f"  Masse perdue totale   : {total_lost_all:.6f} kg")
print(f"  Masse restante        : {total_remaining_all:.6f} kg")
print("-" * 40)

#------------------------------------------------------------------------------
# 6. Création du fichier de résumé par matériau
#------------------------------------------------------------------------------
material_output_file = "Data_managment/mass_loss_fraction_by_material_summary.txt"
with open(material_output_file, "w", encoding="utf-8") as f_mat:
    f_mat.write("Résumé par matériau\n")
    f_mat.write("=" * 40 + "\n\n")
    for mat, vals in sorted(material_results.items()):
        f_mat.write(f"Matériau: {mat}\n")
        f_mat.write(f"  Masse initiale totale : {vals['total_initial']:.6f} kg\n")
        f_mat.write(f"  Masse perdue totale   : {vals['total_lost']:.6f} kg\n")
        f_mat.write(f"  Masse restante        : {vals['total_remaining']:.6f} kg\n")
        f_mat.write("  Détails par objet:\n")
        for obj in objects_by_material.get(mat, []):
            f_mat.write(f"    - Objet: {obj['object']}, Masse initiale: {obj['initial_mass']:.6f} kg, ")
            f_mat.write(f"Masse finale: {obj['final_mass']:.6f} kg, Masse perdue: {obj['lost_mass']:.6f} kg\n")
        f_mat.write("-" * 40 + "\n\n")

print(f"Fichier de résumé par matériau enregistré: {material_output_file}")

#------------------------------------------------------------------------------
# 7. Création d'une figure avec 3 subplots pour afficher les graphiques
#------------------------------------------------------------------------------
fig, axes = plt.subplots(3, 1, figsize=(10, 15), sharex=False)
fig.suptitle("Évolution de la masse et de la perte de masse (par objet)", fontsize=16)

# Graphique 1 : Masse vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    axes[0].plot(masses, altitudes, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[0].set_xlabel("Masse (kg)")
axes[0].set_ylabel("Altitude (km)")
axes[0].set_title("Évolution de la masse en fonction de l'altitude")
axes[0].grid(True)

# Graphique 2 : Masse perdue vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    lost_mass_curve = res["initial_mass"] - masses
    axes[1].plot(lost_mass_curve, altitudes, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[1].set_xlabel("Masse perdue (kg)")
axes[1].set_ylabel("Altitude (km)")
axes[1].set_title("Évolution de la masse perdue en fonction de l'altitude")
axes[1].grid(True)

# Graphique 3 : Masse perdue par km vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    delta_alt = np.diff(altitudes)
    valid = delta_alt != 0
    mass_loss_per_km = np.zeros_like(delta_alt)
    mass_loss_per_km[valid] = np.abs(np.diff(masses)[valid] / delta_alt[valid])
    out_alt = altitudes[1:]
    axes[2].plot(mass_loss_per_km, out_alt, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[2].set_xlabel("Masse perdue par km (kg/km)")
axes[2].set_ylabel("Altitude (km)")
axes[2].set_title("Évolution de la masse perdue par km en fonction de l'altitude")
axes[2].grid(True)

# Création d'une légende globale unique
handles, labels = axes[0].get_legend_handles_labels()
fig.legend(handles, labels, loc='upper right', title="Objet", ncol=3, fontsize=6, title_fontsize=10)

plt.tight_layout(rect=[0, 0, 0.85, 0.95])
plt.show()
