 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.EPC1.56e696f8-ec3c-413e-af35-7ceec8bc2365_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EPC1 (56e696f8-ec3c-413e-af35-7ceec8bc2365)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.EPC1.56e696f8-ec3c-413e-af35-7ceec8bc2365_Trajectory.txt' using 1:2 w l ls 1 title 'EPC1' noenhanced, \
 
set o 'PySara.EPC1.56e696f8-ec3c-413e-af35-7ceec8bc2365_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EPC1 (56e696f8-ec3c-413e-af35-7ceec8bc2365)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.EPC1.56e696f8-ec3c-413e-af35-7ceec8bc2365_Trajectory.txt' using 6:2 w l ls 1 title 'EPC1' noenhanced
 
