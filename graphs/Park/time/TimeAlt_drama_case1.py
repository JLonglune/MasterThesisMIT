import pandas as pd

# Chemin absolu vers le fichier source
file_path = "/Users/jeannelonglune/Desktop/case1_DRAMA/SARA/REENTRY/output/sara.new_object.8cdd1025-8654-431b-96ab-e0b972a7ddd1_AeroThermalHistory.txt"

# Lecture du fichier en utilisant un séparateur basé sur les espaces et en ignorant les lignes commentées
data = pd.read_csv(
    file_path,
    sep=r'\s+',
    comment="#",
    header=None
)

# Extraction des deux premières colonnes : temps et altitude
data = data.iloc[:, :2]
data.columns = ['Temps (s)', 'Altitude (km)']

# Enregistrement du DataFrame dans un fichier CSV
data.to_csv("case1_DRAMA.csv", index=False)

print("Les résultats ont été enregistrés dans le fichier resultats.csv")
