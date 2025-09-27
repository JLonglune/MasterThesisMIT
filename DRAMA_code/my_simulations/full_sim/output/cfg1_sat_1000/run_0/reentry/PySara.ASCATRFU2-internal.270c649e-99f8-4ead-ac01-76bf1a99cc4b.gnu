 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATRFU2-internal.270c649e-99f8-4ead-ac01-76bf1a99cc4b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATRFU2-internal (270c649e-99f8-4ead-ac01-76bf1a99cc4b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATRFU2-internal.270c649e-99f8-4ead-ac01-76bf1a99cc4b_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATRFU2-internal' noenhanced, \
 
set o 'PySara.ASCATRFU2-internal.270c649e-99f8-4ead-ac01-76bf1a99cc4b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATRFU2-internal (270c649e-99f8-4ead-ac01-76bf1a99cc4b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATRFU2-internal.270c649e-99f8-4ead-ac01-76bf1a99cc4b_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATRFU2-internal' noenhanced
 
