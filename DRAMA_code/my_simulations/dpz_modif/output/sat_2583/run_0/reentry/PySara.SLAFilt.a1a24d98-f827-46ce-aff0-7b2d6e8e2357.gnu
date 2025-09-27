 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SLAFilt.a1a24d98-f827-46ce-aff0-7b2d6e8e2357_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SLAFilt (a1a24d98-f827-46ce-aff0-7b2d6e8e2357)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SLAFilt.a1a24d98-f827-46ce-aff0-7b2d6e8e2357_Trajectory.txt' using 1:2 w l ls 1 title 'SLAFilt' noenhanced, \
 
set o 'PySara.SLAFilt.a1a24d98-f827-46ce-aff0-7b2d6e8e2357_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SLAFilt (a1a24d98-f827-46ce-aff0-7b2d6e8e2357)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SLAFilt.a1a24d98-f827-46ce-aff0-7b2d6e8e2357_Trajectory.txt' using 6:2 w l ls 1 title 'SLAFilt' noenhanced
 
