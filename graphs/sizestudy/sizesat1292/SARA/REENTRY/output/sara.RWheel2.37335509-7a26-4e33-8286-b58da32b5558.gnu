 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RWheel2.37335509-7a26-4e33-8286-b58da32b5558_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RWheel2 (37335509-7a26-4e33-8286-b58da32b5558)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RWheel2.37335509-7a26-4e33-8286-b58da32b5558_Trajectory.txt' using 1:2 w l ls 1 title 'RWheel2' noenhanced, \
 
set o 'sara.RWheel2.37335509-7a26-4e33-8286-b58da32b5558_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RWheel2 (37335509-7a26-4e33-8286-b58da32b5558)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RWheel2.37335509-7a26-4e33-8286-b58da32b5558_Trajectory.txt' using 6:2 w l ls 1 title 'RWheel2' noenhanced
 
