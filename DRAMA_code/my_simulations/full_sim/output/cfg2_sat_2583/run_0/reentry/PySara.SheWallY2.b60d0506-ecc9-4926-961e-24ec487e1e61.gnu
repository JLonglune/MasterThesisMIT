 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SheWallY2.b60d0506-ecc9-4926-961e-24ec487e1e61_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SheWallY2 (b60d0506-ecc9-4926-961e-24ec487e1e61)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SheWallY2.b60d0506-ecc9-4926-961e-24ec487e1e61_Trajectory.txt' using 1:2 w l ls 1 title 'SheWallY2' noenhanced, \
 
set o 'PySara.SheWallY2.b60d0506-ecc9-4926-961e-24ec487e1e61_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SheWallY2 (b60d0506-ecc9-4926-961e-24ec487e1e61)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SheWallY2.b60d0506-ecc9-4926-961e-24ec487e1e61_Trajectory.txt' using 6:2 w l ls 1 title 'SheWallY2' noenhanced
 
