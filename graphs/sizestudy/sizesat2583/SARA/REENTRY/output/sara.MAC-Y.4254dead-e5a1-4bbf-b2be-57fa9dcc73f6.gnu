 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.MAC-Y.4254dead-e5a1-4bbf-b2be-57fa9dcc73f6_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MAC-Y (4254dead-e5a1-4bbf-b2be-57fa9dcc73f6)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.MAC-Y.4254dead-e5a1-4bbf-b2be-57fa9dcc73f6_Trajectory.txt' using 1:2 w l ls 1 title 'MAC-Y' noenhanced, \
 
set o 'sara.MAC-Y.4254dead-e5a1-4bbf-b2be-57fa9dcc73f6_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MAC-Y (4254dead-e5a1-4bbf-b2be-57fa9dcc73f6)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.MAC-Y.4254dead-e5a1-4bbf-b2be-57fa9dcc73f6_Trajectory.txt' using 6:2 w l ls 1 title 'MAC-Y' noenhanced
 
