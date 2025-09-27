 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of case4_solid (7f7f274b-035d-4fd6-b84f-925bb3aa22a8)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt' using 1:2 w l ls 1 title 'case4_solid' noenhanced, \
 
set o 'sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of case4_solid (7f7f274b-035d-4fd6-b84f-925bb3aa22a8)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt' using 6:2 w l ls 1 title 'case4_solid' noenhanced
 
