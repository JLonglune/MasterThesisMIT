 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SheWallY3.49d1d881-cbd7-417c-982e-beb945e16ed9_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SheWallY3 (49d1d881-cbd7-417c-982e-beb945e16ed9)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SheWallY3.49d1d881-cbd7-417c-982e-beb945e16ed9_Trajectory.txt' using 1:2 w l ls 1 title 'SheWallY3' noenhanced, \
 
set o 'sara.SheWallY3.49d1d881-cbd7-417c-982e-beb945e16ed9_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SheWallY3 (49d1d881-cbd7-417c-982e-beb945e16ed9)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SheWallY3.49d1d881-cbd7-417c-982e-beb945e16ed9_Trajectory.txt' using 6:2 w l ls 1 title 'SheWallY3' noenhanced
 
