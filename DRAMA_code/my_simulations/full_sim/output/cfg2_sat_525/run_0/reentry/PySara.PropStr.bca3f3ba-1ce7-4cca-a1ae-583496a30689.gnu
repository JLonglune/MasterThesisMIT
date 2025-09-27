 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.PropStr.bca3f3ba-1ce7-4cca-a1ae-583496a30689_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PropStr (bca3f3ba-1ce7-4cca-a1ae-583496a30689)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.PropStr.bca3f3ba-1ce7-4cca-a1ae-583496a30689_Trajectory.txt' using 1:2 w l ls 1 title 'PropStr' noenhanced, \
 
set o 'PySara.PropStr.bca3f3ba-1ce7-4cca-a1ae-583496a30689_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PropStr (bca3f3ba-1ce7-4cca-a1ae-583496a30689)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.PropStr.bca3f3ba-1ce7-4cca-a1ae-583496a30689_Trajectory.txt' using 6:2 w l ls 1 title 'PropStr' noenhanced
 
