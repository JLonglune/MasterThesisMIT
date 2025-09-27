 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATEPC1-internal.2622fa08-adbb-4190-a652-7df2c8d0e121_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATEPC1-internal (2622fa08-adbb-4190-a652-7df2c8d0e121)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATEPC1-internal.2622fa08-adbb-4190-a652-7df2c8d0e121_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATEPC1-internal' noenhanced, \
 
set o 'PySara.ASCATEPC1-internal.2622fa08-adbb-4190-a652-7df2c8d0e121_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATEPC1-internal (2622fa08-adbb-4190-a652-7df2c8d0e121)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATEPC1-internal.2622fa08-adbb-4190-a652-7df2c8d0e121_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATEPC1-internal' noenhanced
 
