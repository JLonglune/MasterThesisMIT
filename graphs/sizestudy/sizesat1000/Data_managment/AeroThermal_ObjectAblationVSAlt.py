import os
import xml.etree.ElementTree as ET
import numpy as np
import matplotlib.pyplot as plt

#------------------------------------------------------------------------------
# 1. Création du mapping objet → matériau à partir du fichier XML
#------------------------------------------------------------------------------
xml_file = "sizesat1000/SARA/REENTRY/input/objects.xml"
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
output_dir = "sizesat1000/SARA/REENTRY/output"
MassMat_by_object_file = "sizesat1000/Data_managment/MassMat_by_object_file.txt"

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
MassMat_by_object_file = "sizesat1000/Data_managment/MassMat_by_object_file.txt"
# …
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

print("Masse restante par matériau :")
for mat, vals in sorted(material_results.items()):
    print(f"  - {mat}: {vals['total_remaining']:.6f} kg")
print("-" * 40)

#------------------------------------------------------------------------------
# 6. Création du fichier de résumé par matériau
#------------------------------------------------------------------------------
material_output_file = "sizesat1000/Data_managment/mass_loss_fraction_by_material_summary.txt"
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
# 7. Create a figure with 3 subplots to display the graphs
#------------------------------------------------------------------------------
fig, axes = plt.subplots(3, 1, figsize=(10, 15), sharex=False)
fig.suptitle("Mass Evolution and Mass Loss (per Object)", fontsize=16)

# Plot 1: Mass vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    axes[0].plot(masses, altitudes, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[0].set_xlabel("Mass (kg)")
axes[0].set_ylabel("Altitude (km)")
axes[0].set_title("Mass Evolution with Altitude")
axes[0].grid(True)

# Plot 2: Lost Mass vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    lost_mass_curve = res["initial_mass"] - masses
    axes[1].plot(lost_mass_curve, altitudes, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[1].set_xlabel("Lost Mass (kg)")
axes[1].set_ylabel("Altitude (km)")
axes[1].set_title("Lost Mass Evolution with Altitude")
axes[1].grid(True)

# Plot 3: Lost Mass per km vs Altitude
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    delta_alt = np.diff(altitudes)
    valid = delta_alt != 0
    mass_loss_per_km = np.zeros_like(delta_alt)
    mass_loss_per_km[valid] = np.abs(np.diff(masses)[valid] / delta_alt[valid])
    out_alt = altitudes[1:]
    axes[2].plot(mass_loss_per_km, out_alt, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)
axes[2].set_xlabel("Lost Mass per km (kg/km)")
axes[2].set_ylabel("Altitude (km)")
axes[2].set_title("Lost Mass per km vs Altitude")
axes[2].grid(True)

# Create a global legend
handles, labels = axes[0].get_legend_handles_labels()
fig.legend(handles, labels, loc='upper right', title="Object", ncol=3, fontsize=6, title_fontsize=10)

# Save figure
output_figure_path = "sizesat1000/Data_managment/mass_loss_summary_plot.png"
plt.savefig(output_figure_path, dpi=300)
print(f"Figure saved: {output_figure_path}")

plt.tight_layout(rect=[0, 0, 0.85, 0.95])
plt.show()

# --- Plot 1: Mass vs Altitude only ---
fig1, ax1 = plt.subplots(figsize=(10, 8))
for label, res in results.items():
    altitudes = np.array(res["altitudes"])
    masses = np.array(res["masses"])
    ax1.plot(masses, altitudes, marker='o', markersize=4, linestyle="-", linewidth=1.2, label=label)

ax1.set_xlabel("Mass (kg)")
ax1.set_ylabel("Altitude (km)")
ax1.set_title("Mass Evolution with Altitude")
ax1.grid(True)

# Save first plot without legend
mass_vs_altitude_path = "sizesat1000/Data_managment/mass_vs_altitude_only.png"
plt.tight_layout()
plt.savefig(mass_vs_altitude_path, dpi=300)
print(f"Saved: {mass_vs_altitude_path}")
plt.close(fig1)

# --- Legend as a separate figure ---
fig_legend = plt.figure(figsize=(12, 12))
legend_ax = fig_legend.add_subplot(111)
legend_ax.axis('off')  # No axes

# Get all handles and labels from original plot
handles, labels = ax1.get_legend_handles_labels()
legend = fig_legend.legend(handles, labels, loc='center', title="Object", ncol=3, fontsize=7, title_fontsize=10)

legend_path = "sizesat1000/Data_managment/mass_plot_legend_only.png"
fig_legend.savefig(legend_path, dpi=300, bbox_inches='tight')
print(f"Saved: {legend_path}")
plt.close(fig_legend)
