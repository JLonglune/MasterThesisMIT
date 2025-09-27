#!/usr/bin/env python
import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# -----------------------------
# Load DRAMA Data
# -----------------------------
drama_files = {
    "Case 3 Hollow": "BreakUP0.28EQ/SARA/REENTRY/output/sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt",
    "Case 3 Solid":  "BreakUP0.28EQ/SARA/REENTRY/output/sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt",
    "Case 4 Hollow": "BreakUP0.28EQ/SARA/REENTRY/output/sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt",
    "Case 4 Solid":  "BreakUP0.28EQ/SARA/REENTRY/output/sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt",
    "Compound":      "BreakUP0.28EQ/SARA/REENTRY/output/sara.Compound_of-case3_hollow-case4_hollow-case4_solid-case3_solid.4519942503439007991_Trajectory.txt",
    "Parent":        "BreakUP0.28EQ/SARA/REENTRY/output/sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"
}

drama_columns = [
    "Time", "Altitude", "Latitude", "Longitude", "Velocity", "Downrange",
    "Drag", "Lift", "Side", "Knudsen", "Mach", "Flight_Path", "Heading", "Density"
]

drama_data = {
    label: pd.read_csv(path, sep=r'\s+', engine='python', comment='#',
                       names=drama_columns, skiprows=1)
    for label, path in drama_files.items()
}

# -----------------------------
# Load EQ Data
# -----------------------------
eq_files = {
    "Case 3 Solid":  "BreakUP0.28EQ/Time/EQ_case3_solid.csv",
    "Case 3 Hollow": "BreakUP0.28EQ/Time/EQ_case3_hollow.csv",
    "Case 4 Solid":  "BreakUP0.28EQ/Time/EQ_Case4_solid.csv",
    "Case 4 Hollow": "BreakUP0.28EQ/Time/EQ_Case4_hollow.csv",
    "Parent":        "BreakUP0.28EQ/Time/EQ_parent.csv"
}

eq_data = {
    label: pd.read_csv(path).rename(columns=lambda c: c.strip())
    for label, path in eq_files.items()
}

# -----------------------------
# Interpolation Helper
# -----------------------------
def get_value_at_altitude(df, altitude_col, value_col, target_altitude):
    df_sorted = df.sort_values(by=altitude_col)
    if df_sorted[altitude_col].min() > target_altitude or df_sorted[altitude_col].max() < target_altitude:
        return np.nan
    return np.interp(target_altitude, df_sorted[altitude_col], df_sorted[value_col])

# -----------------------------
# Color Map
# -----------------------------
color_map = {
    "Case 3 Hollow": "tab:blue",
    "Case 3 Solid":  "tab:orange",
    "Case 4 Hollow": "tab:green",
    "Case 4 Solid":  "tab:red",
    "Parent":        "tab:purple",
    "Compound":      "tab:brown"
}

# -----------------------------
# Prepare output directory
# -----------------------------
script_dir = os.path.dirname(os.path.abspath(__file__))
out_dir = os.path.join(script_dir, "figures")
os.makedirs(out_dir, exist_ok=True)

# -----------------------------
# PLOT 1: Altitude vs Time (No difference lines)
# -----------------------------
plt.figure(figsize=(12, 6))

for label, df in drama_data.items():
    plt.plot(df["Time"], df["Altitude"],
             label=f"{label} (DRAMA)",
             linestyle='-',
             color=color_map.get(label, "gray"))

for label, df in eq_data.items():
    plt.plot(df["x"], df["y"],
             label=f"{label} (Park)",
             linestyle='--',
             color=color_map.get(label, "gray"))

plt.xlabel("Time [s]")
plt.ylabel("Altitude [km]")
plt.title("Comparison: DRAMA vs Park(EQ) — Altitude vs Time")
plt.legend()
plt.grid(True)
plt.tight_layout()

# Save Plot 1 as PNG & PDF
base1 = "Altitude_vs_Time_no_diff"
for ext in ("png", "pdf"):
    path = os.path.join(out_dir, f"{base1}.{ext}")
    plt.savefig(path, dpi=300, format=ext, bbox_inches="tight")
    print(f"Saved {path!r}")

plt.show()

# -----------------------------
# PLOT 2: Altitude vs Time (With difference lines)
# -----------------------------
plt.figure(figsize=(12, 6))

for label, df in drama_data.items():
    plt.plot(df["Time"], df["Altitude"],
             label=f"{label} (DRAMA)",
             linestyle='-',
             color=color_map.get(label, "gray"))

for label, df in eq_data.items():
    plt.plot(df["x"], df["y"],
             label=f"{label} (Park)",
             linestyle='--',
             color=color_map.get(label, "gray"))

# Highlight difference at max altitude for Case 3 Hollow
ref_label = "Case 3 Hollow"
drama_ref = drama_data[ref_label]
eq_ref = eq_data[ref_label]
alt_max = 90

t_drama = get_value_at_altitude(drama_ref, "Altitude", "Time", alt_max)
t_eq = get_value_at_altitude(eq_ref, "y", "x", alt_max)

if not np.isnan(t_drama) and not np.isnan(t_eq):
    diff = round(t_drama - t_eq, 2)
    mid_t = (t_drama + t_eq) / 2
    plt.plot([t_drama, t_eq], [alt_max, alt_max], 'b--')
    plt.annotate(f"{ref_label} max alt diff: {diff} s",
                 (mid_t, alt_max),
                 textcoords="offset points",
                 xytext=(0, 10),
                 ha='center',
                 fontsize=9,
                 color='blue')
else:
    print(f"[⚠️] Could not interpolate at {alt_max:.2f} km for {ref_label}")

# Highlight difference at 1 km for child cases
children_labels = ["Case 3 Hollow", "Case 3 Solid", "Case 4 Hollow", "Case 4 Solid"]
target_alt = 1
offset_step = 10

for i, label in enumerate(children_labels):
    t_drama = get_value_at_altitude(drama_data[label], "Altitude", "Time", target_alt)
    t_eq = get_value_at_altitude(eq_data[label], "y", "x", target_alt)

    if not np.isnan(t_drama) and not np.isnan(t_eq):
        diff = round(t_drama - t_eq, 2)
        mid_t = (t_drama + t_eq) / 2
        offset_y = 10 + i * offset_step

        plt.plot([t_drama, t_eq], [target_alt, target_alt], 'r--')
        plt.annotate(f"{label}: {diff} s",
                     (mid_t, target_alt),
                     textcoords="offset points",
                     xytext=(0, offset_y),
                     ha='center',
                     fontsize=8,
                     color='red')
    else:
        print(f"[⚠️] Could not interpolate at {target_alt:.2f} km for {label}")

plt.xlabel("Time [s]")
plt.ylabel("Altitude [km]")
plt.title("Comparison: DRAMA vs Park(EQ) — Altitude vs Time (With Differences)")
plt.legend()
plt.grid(True)
plt.tight_layout()

# Save Plot 2 as PNG & PDF
base2 = "Altitude_vs_Time_with_diff"
for ext in ("png", "pdf"):
    path = os.path.join(out_dir, f"{base2}.{ext}")
    plt.savefig(path, dpi=300, format=ext, bbox_inches="tight")
    print(f"Saved {path!r}")

plt.show()
