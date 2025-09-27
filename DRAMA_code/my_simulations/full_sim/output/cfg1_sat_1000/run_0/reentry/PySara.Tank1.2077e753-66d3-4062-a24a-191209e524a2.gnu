 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Tank1.2077e753-66d3-4062-a24a-191209e524a2_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Tank1 (2077e753-66d3-4062-a24a-191209e524a2)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Tank1.2077e753-66d3-4062-a24a-191209e524a2_Trajectory.txt' using 1:2 w l ls 1 title 'Tank1' noenhanced, \
 
set o 'PySara.Tank1.2077e753-66d3-4062-a24a-191209e524a2_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Tank1 (2077e753-66d3-4062-a24a-191209e524a2)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Tank1.2077e753-66d3-4062-a24a-191209e524a2_Trajectory.txt' using 6:2 w l ls 1 title 'Tank1' noenhanced
 
