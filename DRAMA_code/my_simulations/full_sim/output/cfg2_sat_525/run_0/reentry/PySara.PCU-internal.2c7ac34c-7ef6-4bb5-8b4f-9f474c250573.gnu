 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.PCU-internal.2c7ac34c-7ef6-4bb5-8b4f-9f474c250573_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PCU-internal (2c7ac34c-7ef6-4bb5-8b4f-9f474c250573)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.PCU-internal.2c7ac34c-7ef6-4bb5-8b4f-9f474c250573_Trajectory.txt' using 1:2 w l ls 1 title 'PCU-internal' noenhanced, \
 
set o 'PySara.PCU-internal.2c7ac34c-7ef6-4bb5-8b4f-9f474c250573_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PCU-internal (2c7ac34c-7ef6-4bb5-8b4f-9f474c250573)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.PCU-internal.2c7ac34c-7ef6-4bb5-8b4f-9f474c250573_Trajectory.txt' using 6:2 w l ls 1 title 'PCU-internal' noenhanced
 
