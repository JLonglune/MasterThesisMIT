 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.PDU2-internal.a4a3761c-bce1-43f7-adef-540c95a96cac_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PDU2-internal (a4a3761c-bce1-43f7-adef-540c95a96cac)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.PDU2-internal.a4a3761c-bce1-43f7-adef-540c95a96cac_Trajectory.txt' using 1:2 w l ls 1 title 'PDU2-internal' noenhanced, \
 
set o 'sara.PDU2-internal.a4a3761c-bce1-43f7-adef-540c95a96cac_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PDU2-internal (a4a3761c-bce1-43f7-adef-540c95a96cac)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.PDU2-internal.a4a3761c-bce1-43f7-adef-540c95a96cac_Trajectory.txt' using 6:2 w l ls 1 title 'PDU2-internal' noenhanced
 
