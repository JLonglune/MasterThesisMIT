 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of parent (8cdd1025-8654-431b-96ab-e0b972a7ddd1)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt' using 1:2 w l ls 1 title 'parent' noenhanced, \
 
set o 'sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of parent (8cdd1025-8654-431b-96ab-e0b972a7ddd1)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt' using 6:2 w l ls 1 title 'parent' noenhanced
 
