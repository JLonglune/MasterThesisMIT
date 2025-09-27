import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math
import xml.etree.ElementTree as ET
import hashlib
import matplotlib.patches as mpatches

############################################
# Chargement des données tabulaires
############################################
def load_data(file_path):
    return pd.read_csv(file_path, sep="\t")

############################################
# Parsing XML avec filtrage optionnel
############################################
def parse_objects(file_path, mass_threshold=None, show_all=False):
    tree = ET.parse(file_path)
    root = tree.getroot()
    objects = {}
    relationships = []

    for obj in root.findall('object'):
        name = obj.find('name').text
        unique_id = obj.find('uniqueID').text
        mass = float(obj.find('mass').text)
        material = obj.find('material').text if obj.find('material') is not None else "Unknown"

        shape_element = obj.find('primitive')
        shape = "Unknown"
        if shape_element is not None:
            if shape_element.find('box') is not None:
                shape = "Box"
            elif shape_element.find('sphere') is not None:
                shape = "Sphere"
            elif shape_element.find('cylinder') is not None:
                shape = "Cylinder"
            elif shape_element.find('cone') is not None:
                shape = "Cone"
            elif shape_element.find('ring') is not None:
                shape = "Ring"

        if show_all or (mass_threshold is None or mass >= mass_threshold):
            objects[unique_id] = {
                'name': name,
                'id': unique_id,
                'shape': shape,
                'mass': mass,
                'material': material
            }

    for inclusion in root.findall('inclusion'):
        parent_id = inclusion.find('parent/uniqueID').text
        for child in inclusion.find('children'):
            if parent_id in objects and child.text in objects:
                relationships.append((parent_id, child.text))

    return objects, relationships

############################################
# Calcule la profondeur hiérarchique de chaque objet
############################################
def compute_hierarchy_levels(relationships):
    levels = {}
    children = {child for _, child in relationships}
    roots = {parent for parent, _ in relationships} - children
    queue = [(node, 0) for node in roots]

    while queue:
        node, level = queue.pop(0)
        levels[node] = level
        for parent, child in relationships:
            if parent == node and child not in levels:
                queue.append((child, level + 1))

    return levels

############################################
# Plot : contribution par étage hiérarchique
############################################
def plot_material_contributions_by_hierarchy_level(xml_path, data_path, mass_threshold=None, save_path=None):
    objects, relationships = parse_objects(xml_path, mass_threshold=mass_threshold)
    levels = compute_hierarchy_levels(relationships)
    df = load_data(data_path)

    available_object_names = set(df["Objet"].unique())

    level_to_objects = {}
    for uid, lvl in levels.items():
        if uid in objects:
            level_to_objects.setdefault(lvl, []).append(uid)

    sorted_levels = sorted(level_to_objects.keys())
    n_levels = len(sorted_levels)
    ncols = 2
    nrows = math.ceil(n_levels / ncols)
    fig, axes = plt.subplots(nrows, ncols, figsize=(16, 5 * nrows))
    axes = axes.flatten() if n_levels > 1 else [axes]

    for ax in axes[n_levels:]:
        ax.set_visible(False)

    for i, lvl in enumerate(sorted_levels):
        ax = axes[i]
        uid_list = level_to_objects[lvl]

        material_groups = {}
        missing_objects = []

        for uid in uid_list:
            obj = objects[uid]
            name = obj["name"]
            material = obj["material"]

            obj_df = df[df["Objet"] == name]

            if name not in available_object_names:
                print(f"[INFO] '{name}' not found in data file.")
                missing_objects.append(name)
                continue
            elif obj_df.empty or obj_df["Mass (kg)"].isnull().all() or obj_df["Altitude (km)"].isnull().all():
                print(f"[INFO] '{name}' has empty or null data.")
                missing_objects.append(name)
                continue

            material_groups.setdefault(material, []).append(obj_df)

        if missing_objects:
            print(f"[INFO] Objects at level {lvl} ignored: {missing_objects}")

        for material, obj_dfs in material_groups.items():
            combined_df = pd.concat(obj_dfs).sort_values("Altitude (km)")
            alt_min = combined_df["Altitude (km)"].min()
            alt_max = combined_df["Altitude (km)"].max()
            altitude_grid = np.linspace(alt_min, alt_max, 100)
            total_mass = np.zeros_like(altitude_grid)

            for obj_df in obj_dfs:
                obj_df = obj_df.sort_values("Altitude (km)")
                interp_mass = np.interp(altitude_grid,
                                        obj_df["Altitude (km)"].values,
                                        obj_df["Mass (kg)"].values)
                total_mass += interp_mass

            ax.plot(total_mass, altitude_grid, marker='o', linestyle='-', linewidth=1.5, label=material)

        ax.set_title(f"Hierarchy Level: {lvl}")
        ax.set_xlabel("Total Mass (kg)")
        ax.set_ylabel("Altitude (km)")
        ax.grid(True)
        ax.legend(title="Material", fontsize=7, loc='best')

    fig.suptitle("Mass Contribution by Material and Hierarchy Level", fontsize=16)
    plt.tight_layout(rect=[0, 0, 1, 0.96])

    if save_path:
        plt.savefig(save_path, dpi=300)
        print(f"Figure saved to: {save_path}")

    plt.show()



xml_path = "sizesat1000/SARA/REENTRY/input/objects.xml"
data_path = "sizesat1000/Data_managment/MassMat_by_object_file.txt"
save_path = "sizesat1000/Data_managment/mass_contributions_by_level.png"

plot_material_contributions_by_hierarchy_level(xml_path, data_path, mass_threshold=5, save_path=save_path)
