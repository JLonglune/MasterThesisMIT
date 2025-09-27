 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EDR-internal.e95fb00d-0612-45b8-8e8e-80e421fe680b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EDR-internal (e95fb00d-0612-45b8-8e8e-80e421fe680b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EDR-internal.e95fb00d-0612-45b8-8e8e-80e421fe680b_Trajectory.txt' using 1:2 w l ls 1 title 'EDR-internal' noenhanced, \
 
set o 'sara.EDR-internal.e95fb00d-0612-45b8-8e8e-80e421fe680b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EDR-internal (e95fb00d-0612-45b8-8e8e-80e421fe680b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EDR-internal.e95fb00d-0612-45b8-8e8e-80e421fe680b_Trajectory.txt' using 6:2 w l ls 1 title 'EDR-internal' noenhanced
 
