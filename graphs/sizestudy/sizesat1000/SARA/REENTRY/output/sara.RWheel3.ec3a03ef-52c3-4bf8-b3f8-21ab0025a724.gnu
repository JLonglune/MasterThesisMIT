 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RWheel3.ec3a03ef-52c3-4bf8-b3f8-21ab0025a724_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RWheel3 (ec3a03ef-52c3-4bf8-b3f8-21ab0025a724)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RWheel3.ec3a03ef-52c3-4bf8-b3f8-21ab0025a724_Trajectory.txt' using 1:2 w l ls 1 title 'RWheel3' noenhanced, \
 
set o 'sara.RWheel3.ec3a03ef-52c3-4bf8-b3f8-21ab0025a724_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RWheel3 (ec3a03ef-52c3-4bf8-b3f8-21ab0025a724)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RWheel3.ec3a03ef-52c3-4bf8-b3f8-21ab0025a724_Trajectory.txt' using 6:2 w l ls 1 title 'RWheel3' noenhanced
 
