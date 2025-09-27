import pandas as pd
import matplotlib.pyplot as plt

# Chargement des fichiers CSV
parent = pd.read_csv("BreakUP0.28NEQ/Downrange/NEQ_parent.csv")
case3_solid = pd.read_csv("BreakUP0.28NEQ/Downrange/NEQ_case3_solid.csv")
case3_hollow = pd.read_csv("BreakUP0.28NEQ/Downrange/NEQ_Case3_hollow.csv")
case4_solid = pd.read_csv("BreakUP0.28NEQ/Downrange/NEQ_Case4_solid.csv")
case4_hollow = pd.read_csv("BreakUP0.28NEQ/Downrange/NEQ_Case4_hollow.csv")

# Nettoyage des noms de colonnes
datasets = [parent, case3_solid, case3_hollow, case4_solid, case4_hollow]
for df in datasets:
    df.columns = df.columns.str.strip()

# Création du graphique
plt.figure(figsize=(12, 8))

plt.plot(parent['x'], parent['y'], label='Parent', linestyle='-')
plt.plot(case3_solid['x'], case3_solid['y'], label='Case 3 Solid', linestyle='--')
plt.plot(case3_hollow['x'], case3_hollow['y'], label='Case 3 Hollow', linestyle='--')
plt.plot(case4_solid['x'], case4_solid['y'], label='Case 4 Solid', linestyle='-.')
plt.plot(case4_hollow['x'], case4_hollow['y'], label='Case 4 Hollow', linestyle='-.')

# Personnalisation
plt.xlabel('Downrange [km]')
plt.ylabel('Altitude [km]')
plt.title('NEQ Comparison')
plt.legend()
plt.grid(True)
plt.tight_layout()

# Affichage
plt.show()