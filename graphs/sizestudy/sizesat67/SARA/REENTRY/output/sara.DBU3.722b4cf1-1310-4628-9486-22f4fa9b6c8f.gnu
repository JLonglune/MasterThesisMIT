 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.DBU3.722b4cf1-1310-4628-9486-22f4fa9b6c8f_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DBU3 (722b4cf1-1310-4628-9486-22f4fa9b6c8f)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.DBU3.722b4cf1-1310-4628-9486-22f4fa9b6c8f_Trajectory.txt' using 1:2 w l ls 1 title 'DBU3' noenhanced, \
 
set o 'sara.DBU3.722b4cf1-1310-4628-9486-22f4fa9b6c8f_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DBU3 (722b4cf1-1310-4628-9486-22f4fa9b6c8f)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.DBU3.722b4cf1-1310-4628-9486-22f4fa9b6c8f_Trajectory.txt' using 6:2 w l ls 1 title 'DBU3' noenhanced
 
