import pandas as pd
import matplotlib.pyplot as plt

files = {
    "-0.01°": "moins0point01.txt",
    "-1°": "moins1.txt",
    "-3°": "moins3.txt",
    "-5°": "moins5.txt"
}

def extract_downrange_altitude(filepath):
    downrange = []
    altitude = []

    with open(filepath, 'r') as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) >= 6:
                try:
                    alt = float(parts[1])
                    dr = float(parts[5])
                    altitude.append(alt)
                    downrange.append(dr)
                except ValueError:
                    continue  # Ignore lines that aren't data

    return pd.DataFrame({"Downrange": downrange, "Altitude": altitude})

# Lire les fichiers
dataframes = {}
for angle, path in files.items():
    df = extract_downrange_altitude(path)
    print(f"{angle}: {len(df)} points extraits")  # DEBUG
    dataframes[angle] = df

# Plot
plt.figure(figsize=(10, 6))
for angle, df in dataframes.items():
    if not df.empty:
        plt.plot(df["Downrange"], df["Altitude"], label=f"FPA {angle}")

plt.title("Altitude vs Downrange pour différents Flight Path Angles for a sphere of 20cm diameter and 50kg in AA7075")
plt.xlabel("Downrange [km]")
plt.ylabel("Altitude [km]")
plt.legend()
plt.grid(True)
plt.tight_layout()

plt.savefig("altitude_vs_downrange.pdf")
print("✅ Graphique enregistré sous 'altitude_vs_downrange.pdf'.")

plt.show()
