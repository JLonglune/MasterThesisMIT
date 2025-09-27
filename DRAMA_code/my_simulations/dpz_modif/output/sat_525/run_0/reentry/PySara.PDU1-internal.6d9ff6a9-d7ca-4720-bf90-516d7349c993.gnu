 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.PDU1-internal.6d9ff6a9-d7ca-4720-bf90-516d7349c993_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PDU1-internal (6d9ff6a9-d7ca-4720-bf90-516d7349c993)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.PDU1-internal.6d9ff6a9-d7ca-4720-bf90-516d7349c993_Trajectory.txt' using 1:2 w l ls 1 title 'PDU1-internal' noenhanced, \
 
set o 'PySara.PDU1-internal.6d9ff6a9-d7ca-4720-bf90-516d7349c993_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PDU1-internal (6d9ff6a9-d7ca-4720-bf90-516d7349c993)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.PDU1-internal.6d9ff6a9-d7ca-4720-bf90-516d7349c993_Trajectory.txt' using 6:2 w l ls 1 title 'PDU1-internal' noenhanced
 
