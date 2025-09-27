#!/usr/bin/env python
import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# -----------------------------
# Helper
# -----------------------------
def get_downrange_at_altitude(df, alt_col, dr_col, target_alt):
    df2 = df.sort_values(by=alt_col)
    if df2[alt_col].min() > target_alt or df2[alt_col].max() < target_alt:
        return np.nan
    return np.interp(target_alt, df2[alt_col], df2[dr_col])

# -----------------------------
# File loading
# -----------------------------
drama_files = {
    "Case 3 Hollow": "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt",
    "Case 3 Solid":  "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt",
    "Case 4 Hollow": "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt",
    "Case 4 Solid":  "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt",
    "Compound":      "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.Compound_of-case3_hollow-case4_hollow-"
                      "case4_solid-case3_solid.4519942503439007991_Trajectory.txt",
    "Parent":        "BreakUP0.28EQ/SARA/REENTRY/output/"
                      "sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt"
}
drama_cols = [
    "Time","Altitude","Latitude","Longitude","Velocity","Downrange",
    "Drag","Lift","Side","Knudsen","Mach","Flight_Path","Heading","Density"
]
drama_data = {
    lbl: pd.read_csv(path,
                    sep=r'\s+', engine='python', comment='#',
                    names=drama_cols, skiprows=1)
    for lbl, path in drama_files.items()
}

neq_files = {
    "Parent":        "BreakUP0.28EQ/Downrange/EQ_parent.csv",
    "Case 3 Solid":  "BreakUP0.28EQ/Downrange/EQ_case3_solid.csv",
    "Case 3 Hollow": "BreakUP0.28EQ/Downrange/EQ_Case3_hollow.csv",
    "Case 4 Solid":  "BreakUP0.28EQ/Downrange/EQ_Case4_solid.csv",
    "Case 4 Hollow": "BreakUP0.28EQ/Downrange/EQ_Case4_hollow.csv"
}
neq_data = {}
for lbl, path in neq_files.items():
    df = pd.read_csv(path)
    df.columns = df.columns.str.strip()
    neq_data[lbl] = df

# -----------------------------
# Colour map (same as time plots)
# -----------------------------
colors = {
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
# PLOT 1: Altitude vs Downrange (no diffs)
# -----------------------------
plt.figure(figsize=(12, 6))

# DRAMA
for lbl, df in drama_data.items():
    plt.plot(df["Downrange"], df["Altitude"],
             label=f"{lbl} (DRAMA)",
             color=colors.get(lbl, "gray"),
             linestyle='-')

# EQ
for lbl, df in neq_data.items():
    plt.plot(df["x"], df["y"],
             label=f"{lbl} (Park)",
             color=colors.get(lbl, "gray"),
             linestyle='--')

plt.xlabel("Downrange [km]", fontsize=12)
plt.ylabel("Altitude [km]", fontsize=12)
plt.title("Comparison: DRAMA vs Park (EQ) — Altitude vs Downrange", fontsize=14)
plt.legend(fontsize=10)
plt.grid(True, which='both', linestyle=':')
plt.tight_layout()

# save PLOT 1
base1 = "Downrange_vs_Altitude_no_diff"
for ext in ("png", "pdf"):
    p = os.path.join(out_dir, f"{base1}.{ext}")
    plt.savefig(p, dpi=300, format=ext, bbox_inches="tight")
    print(f"Saved {p!r}")

plt.close()

# -----------------------------
# PLOT 2: Altitude vs Downrange (with diffs)
# -----------------------------
plt.figure(figsize=(12, 6))

# DRAMA
for lbl, df in drama_data.items():
    plt.plot(df["Downrange"], df["Altitude"],
             label=f"{lbl} (DRAMA)",
             color=colors.get(lbl, "gray"),
             linestyle='-',
             zorder=3)

# EQ
for lbl, df in neq_data.items():
    plt.plot(df["x"], df["y"],
             label=f"{lbl} (Park)",
             color=colors.get(lbl, "gray"),
             linestyle='--',
             zorder=2)

# diff @ 91 km for Parent
parent_alt = 91
dr_dr = get_downrange_at_altitude(drama_data["Parent"], "Altitude", "Downrange", parent_alt)
eq_dr = get_downrange_at_altitude(neq_data["Parent"],    "y",        "x",          parent_alt)
if not np.isnan(dr_dr) and not np.isnan(eq_dr):
    plt.plot([dr_dr, eq_dr], [parent_alt, parent_alt],
             linestyle='--', color="blue", zorder=4)
    mid = (dr_dr + eq_dr)/2
    plt.annotate(f"{round(dr_dr-eq_dr,2)} km",
                 (mid, parent_alt),
                 textcoords="offset points",
                 xytext=(0,10),
                 ha="center",
                 color="blue",
                 fontsize=9)

# diffs @ 1 km for children
children = ["Case 3 Hollow","Case 3 Solid","Case 4 Hollow","Case 4 Solid"]
for i, lbl in enumerate(children):
    a = 1
    dr_dr = get_downrange_at_altitude(drama_data[lbl], "Altitude", "Downrange", a)
    eq_dr = get_downrange_at_altitude(neq_data[lbl],    "y",        "x",          a)
    if not np.isnan(dr_dr) and not np.isnan(eq_dr):
        plt.plot([dr_dr, eq_dr], [a, a],
                 linestyle='--', color="red", zorder=4)
        mid = (dr_dr + eq_dr)/2
        plt.annotate(f"{lbl}: {round(dr_dr-eq_dr,2)} km",
                     (mid, a),
                     textcoords="offset points",
                     xytext=(0, 10 + i*8),
                     ha="center",
                     color="red",
                     fontsize=8)

plt.xlabel("Downrange [km]", fontsize=12)
plt.ylabel("Altitude [km]", fontsize=12)
plt.title("Comparison: DRAMA vs PARK (EQ) — Altitude vs Downrange (With Differences)", fontsize=14)
plt.legend(loc="upper center", ncol=2, fontsize=9, frameon=False)
plt.grid(True, which='both', linestyle=':')
plt.tight_layout()

# save PLOT 2
base2 = "Downrange_vs_Altitude_with_diff"
for ext in ("png", "pdf"):
    p = os.path.join(out_dir, f"{base2}.{ext}")
    plt.savefig(p, dpi=300, format=ext, bbox_inches="tight")
    print(f"Saved {p!r}")

plt.show()
