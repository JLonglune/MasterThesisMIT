reset
set term png
set output "oscar.inc.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%Y"
set title "DRAMA\nOSCAR - Orbital Spacecraft Active Removal\nInclination vs. Time"
set xlabel "Date"
set ylabel "Inclination [deg]\nSingly averaged (over M)"
set xrange [*:*]
set yrange [*:*]
set format y "%6.2f"
set key below
plot \
"oscar.oev" u 1:6 w l lt 01 lw 01 notitle
