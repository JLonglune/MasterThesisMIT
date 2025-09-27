reset
set term png
set output "oscar.alt.png"
set xdata time
set timefmt "%Y-%m-%d %H:%M:%S"
set format x "%m/%d"
set xtics 345600
set title "DRAMA-2.0\nOrbital Spacecraft Active Removal\nAltitude vs. Time"
set xlabel "Date"
set xrange [*:*]
set yrange [*:2100]
set ylabel  "Altitude [km]\nSingly averaged (over M)"
set key below
plot \
 2000.00 w l lt 03 lw 01 title "Critical Altitude", \
"oscar.oev" u 1:($4*(1.0 - $5) - 6378.137) w l lt 00 lw 01 title "Perigee altitude", \
"oscar.oev" u 1:($4*(1.0 + $5) - 6378.137) w l axes x1y1 lt 01 lw 01 title "Apogee altitude"
