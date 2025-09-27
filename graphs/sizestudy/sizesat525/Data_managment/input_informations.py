import xml.etree.ElementTree as ET
import networkx as nx
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import pygraphviz as pgv
import numpy as np
import hashlib

def get_color(material):
    """Generate a consistent color based on material name."""
    hash_val = int(hashlib.md5(material.encode()).hexdigest(), 16)  # Convert material name to a hash value
    np.random.seed(hash_val % 2**32)  # Set seed based on hash
    rgb = np.random.rand(3,)
    # Convert RGB values to a hex color string
    return '#' + ''.join(f'{int(x * 255):02x}' for x in rgb)

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
        
        # Apply filtering if show_all is False
        if show_all or (mass_threshold is None or mass >= mass_threshold):
            objects[unique_id] = {
                'name': name,
                'id': unique_id,
                'shape': shape,
                'mass': mass,
                'material': material
            }
    
    # Parse relationships
    for inclusion in root.findall('inclusion'):
        parent_id = inclusion.find('parent/uniqueID').text
        for child in inclusion.find('children'):
            if parent_id in objects and child.text in objects:  # Keep only relationships among selected objects
                relationships.append((parent_id, child.text))
    
    return objects, relationships

def display_tree(objects, relationships, show_all):
    G = nx.DiGraph()
    
    # Assign colors based on material using consistent hashing
    unique_materials = list(set(obj['material'] for obj in objects.values()))
    color_map = {mat: get_color(mat) for mat in unique_materials}  # Ensure consistency
    
    for obj_id, obj_data in objects.items():
        label = obj_data['name'] if show_all else f"{obj_data['name']}\n{obj_data['shape']}\n{obj_data['mass']}kg"
        G.add_node(obj_id, label=label, color=color_map[obj_data["material"]])
    
    for parent, child in relationships:
        G.add_edge(parent, child)
    
    pos = nx.nx_agraph.graphviz_layout(G, prog="dot")  # Hierarchical layout
    
    node_colors = [G.nodes[node]["color"] for node in G.nodes]
    
    plt.figure(figsize=(10, 8))
    nx.draw(G, pos, labels={n: G.nodes[n]["label"] for n in G.nodes},
            node_color=node_colors, edge_color="gray", node_size=1200, font_size=6,
            with_labels=True)
    
    # Add legend for materials
    legend_patches = [mpatches.Patch(color=color_map[mat], label=mat) for mat in unique_materials]
    plt.legend(handles=legend_patches, title="Materials", loc="lower right")
    
    plt.title("Filtered Object Hierarchy (Mass > Threshold)")
    plt.show()

if __name__ == "__main__":
    file_path = "SARA/REENTRY/input/objects.xml"
    user_input = input("Enter mass threshold (or 'all' to show all objects): ")
    if user_input.lower() == 'all':
        objects, relationships = parse_objects(file_path, show_all=True)
        # Print total count of objects
        print(f"Total number of objects taken into account: {len(objects)}")
        # Print only names when displaying all objects
        for obj in objects.values():
            print(f"Name: {obj['name']}")
        display_tree(objects, relationships, show_all=True)
    else:
        try:
            threshold = float(user_input)
            objects, relationships = parse_objects(file_path, mass_threshold=threshold)
            # Print total count of objects
            print(f"Total number of objects taken into account: {len(objects)}")
            # Print object details
            for obj in objects.values():
                print(f"Name: {obj['name']}, ID: {obj['id']}, Shape: {obj['shape']}, Mass: {obj['mass']}, Material: {obj['material']}")
            display_tree(objects, relationships, show_all=False)
        except ValueError:
            print("Invalid input. Defaulting to all objects.")
            objects, relationships = parse_objects(file_path, show_all=True)
            # Print total count of objects
            print(f"Total number of objects taken into account: {len(objects)}")
            for obj in objects.values():
                print(f"Name: {obj['name']}")
            display_tree(objects, relationships, show_all=True)
