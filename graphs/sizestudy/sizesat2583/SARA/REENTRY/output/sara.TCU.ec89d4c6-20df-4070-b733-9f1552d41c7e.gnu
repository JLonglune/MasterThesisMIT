 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.TCU.ec89d4c6-20df-4070-b733-9f1552d41c7e_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TCU (ec89d4c6-20df-4070-b733-9f1552d41c7e)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.TCU.ec89d4c6-20df-4070-b733-9f1552d41c7e_Trajectory.txt' using 1:2 w l ls 1 title 'TCU' noenhanced, \
 
set o 'sara.TCU.ec89d4c6-20df-4070-b733-9f1552d41c7e_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TCU (ec89d4c6-20df-4070-b733-9f1552d41c7e)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.TCU.ec89d4c6-20df-4070-b733-9f1552d41c7e_Trajectory.txt' using 6:2 w l ls 1 title 'TCU' noenhanced
 
