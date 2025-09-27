 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ValvTran3.9e2e3edd-c6ff-4395-b236-f1397d754673_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran3 (9e2e3edd-c6ff-4395-b236-f1397d754673)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ValvTran3.9e2e3edd-c6ff-4395-b236-f1397d754673_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran3' noenhanced, \
 
set o 'PySara.ValvTran3.9e2e3edd-c6ff-4395-b236-f1397d754673_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran3 (9e2e3edd-c6ff-4395-b236-f1397d754673)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ValvTran3.9e2e3edd-c6ff-4395-b236-f1397d754673_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran3' noenhanced
 
