 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.Battery5.94bd48c4-b524-41c6-b291-026fc5402459_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery5 (94bd48c4-b524-41c6-b291-026fc5402459)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.Battery5.94bd48c4-b524-41c6-b291-026fc5402459_Trajectory.txt' using 1:2 w l ls 1 title 'Battery5' noenhanced, \
 
set o 'sara.Battery5.94bd48c4-b524-41c6-b291-026fc5402459_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery5 (94bd48c4-b524-41c6-b291-026fc5402459)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.Battery5.94bd48c4-b524-41c6-b291-026fc5402459_Trajectory.txt' using 6:2 w l ls 1 title 'Battery5' noenhanced
 
