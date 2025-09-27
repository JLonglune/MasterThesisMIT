 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.T4S-internal.355d25f9-3965-425f-9261-2577f7f8cb4c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of T4S-internal (355d25f9-3965-425f-9261-2577f7f8cb4c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.T4S-internal.355d25f9-3965-425f-9261-2577f7f8cb4c_Trajectory.txt' using 1:2 w l ls 1 title 'T4S-internal' noenhanced, \
 
set o 'PySara.T4S-internal.355d25f9-3965-425f-9261-2577f7f8cb4c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of T4S-internal (355d25f9-3965-425f-9261-2577f7f8cb4c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.T4S-internal.355d25f9-3965-425f-9261-2577f7f8cb4c_Trajectory.txt' using 6:2 w l ls 1 title 'T4S-internal' noenhanced
 
