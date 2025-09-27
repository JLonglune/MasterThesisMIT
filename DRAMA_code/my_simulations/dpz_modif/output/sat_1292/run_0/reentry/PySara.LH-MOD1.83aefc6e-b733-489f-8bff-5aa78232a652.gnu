 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.LH-MOD1.83aefc6e-b733-489f-8bff-5aa78232a652_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of LH-MOD1 (83aefc6e-b733-489f-8bff-5aa78232a652)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.LH-MOD1.83aefc6e-b733-489f-8bff-5aa78232a652_Trajectory.txt' using 1:2 w l ls 1 title 'LH-MOD1' noenhanced, \
 
set o 'PySara.LH-MOD1.83aefc6e-b733-489f-8bff-5aa78232a652_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of LH-MOD1 (83aefc6e-b733-489f-8bff-5aa78232a652)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.LH-MOD1.83aefc6e-b733-489f-8bff-5aa78232a652_Trajectory.txt' using 6:2 w l ls 1 title 'LH-MOD1' noenhanced
 
