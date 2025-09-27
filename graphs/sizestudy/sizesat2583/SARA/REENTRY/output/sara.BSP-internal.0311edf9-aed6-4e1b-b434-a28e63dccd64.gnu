 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.BSP-internal.0311edf9-aed6-4e1b-b434-a28e63dccd64_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BSP-internal (0311edf9-aed6-4e1b-b434-a28e63dccd64)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.BSP-internal.0311edf9-aed6-4e1b-b434-a28e63dccd64_Trajectory.txt' using 1:2 w l ls 1 title 'BSP-internal' noenhanced, \
 
set o 'sara.BSP-internal.0311edf9-aed6-4e1b-b434-a28e63dccd64_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BSP-internal (0311edf9-aed6-4e1b-b434-a28e63dccd64)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.BSP-internal.0311edf9-aed6-4e1b-b434-a28e63dccd64_Trajectory.txt' using 6:2 w l ls 1 title 'BSP-internal' noenhanced
 
