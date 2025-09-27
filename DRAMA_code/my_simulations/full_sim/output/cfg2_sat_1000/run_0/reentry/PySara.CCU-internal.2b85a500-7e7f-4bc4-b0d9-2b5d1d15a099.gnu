 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.CCU-internal.2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of CCU-internal (2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.CCU-internal.2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099_Trajectory.txt' using 1:2 w l ls 1 title 'CCU-internal' noenhanced, \
 
set o 'PySara.CCU-internal.2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of CCU-internal (2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.CCU-internal.2b85a500-7e7f-4bc4-b0d9-2b5d1d15a099_Trajectory.txt' using 6:2 w l ls 1 title 'CCU-internal' noenhanced
 
