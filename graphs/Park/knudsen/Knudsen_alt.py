import pandas as pd

# Chemin absolu vers le fichier source
file_path = "/Users/jeannelonglune/Desktop/case1_DRAMA/SARA/REENTRY/output/sara.new_object.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"

# Définir les noms de colonnes tels qu'ils figurent dans le fichier
col_names = [
    "Time (s)", "Altitude (km)", "Lat (deg)", "Lon (deg)", "Velocity (km/s)",
    "Downrange (km)", "Drag", "Lift", "Side", "Knudsen", "Mach",
    "Flight Path (deg)", "Heading (deg)", "Density (kg/m^2)"
]

# Lecture du fichier en utilisant un séparateur basé sur les espaces et en ignorant les lignes commençant par "#"
data = pd.read_csv(file_path, sep=r'\s+', comment="#", header=None, names=col_names)

# Extraction des colonnes "Altitude (km)" et "Knudsen"
data = data[["Altitude (km)", "Knudsen"]]

# Enregistrement du DataFrame dans un fichier CSV
data.to_csv("case1_DRAMA_Knudsen_altitude.csv", index=False)

print("Les résultats ont été enregistrés dans le fichier case1_DRAMA_Knudsen_altitude.csv")
