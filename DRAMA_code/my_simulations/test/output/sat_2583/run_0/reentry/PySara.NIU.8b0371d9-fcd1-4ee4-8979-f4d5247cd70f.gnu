 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.NIU.8b0371d9-fcd1-4ee4-8979-f4d5247cd70f_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of NIU (8b0371d9-fcd1-4ee4-8979-f4d5247cd70f)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.NIU.8b0371d9-fcd1-4ee4-8979-f4d5247cd70f_Trajectory.txt' using 1:2 w l ls 1 title 'NIU' noenhanced, \
 
set o 'PySara.NIU.8b0371d9-fcd1-4ee4-8979-f4d5247cd70f_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of NIU (8b0371d9-fcd1-4ee4-8979-f4d5247cd70f)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.NIU.8b0371d9-fcd1-4ee4-8979-f4d5247cd70f_Trajectory.txt' using 6:2 w l ls 1 title 'NIU' noenhanced
 
