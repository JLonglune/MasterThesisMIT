 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ADCS-RPU-internal.4b346112-6fa3-4fb4-9c45-23962cc2bdaf_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ADCS-RPU-internal (4b346112-6fa3-4fb4-9c45-23962cc2bdaf)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ADCS-RPU-internal.4b346112-6fa3-4fb4-9c45-23962cc2bdaf_Trajectory.txt' using 1:2 w l ls 1 title 'ADCS-RPU-internal' noenhanced, \
 
set o 'PySara.ADCS-RPU-internal.4b346112-6fa3-4fb4-9c45-23962cc2bdaf_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ADCS-RPU-internal (4b346112-6fa3-4fb4-9c45-23962cc2bdaf)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ADCS-RPU-internal.4b346112-6fa3-4fb4-9c45-23962cc2bdaf_Trajectory.txt' using 6:2 w l ls 1 title 'ADCS-RPU-internal' noenhanced
 
