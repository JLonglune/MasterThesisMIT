 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.IASI-DPS.793e2de2-3c73-4ec5-9159-6715937b7cbe_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of IASI-DPS (793e2de2-3c73-4ec5-9159-6715937b7cbe)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.IASI-DPS.793e2de2-3c73-4ec5-9159-6715937b7cbe_Trajectory.txt' using 1:2 w l ls 1 title 'IASI-DPS' noenhanced, \
 
set o 'sara.IASI-DPS.793e2de2-3c73-4ec5-9159-6715937b7cbe_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of IASI-DPS (793e2de2-3c73-4ec5-9159-6715937b7cbe)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.IASI-DPS.793e2de2-3c73-4ec5-9159-6715937b7cbe_Trajectory.txt' using 6:2 w l ls 1 title 'IASI-DPS' noenhanced
 
