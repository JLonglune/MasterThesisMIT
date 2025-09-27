 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.TRSP1.08f70220-a2ed-4614-8a03-7ee53d774fd8_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TRSP1 (08f70220-a2ed-4614-8a03-7ee53d774fd8)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.TRSP1.08f70220-a2ed-4614-8a03-7ee53d774fd8_Trajectory.txt' using 1:2 w l ls 1 title 'TRSP1' noenhanced, \
 
set o 'sara.TRSP1.08f70220-a2ed-4614-8a03-7ee53d774fd8_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TRSP1 (08f70220-a2ed-4614-8a03-7ee53d774fd8)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.TRSP1.08f70220-a2ed-4614-8a03-7ee53d774fd8_Trajectory.txt' using 6:2 w l ls 1 title 'TRSP1' noenhanced
 
