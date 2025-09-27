 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Ribpanel2.8dd18595-7d63-4c7b-be1d-893cb08a289d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Ribpanel2 (8dd18595-7d63-4c7b-be1d-893cb08a289d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Ribpanel2.8dd18595-7d63-4c7b-be1d-893cb08a289d_Trajectory.txt' using 1:2 w l ls 1 title 'Ribpanel2' noenhanced, \
 
set o 'PySara.Ribpanel2.8dd18595-7d63-4c7b-be1d-893cb08a289d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Ribpanel2 (8dd18595-7d63-4c7b-be1d-893cb08a289d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Ribpanel2.8dd18595-7d63-4c7b-be1d-893cb08a289d_Trajectory.txt' using 6:2 w l ls 1 title 'Ribpanel2' noenhanced
 
