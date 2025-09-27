 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.NIU-internal.c2ab41aa-4d29-4562-881d-250dc4304964_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of NIU-internal (c2ab41aa-4d29-4562-881d-250dc4304964)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.NIU-internal.c2ab41aa-4d29-4562-881d-250dc4304964_Trajectory.txt' using 1:2 w l ls 1 title 'NIU-internal' noenhanced, \
 
set o 'PySara.NIU-internal.c2ab41aa-4d29-4562-881d-250dc4304964_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of NIU-internal (c2ab41aa-4d29-4562-881d-250dc4304964)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.NIU-internal.c2ab41aa-4d29-4562-881d-250dc4304964_Trajectory.txt' using 6:2 w l ls 1 title 'NIU-internal' noenhanced
 
