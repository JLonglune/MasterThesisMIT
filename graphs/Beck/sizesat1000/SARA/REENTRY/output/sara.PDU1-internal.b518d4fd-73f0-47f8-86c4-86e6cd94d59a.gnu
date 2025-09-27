 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.PDU1-internal.b518d4fd-73f0-47f8-86c4-86e6cd94d59a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PDU1-internal (b518d4fd-73f0-47f8-86c4-86e6cd94d59a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.PDU1-internal.b518d4fd-73f0-47f8-86c4-86e6cd94d59a_Trajectory.txt' using 1:2 w l ls 1 title 'PDU1-internal' noenhanced, \
 
set o 'sara.PDU1-internal.b518d4fd-73f0-47f8-86c4-86e6cd94d59a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PDU1-internal (b518d4fd-73f0-47f8-86c4-86e6cd94d59a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.PDU1-internal.b518d4fd-73f0-47f8-86c4-86e6cd94d59a_Trajectory.txt' using 6:2 w l ls 1 title 'PDU1-internal' noenhanced
 
