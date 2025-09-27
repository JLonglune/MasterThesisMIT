 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.Battery4-Internal.401bb612-2bc0-44d9-96ce-e323c7e90de9_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery4-Internal (401bb612-2bc0-44d9-96ce-e323c7e90de9)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.Battery4-Internal.401bb612-2bc0-44d9-96ce-e323c7e90de9_Trajectory.txt' using 1:2 w l ls 1 title 'Battery4-Internal' noenhanced, \
 
set o 'sara.Battery4-Internal.401bb612-2bc0-44d9-96ce-e323c7e90de9_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery4-Internal (401bb612-2bc0-44d9-96ce-e323c7e90de9)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.Battery4-Internal.401bb612-2bc0-44d9-96ce-e323c7e90de9_Trajectory.txt' using 6:2 w l ls 1 title 'Battery4-Internal' noenhanced
 
