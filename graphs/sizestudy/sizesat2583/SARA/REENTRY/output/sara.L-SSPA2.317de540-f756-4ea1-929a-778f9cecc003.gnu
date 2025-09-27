 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.L-SSPA2.317de540-f756-4ea1-929a-778f9cecc003_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of L-SSPA2 (317de540-f756-4ea1-929a-778f9cecc003)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.L-SSPA2.317de540-f756-4ea1-929a-778f9cecc003_Trajectory.txt' using 1:2 w l ls 1 title 'L-SSPA2' noenhanced, \
 
set o 'sara.L-SSPA2.317de540-f756-4ea1-929a-778f9cecc003_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of L-SSPA2 (317de540-f756-4ea1-929a-778f9cecc003)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.L-SSPA2.317de540-f756-4ea1-929a-778f9cecc003_Trajectory.txt' using 6:2 w l ls 1 title 'L-SSPA2' noenhanced
 
