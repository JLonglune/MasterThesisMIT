 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.DBU2.c7768e71-50e7-47a0-a4c4-6b535ac78276_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DBU2 (c7768e71-50e7-47a0-a4c4-6b535ac78276)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.DBU2.c7768e71-50e7-47a0-a4c4-6b535ac78276_Trajectory.txt' using 1:2 w l ls 1 title 'DBU2' noenhanced, \
 
set o 'PySara.DBU2.c7768e71-50e7-47a0-a4c4-6b535ac78276_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DBU2 (c7768e71-50e7-47a0-a4c4-6b535ac78276)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.DBU2.c7768e71-50e7-47a0-a4c4-6b535ac78276_Trajectory.txt' using 6:2 w l ls 1 title 'DBU2' noenhanced
 
