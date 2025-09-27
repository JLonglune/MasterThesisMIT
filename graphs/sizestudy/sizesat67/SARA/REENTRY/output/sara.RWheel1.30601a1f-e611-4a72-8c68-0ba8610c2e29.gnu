 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RWheel1.30601a1f-e611-4a72-8c68-0ba8610c2e29_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RWheel1 (30601a1f-e611-4a72-8c68-0ba8610c2e29)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RWheel1.30601a1f-e611-4a72-8c68-0ba8610c2e29_Trajectory.txt' using 1:2 w l ls 1 title 'RWheel1' noenhanced, \
 
set o 'sara.RWheel1.30601a1f-e611-4a72-8c68-0ba8610c2e29_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RWheel1 (30601a1f-e611-4a72-8c68-0ba8610c2e29)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RWheel1.30601a1f-e611-4a72-8c68-0ba8610c2e29_Trajectory.txt' using 6:2 w l ls 1 title 'RWheel1' noenhanced
 
