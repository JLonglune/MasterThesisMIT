 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.DBU1.b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DBU1 (b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.DBU1.b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb_Trajectory.txt' using 1:2 w l ls 1 title 'DBU1' noenhanced, \
 
set o 'PySara.DBU1.b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DBU1 (b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.DBU1.b8b303d2-e3bb-4d85-8dc1-a7fdc76026fb_Trajectory.txt' using 6:2 w l ls 1 title 'DBU1' noenhanced
 
