reset
set term png
set output "oscar.adc.png"
set arrow 1 from 35586,-15 to 35586,15 nohead lt -1 lw 3
set arrow 2 from 35586,15 to 35986,15 nohead lt -1 lw 3
set arrow 3 from 35586,-15 to 35986,-15 nohead lt -1 lw 3
set arrow 4 from 35986,-15 to 35986,15 nohead lt -1 lw 3
set title "DRAMA-2.0\nOrbital Spacecraft Active Removal\nAltitude vs. Declination"
set xlabel "Altitude [km]\nSingly averaged (over M)"
set ylabel "Declination [deg]\nSingly averaged (over M)"
set xrange [33500:38000]
set yrange [-60:60]
set ytics 15
set grid xtics ytics
set key below
plot \
"oscar.oad" u 3:4 w l lt 00 lw 01 notitle
