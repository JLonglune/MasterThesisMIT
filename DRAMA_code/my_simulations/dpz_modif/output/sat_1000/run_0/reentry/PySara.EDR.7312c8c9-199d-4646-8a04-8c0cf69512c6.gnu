 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.EDR.7312c8c9-199d-4646-8a04-8c0cf69512c6_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EDR (7312c8c9-199d-4646-8a04-8c0cf69512c6)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.EDR.7312c8c9-199d-4646-8a04-8c0cf69512c6_Trajectory.txt' using 1:2 w l ls 1 title 'EDR' noenhanced, \
 
set o 'PySara.EDR.7312c8c9-199d-4646-8a04-8c0cf69512c6_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EDR (7312c8c9-199d-4646-8a04-8c0cf69512c6)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.EDR.7312c8c9-199d-4646-8a04-8c0cf69512c6_Trajectory.txt' using 6:2 w l ls 1 title 'EDR' noenhanced
 
