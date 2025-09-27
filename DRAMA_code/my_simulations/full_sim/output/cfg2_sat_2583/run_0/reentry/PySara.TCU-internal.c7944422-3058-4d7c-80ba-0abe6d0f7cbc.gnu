 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.TCU-internal.c7944422-3058-4d7c-80ba-0abe6d0f7cbc_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TCU-internal (c7944422-3058-4d7c-80ba-0abe6d0f7cbc)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.TCU-internal.c7944422-3058-4d7c-80ba-0abe6d0f7cbc_Trajectory.txt' using 1:2 w l ls 1 title 'TCU-internal' noenhanced, \
 
set o 'PySara.TCU-internal.c7944422-3058-4d7c-80ba-0abe6d0f7cbc_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TCU-internal (c7944422-3058-4d7c-80ba-0abe6d0f7cbc)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.TCU-internal.c7944422-3058-4d7c-80ba-0abe6d0f7cbc_Trajectory.txt' using 6:2 w l ls 1 title 'TCU-internal' noenhanced
 
