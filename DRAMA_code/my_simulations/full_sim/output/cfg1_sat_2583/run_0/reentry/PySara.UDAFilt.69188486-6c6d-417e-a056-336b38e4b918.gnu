 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.UDAFilt.69188486-6c6d-417e-a056-336b38e4b918_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of UDAFilt (69188486-6c6d-417e-a056-336b38e4b918)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.UDAFilt.69188486-6c6d-417e-a056-336b38e4b918_Trajectory.txt' using 1:2 w l ls 1 title 'UDAFilt' noenhanced, \
 
set o 'PySara.UDAFilt.69188486-6c6d-417e-a056-336b38e4b918_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of UDAFilt (69188486-6c6d-417e-a056-336b38e4b918)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.UDAFilt.69188486-6c6d-417e-a056-336b38e4b918_Trajectory.txt' using 6:2 w l ls 1 title 'UDAFilt' noenhanced
 
