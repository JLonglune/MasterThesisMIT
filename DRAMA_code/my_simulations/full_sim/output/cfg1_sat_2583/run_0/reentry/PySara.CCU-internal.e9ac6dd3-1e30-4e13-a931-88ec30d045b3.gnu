 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.CCU-internal.e9ac6dd3-1e30-4e13-a931-88ec30d045b3_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of CCU-internal (e9ac6dd3-1e30-4e13-a931-88ec30d045b3)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.CCU-internal.e9ac6dd3-1e30-4e13-a931-88ec30d045b3_Trajectory.txt' using 1:2 w l ls 1 title 'CCU-internal' noenhanced, \
 
set o 'PySara.CCU-internal.e9ac6dd3-1e30-4e13-a931-88ec30d045b3_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of CCU-internal (e9ac6dd3-1e30-4e13-a931-88ec30d045b3)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.CCU-internal.e9ac6dd3-1e30-4e13-a931-88ec30d045b3_Trajectory.txt' using 6:2 w l ls 1 title 'CCU-internal' noenhanced
 
