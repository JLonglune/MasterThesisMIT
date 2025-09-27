 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATDPU1-internal.12c176cb-6d99-4ed9-b863-4489f06050e1_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATDPU1-internal (12c176cb-6d99-4ed9-b863-4489f06050e1)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATDPU1-internal.12c176cb-6d99-4ed9-b863-4489f06050e1_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATDPU1-internal' noenhanced, \
 
set o 'sara.ASCATDPU1-internal.12c176cb-6d99-4ed9-b863-4489f06050e1_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATDPU1-internal (12c176cb-6d99-4ed9-b863-4489f06050e1)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATDPU1-internal.12c176cb-6d99-4ed9-b863-4489f06050e1_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATDPU1-internal' noenhanced
 
