import numpy as np
import pyvista as pv
from lxml import etree

def rotation_matrix(yaw, pitch, roll):
    # Convertir les angles en degrés en radians
    yaw = np.deg2rad(yaw)
    pitch = np.deg2rad(pitch)
    roll = np.deg2rad(roll)
    Ry = np.array([
        [np.cos(yaw), -np.sin(yaw), 0],
        [np.sin(yaw),  np.cos(yaw), 0],
        [0, 0, 1]
    ])
    Rz = np.array([
        [ np.cos(pitch), 0, np.sin(pitch)],
        [0, 1, 0],
        [-np.sin(pitch), 0, np.cos(pitch)]
    ])
    Rx = np.array([
        [1, 0, 0],
        [0, np.cos(roll), -np.sin(roll)],
        [0, np.sin(roll),  np.cos(roll)]
    ])
    return Rx @ Ry @ Rz


def local_transform(x, y, z, yaw, pitch, roll):
    T = np.eye(4)
    # Inverser yaw et roll (à tester)
    T[:3, :3] = rotation_matrix(-yaw, pitch, -roll)
    T[:3, 3] = np.array([x, y, z])
    return T

# Charger le fichier XML
tree = etree.parse("sizesat2583/SARA/REENTRY/input/objects.xml")
root = tree.getroot()

# 1. Construire un dictionnaire des objets avec leur transformation locale
object_dict = {}
for obj in root.findall("object"):
    uid = obj.findtext("uniqueID")
    name = obj.findtext("name")
    pos_elem = obj.find("relativePosition")
    x = float(pos_elem.findtext("cartX", "0"))
    y = float(pos_elem.findtext("cartY", "0"))
    z = float(pos_elem.findtext("cartZ", "0"))
    yaw = float(pos_elem.findtext("yaw", "0"))
    pitch = float(pos_elem.findtext("pitch", "0"))
    roll = float(pos_elem.findtext("roll", "0"))
    yaw = -yaw
    roll = -roll
    local_T = local_transform(x, y, z, yaw, pitch, roll)
    
    # Stocker les informations sur le type de primitive et ses dimensions
    primitive = obj.find("primitive")
    prim_type = None
    dimensions = {}
    if primitive.find("box") is not None:
        prim_type = "box"
        box = primitive.find("box")
        dimensions["width"] = float(box.findtext("width"))
        dimensions["height"] = float(box.findtext("height"))
        dimensions["length"] = float(box.findtext("length"))
    elif primitive.find("sphere") is not None:
        prim_type = "sphere"
        dimensions["radius"] = float(primitive.find("sphere").findtext("radius"))
    elif primitive.find("cylinder") is not None:
        prim_type = "cylinder"
        cyl = primitive.find("cylinder")
        dimensions["radius"] = float(cyl.findtext("radius"))
        dimensions["height"] = float(cyl.findtext("height"))
    elif primitive.find("cone") is not None:
        prim_type = "cone"
        cone = primitive.find("cone")
        dimensions["radius"] = float(cone.findtext("radius"))
        dimensions["height"] = float(cone.findtext("height"))
    
    object_dict[uid] = {
        "name": name,
        "local_transform": local_T,
        "prim_type": prim_type,
        "dimensions": dimensions
    }

# 2. Construire la hiérarchie à partir de la sous-section <inclusion>
child_to_parent = {}
for inclusion in root.findall("inclusion"):
    parent_elem = inclusion.find("parent")
    children_elem = inclusion.find("children")
    if parent_elem is not None and children_elem is not None:
        parent_uid = parent_elem.findtext("uniqueID")
        # On peut avoir plusieurs enfants dans <children>
        for child in children_elem.findall("uniqueID"):
            child_uid = child.text
            child_to_parent[child_uid] = parent_uid

# 3. Calculer les transformations globales en appliquant la hiérarchie
global_transforms = {}

def compute_global(uid):
    if uid in global_transforms:
        return global_transforms[uid]
    local_T = object_dict[uid]["local_transform"]
    if uid in child_to_parent:
        parent_uid = child_to_parent[uid]
        parent_global = compute_global(parent_uid)
        global_T = parent_global @ local_T
    else:
        global_T = local_T
    global_transforms[uid] = global_T
    return global_T

for uid in object_dict.keys():
    compute_global(uid)

# 4. Créer une fonction pour générer la géométrie locale (centrée à l'origine)
def create_geometry(prim_type, dimensions):
    if prim_type == "box":
        w = dimensions["width"]
        h = dimensions["height"]
        l = dimensions["length"]
        return pv.Cube(center=(0, 0, 0), x_length=w, y_length=h, z_length=l)
    elif prim_type == "sphere":
        r = dimensions["radius"]
        return pv.Sphere(radius=r, center=(0, 0, 0))
    elif prim_type == "cylinder":
        r = dimensions["radius"]
        h = dimensions["height"]
        return pv.Cylinder(radius=r, height=h, center=(0, 0, 0), direction=(0, 1, 0))
    elif prim_type == "cone":
        r = dimensions["radius"]
        h = dimensions["height"]
        return pv.Cone(radius=r, height=h, center=(0, 0, 0), direction=(0, 1, 0))
    else:
        return None

# 5. Créer la scène avec toutes les pièces, en appliquant leur transformation globale
plotter = pv.Plotter()
for uid, info in object_dict.items():
    prim_type = info["prim_type"]
    if prim_type is None:
        continue
    geom = create_geometry(prim_type, info["dimensions"])
    T_global = global_transforms[uid]
    # Appliquer la transformation globale à la géométrie locale
    geom.transform(T_global, inplace=True)
    # Choisir une couleur selon que l'objet est top-level (bleu) ou enfant (vert)
    color = "blue" if uid not in child_to_parent else "green"
    plotter.add_mesh(geom, color=color, show_edges=True)
    # Ajouter un label à l'objet
    pos = T_global[:3, 3]
    plotter.add_point_labels([pos], [info["name"]], font_size=10, point_color="red", text_color="black")
    
plotter.show()
