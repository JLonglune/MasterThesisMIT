 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.PCU-internal.25d4c5dd-be9f-44b8-9620-4258c3b44b3f_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PCU-internal (25d4c5dd-be9f-44b8-9620-4258c3b44b3f)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.PCU-internal.25d4c5dd-be9f-44b8-9620-4258c3b44b3f_Trajectory.txt' using 1:2 w l ls 1 title 'PCU-internal' noenhanced, \
 
set o 'sara.PCU-internal.25d4c5dd-be9f-44b8-9620-4258c3b44b3f_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PCU-internal (25d4c5dd-be9f-44b8-9620-4258c3b44b3f)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.PCU-internal.25d4c5dd-be9f-44b8-9620-4258c3b44b3f_Trajectory.txt' using 6:2 w l ls 1 title 'PCU-internal' noenhanced
 
