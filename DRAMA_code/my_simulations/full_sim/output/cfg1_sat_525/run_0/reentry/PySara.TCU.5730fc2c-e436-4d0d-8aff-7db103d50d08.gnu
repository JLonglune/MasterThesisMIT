 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.TCU.5730fc2c-e436-4d0d-8aff-7db103d50d08_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TCU (5730fc2c-e436-4d0d-8aff-7db103d50d08)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.TCU.5730fc2c-e436-4d0d-8aff-7db103d50d08_Trajectory.txt' using 1:2 w l ls 1 title 'TCU' noenhanced, \
 
set o 'PySara.TCU.5730fc2c-e436-4d0d-8aff-7db103d50d08_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TCU (5730fc2c-e436-4d0d-8aff-7db103d50d08)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.TCU.5730fc2c-e436-4d0d-8aff-7db103d50d08_Trajectory.txt' using 6:2 w l ls 1 title 'TCU' noenhanced
 
