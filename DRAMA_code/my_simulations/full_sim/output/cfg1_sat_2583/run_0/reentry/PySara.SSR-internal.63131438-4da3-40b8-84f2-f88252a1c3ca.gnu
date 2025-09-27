 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SSR-internal.63131438-4da3-40b8-84f2-f88252a1c3ca_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SSR-internal (63131438-4da3-40b8-84f2-f88252a1c3ca)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SSR-internal.63131438-4da3-40b8-84f2-f88252a1c3ca_Trajectory.txt' using 1:2 w l ls 1 title 'SSR-internal' noenhanced, \
 
set o 'PySara.SSR-internal.63131438-4da3-40b8-84f2-f88252a1c3ca_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SSR-internal (63131438-4da3-40b8-84f2-f88252a1c3ca)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SSR-internal.63131438-4da3-40b8-84f2-f88252a1c3ca_Trajectory.txt' using 6:2 w l ls 1 title 'SSR-internal' noenhanced
 
