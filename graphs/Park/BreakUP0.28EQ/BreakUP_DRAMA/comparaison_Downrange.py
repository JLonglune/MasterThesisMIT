import pandas as pd
import matplotlib.pyplot as plt

# -----------------------------
# DRAMA DATA (from .txt files)
# -----------------------------
drama_files = {
    "Case 3 Hollow": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt",
    "Case 3 Solid": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt",
    "Case 4 Hollow": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt",
    "Case 4 Solid": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt",
    "Parent": "BreakUP0.28NEQ/SARA/REENTRY/output/sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"
}

drama_columns = [
    "Time", "Altitude", "Latitude", "Longitude", "Velocity", "Downrange",
    "Drag", "Lift", "Side", "Knudsen", "Mach", "Flight_Path", "Heading", "Density"
]

drama_data = {}
for label, path in drama_files.items():
    df = pd.read_csv(path, sep=r'\s+', engine='python', comment='#', names=drama_columns, skiprows=1)
    drama_data[label] = df

# -----------------------------
# NEQ DATA (from .csv files)
# -----------------------------
neq_files = {
    "Parent": "BreakUP0.28NEQ/Downrange/NEQ_parent.csv",
    "Case 3 Solid": "BreakUP0.28NEQ/Downrange/NEQ_case3_solid.csv",
    "Case 3 Hollow": "BreakUP0.28NEQ/Downrange/NEQ_Case3_hollow.csv",
    "Case 4 Solid": "BreakUP0.28NEQ/Downrange/NEQ_Case4_solid.csv",
    "Case 4 Hollow": "BreakUP0.28NEQ/Downrange/NEQ_Case4_hollow.csv"
}

neq_data = {}
for label, path in neq_files.items():
    df = pd.read_csv(path)
    df.columns = df.columns.str.strip()  # Nettoyage des noms de colonnes
    neq_data[label] = df

# -----------------------------
# PLOT: Altitude vs Downrange
# -----------------------------
plt.figure(figsize=(12, 6))

# DRAMA curves (from txt files)
for label, df in drama_data.items():
    plt.plot(df["Downrange"], df["Altitude"], label=f"{label} (DRAMA)", linestyle='-')

# NEQ curves (from csv files)
for label, df in neq_data.items():
    plt.plot(df["x"], df["y"], label=f"{label} (NEQ)", linestyle='--')

plt.xlabel("Downrange [km]")
plt.ylabel("Altitude [km]")
plt.title("Comparison: DRAMA vs NEQ — Altitude vs Downrange")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()


import numpy as np
import pandas as pd

def get_downrange_at_altitude(df, altitude_col, downrange_col, target_altitude):
    df_sorted = df.sort_values(by=altitude_col)
    if df_sorted[altitude_col].min() > target_altitude or df_sorted[altitude_col].max() < target_altitude:
        return np.nan
    return np.interp(target_altitude, df_sorted[altitude_col], df_sorted[downrange_col])

results = []

# 🎯 1. Parent à 91 km
parent_target_alt = 91
drama_parent = drama_data["Parent"]
neq_parent = neq_data["Parent"]

drama_parent_downrange = get_downrange_at_altitude(drama_parent, "Altitude", "Downrange", parent_target_alt)
neq_parent_downrange = get_downrange_at_altitude(neq_parent, "y", "x", parent_target_alt)
diff_parent = drama_parent_downrange - neq_parent_downrange

results.append({
    "Label": "Parent",
    "Target Altitude [km]": parent_target_alt,
    "DRAMA Downrange [km]": round(drama_parent_downrange, 3),
    "NEQ Downrange [km]": round(neq_parent_downrange, 3),
    "Difference [km]": round(diff_parent, 3)
})

# 👶 2. Enfants à 0 km
children_labels = ["Case 3 Hollow", "Case 3 Solid", "Case 4 Hollow", "Case 4 Solid"]
children_target_alt = 1

for label in children_labels:
    drama_df = drama_data[label]
    neq_df = neq_data[label]

    drama_downrange = get_downrange_at_altitude(drama_df, "Altitude", "Downrange", children_target_alt)
    neq_downrange = get_downrange_at_altitude(neq_df, "y", "x", children_target_alt)

    diff = drama_downrange - neq_downrange

    results.append({
        "Label": label,
        "Target Altitude [km]": children_target_alt,
        "DRAMA Downrange [km]": round(drama_downrange, 3),
        "NEQ Downrange [km]": round(neq_downrange, 3),
        "Difference [km]": round(diff, 3)
    })

# 📊 Affichage
# -----------------------------
# PLOT: Altitude vs Downrange
# -----------------------------
plt.figure(figsize=(12, 6))

# DRAMA curves (from txt files)
for label, df in drama_data.items():
    plt.plot(df["Downrange"], df["Altitude"], label=f"{label} (DRAMA)", linestyle='-')

# NEQ curves (from csv files)
for label, df in neq_data.items():
    plt.plot(df["x"], df["y"], label=f"{label} (NEQ)", linestyle='--')

# -----------------------------
# TRAITS DE DIFFÉRENCE + ANNOTATIONS
# -----------------------------

# Ligne pour le Parent @ 91 km
plt.plot([drama_parent_downrange, neq_parent_downrange],
         [parent_target_alt, parent_target_alt],
         'b--')  # Ligne bleue pointillée

mid_x = (drama_parent_downrange + neq_parent_downrange) / 2
plt.annotate(f"{round(diff_parent, 2)} km",
             (mid_x, parent_target_alt),
             textcoords="offset points",
             xytext=(0, 10),
             ha='center',
             fontsize=9,
             color='blue')

# Lignes pour les Enfants @  km (avec décalage)
y_base = children_target_alt
offset_step = 10  # pixels
for i, label in enumerate(children_labels):
    drama_df = drama_data[label]
    neq_df = neq_data[label]

    x_drama = get_downrange_at_altitude(drama_df, "Altitude", "Downrange", y_base)
    x_neq = get_downrange_at_altitude(neq_df, "y", "x", y_base)
    diff = round(x_drama - x_neq, 2)
    mid_x = (x_drama + x_neq) / 2

    # Trait horizontal rouge
    plt.plot([x_drama, x_neq], [y_base, y_base], 'r--')

    # Décalage vertical différent pour chaque annotation
    offset_y = 10 + i * offset_step

    plt.annotate(f"{label}: {diff} km",
                 (mid_x, y_base),
                 textcoords="offset points",
                 xytext=(0, offset_y),
                 ha='center',
                 fontsize=8,
                 color='red')



# Finalisation du plot
plt.xlabel("Downrange [km]")
plt.ylabel("Altitude [km]")
plt.title("Comparison: DRAMA vs NEQ — Altitude vs Downrange")
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
