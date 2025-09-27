import pyvista as pv
from lxml import etree

# Charger le fichier XML
tree = etree.parse("sizesat2583/SARA/REENTRY/input/objects.xml")
root = tree.getroot()

# Liste des objets à afficher
visible_names = ["IFring", "SolarP", "SVM", "PLM"]

plotter = pv.Plotter()

for obj in root.findall("object"):
    name = obj.findtext("name")
    if name not in visible_names:
        continue

    pos = obj.find("relativePosition")
    x = float(pos.findtext("cartX", "0"))
    y = float(pos.findtext("cartY", "0"))
    z = float(pos.findtext("cartZ", "0"))
    yaw = float(pos.findtext("yaw", "0"))
    pitch = float(pos.findtext("pitch", "0"))
    roll = float(pos.findtext("roll", "0"))
    
    # Pour SolarP, SVM et PLM, inverser le pitch pour coller l'objet au satellite
    if name in ["SolarP", "SVM", "PLM"]:
        pitch = -pitch

    primitive = obj.find("primitive")
    shape = None
    if primitive.find("box") is not None:
        box = primitive.find("box")
        width = float(box.findtext("width"))
        height = float(box.findtext("height"))
        length = float(box.findtext("length"))
        shape = pv.Cube(center=(x, y, z), x_length=width, y_length=height, z_length=length)
    elif primitive.find("sphere") is not None:
        radius = float(primitive.find("sphere").findtext("radius"))
        shape = pv.Sphere(radius=radius, center=(x, y, z))
    elif primitive.find("cylinder") is not None:
        cyl = primitive.find("cylinder")
        radius = float(cyl.findtext("radius"))
        height = float(cyl.findtext("height"))
        shape = pv.Cylinder(center=(x, y, z), radius=radius, height=height, direction=(0, 1, 0))
    elif primitive.find("cone") is not None:
        cone = primitive.find("cone")
        radius = float(cone.findtext("radius"))
        height = float(cone.findtext("height"))
        shape = pv.Cone(center=(x, y, z), radius=radius, height=height, direction=(0, 1, 0))
    
    if shape is not None:
        # Appliquer les rotations dans l'ordre "rotate_z → rotate_x → rotate_y"
        shape.rotate_z(yaw, point=(x, y, z), inplace=True)
        shape.rotate_x(roll, point=(x, y, z), inplace=True)
        shape.rotate_y(pitch, point=(x, y, z), inplace=True)
        
        # Pour SVM et PLM, on affiche en transparent
        if name in ["SVM", "PLM"]:
            plotter.add_mesh(shape, color="lightgrey", opacity=0.3, show_edges=True)
        else:
            plotter.add_mesh(shape, color="lightgrey", show_edges=True)
        
        plotter.add_point_labels([(x, y, z)], [name], font_size=10, point_color="red", text_color="black")

plotter.show()
