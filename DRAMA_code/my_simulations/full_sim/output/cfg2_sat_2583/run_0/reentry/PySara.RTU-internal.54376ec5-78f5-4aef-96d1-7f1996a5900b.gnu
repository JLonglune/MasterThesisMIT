 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.RTU-internal.54376ec5-78f5-4aef-96d1-7f1996a5900b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RTU-internal (54376ec5-78f5-4aef-96d1-7f1996a5900b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.RTU-internal.54376ec5-78f5-4aef-96d1-7f1996a5900b_Trajectory.txt' using 1:2 w l ls 1 title 'RTU-internal' noenhanced, \
 
set o 'PySara.RTU-internal.54376ec5-78f5-4aef-96d1-7f1996a5900b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RTU-internal (54376ec5-78f5-4aef-96d1-7f1996a5900b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.RTU-internal.54376ec5-78f5-4aef-96d1-7f1996a5900b_Trajectory.txt' using 6:2 w l ls 1 title 'RTU-internal' noenhanced
 
