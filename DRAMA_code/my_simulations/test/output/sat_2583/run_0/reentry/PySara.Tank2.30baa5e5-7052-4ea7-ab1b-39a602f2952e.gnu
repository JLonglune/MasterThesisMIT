 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Tank2.30baa5e5-7052-4ea7-ab1b-39a602f2952e_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Tank2 (30baa5e5-7052-4ea7-ab1b-39a602f2952e)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Tank2.30baa5e5-7052-4ea7-ab1b-39a602f2952e_Trajectory.txt' using 1:2 w l ls 1 title 'Tank2' noenhanced, \
 
set o 'PySara.Tank2.30baa5e5-7052-4ea7-ab1b-39a602f2952e_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Tank2 (30baa5e5-7052-4ea7-ab1b-39a602f2952e)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Tank2.30baa5e5-7052-4ea7-ab1b-39a602f2952e_Trajectory.txt' using 6:2 w l ls 1 title 'Tank2' noenhanced
 
