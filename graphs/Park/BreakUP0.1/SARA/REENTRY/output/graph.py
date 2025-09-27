import pandas as pd
import matplotlib.pyplot as plt

# Liste des fichiers de trajectoire
trajectory_files = {
    "Case 3 Hollow": "BreakUP/SARA/REENTRY/output/sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt",
    "Case 3 Solid": "BreakUP/SARA/REENTRY/output/sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt",
    "Case 4 Hollow": "BreakUP/SARA/REENTRY/output/sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt",
    "Case 4 Solid": "BreakUP/SARA/REENTRY/output/sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt",
    "Parent": "BreakUP/SARA/REENTRY/output/sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"
}

# --- 2. Noms de colonnes DRAMA ---
columns = [
    "Time", "Altitude", "Latitude", "Longitude", "Velocity", "Downrange",
    "Drag", "Lift", "Side", "Knudsen", "Mach", "Flight_Path", "Heading", "Density"
]

# --- 3. Chargement des données ---
trajectories = {}

for label, path in trajectory_files.items():
    df = pd.read_csv(
        path,
        comment="#",
        sep=r'\s+',
        engine="python",
        names=columns,
        skiprows=1
    )
    trajectories[label] = df

# --- 4. Vérification rapide des valeurs ---
print("\n--- Résumé des Downranges et Altitudes ---")
for label, df in trajectories.items():
    print(f"{label}: Downrange max = {df['Downrange'].max():.0f} km | Altitude max = {df['Altitude'].max():.1f} km")

# --- 5. Altitude vs Time ---
plt.figure(figsize=(12, 6))
for label, df in trajectories.items():
    plt.plot(df["Time"], df["Altitude"], label=label)
plt.xlabel("Time [s]")
plt.ylabel("Altitude [km]")
plt.title("Altitude vs Time")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()

# --- 6. Altitude vs Downrange ---
plt.figure(figsize=(12, 6))
for label, df in trajectories.items():
    # ⚠️ Filtrer si nécessaire pour éviter des erreurs de lecture (par ex. >100000 km)
    filtered = df[df["Downrange"] < 100000]
    plt.plot(filtered["Downrange"], filtered["Altitude"], label=label)
plt.xlabel("Downrange [km]")
plt.ylabel("Altitude [km]")
plt.title("Altitude vs Downrange")
plt.grid(True)
plt.legend()
plt.tight_layout()
plt.show()
