import pyvista as pv
from lxml import etree

# Charger le fichier XML
tree = etree.parse("sizesat2583/SARA/REENTRY/input/objects.xml")
root = tree.getroot()

# Ajouter un mode "normal" en plus
modes = ["normal", "transparent", "clipped", "wireframe", "internal"]
plotter = pv.Plotter(shape=(2, 3))  # 2 lignes, 3 colonnes

for i, mode in enumerate(modes):
    plotter.subplot(i // 3, i % 3)
    plotter.add_text(mode.upper(), font_size=10)

    for obj in root.findall("object"):
        name = obj.findtext("name")
        primitive = obj.find("primitive")
        position = obj.find("relativePosition")
        x = float(position.findtext("cartX"))
        y = float(position.findtext("cartY"))
        z = float(position.findtext("cartZ"))

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
            if mode == "normal":
                plotter.add_mesh(shape, color="white", show_edges=True)

            elif mode == "transparent":
                plotter.add_mesh(shape, color="lightblue", show_edges=True, opacity=0.3)

            elif mode == "clipped":
                clipped = shape.clip(normal='x', origin=(x, y, z))
                plotter.add_mesh(clipped, color="orange", show_edges=True)

            elif mode == "wireframe":
                plotter.add_mesh(shape, style='wireframe', color="black")

            elif mode == "internal":
                if "internal" in name.lower():
                    plotter.add_mesh(shape, color="red", show_edges=True)

plotter.show()
