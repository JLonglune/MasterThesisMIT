#!/usr/bin/env python3
import os
import random
import xml.etree.ElementTree as ET
import xml.dom.minidom as minidom

# 1) Définition des paramètres de configuration
#    - intervalles: listes [min, max]
#    - valeurs discrètes: listes de plusieurs éléments
#    - valeurs fixes: listes à un élément
config_ranges = {
    "inputMethod":               ["normal"],
    "runMode":                   ["reentry-risk"],
    "monteCarlo":                [False],
    "reentryType":               ["uncontrolled"],
    "uncontrolledMethod":        ["fullOrbit"],
    "growthScenario":            ["MEDIUM-VARIANT"],
    "coordinateSystem":          ["keplerian"],
    "attitude":                  ["nadir-pointing"],
    "fragmentsAttitudeAfterBreakup": ["tumbling"],
    "dynamicEnvironment":        [True],
    "useWind":                   [True],
    "solarActivityFromFile":     [True],
    "useEnvironmentCSV":         [False],
    "plotVisibilityMaps":        [False],
    "plotObjectTrajectories":    [False],
    "propagationWithOscar":      [True],
    "casualtyThreshold":         [15.0],
    # Intervalles (min, max)
    "element1":                  [6678.0, 6878.0],  # altitude 300–500 km
    "element2":                  [0.00, 0.005],      # excentricité
    "element3":                  [40.0, 100.0],      # inclinaison
    "element4":                  [0.0, 360.0],       # nœud ascendant
    "element5":                  [0.0, 360.0],       # argument du périastre
    "element6":                  [0.0, 360.0],       # anomalie vraie
    # Valeurs fixes
    "assumedCrossSection":       [10.0],
    "dragCoefficient":           [2.2],
    "reflectivityCoefficient":   [1.3],
    "voxelatorResolutionLength": [0.1],
    "energyThreshold":           [15.0],
    "densityScalingFactor":      [1.0],
    "ap":                        [15.0],
    "f107a":                     [120.0]
}

# 2) Clés définies comme intervalles (pour échantillonnage uniforme)
interval_keys = ["element1", "element2", "element3",
                 "element4", "element5", "element6"]

# 3) Nombre de configurations aléatoires à générer
num_samples = 30

# 4) Génération des configurations
generated_configs = []
for i in range(1, num_samples + 1):
    cfg = {}
    for key, values in config_ranges.items():
        if key in interval_keys and len(values) == 2:
            low, high = values
            cfg[key] = random.uniform(low, high)
        elif len(values) > 1:
            cfg[key] = random.choice(values)
        else:
            cfg[key] = values[0]
    generated_configs.append(cfg)
    print(f"Config {i}: {cfg}")
print(f"\nTotal number of generated configurations: {num_samples}\n")

# 5) Construction de l'arbre XML
root = ET.Element("Configurations")
for cfg in generated_configs:
    cfg_elem = ET.SubElement(root, "Configuration")
    for k, v in cfg.items():
        ET.SubElement(cfg_elem, "Parameter", name=k).text = str(v)

# 6) Pretty-print et insertion de lignes vides
rough = ET.tostring(root, 'utf-8')
parsed = minidom.parseString(rough)
pretty = parsed.toprettyxml(indent="  ")
pretty = pretty.replace("</Configuration>\n", "</Configuration>\n\n")

# 7) Écriture du fichier XML
output_dir = "my_simulations/config_modif"
os.makedirs(output_dir, exist_ok=True)
xml_path = os.path.join(output_dir, "sample_configurations.xml")
with open(xml_path, 'w', encoding='utf-8') as f:
    f.write(pretty)

print(f"Écrit {num_samples} configurations aléatoires dans {xml_path}")
