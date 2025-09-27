 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.LNA1.9df1f91d-0492-4871-8bb7-f884e4fef4a3_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of LNA1 (9df1f91d-0492-4871-8bb7-f884e4fef4a3)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.LNA1.9df1f91d-0492-4871-8bb7-f884e4fef4a3_Trajectory.txt' using 1:2 w l ls 1 title 'LNA1' noenhanced, \
 
set o 'PySara.LNA1.9df1f91d-0492-4871-8bb7-f884e4fef4a3_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of LNA1 (9df1f91d-0492-4871-8bb7-f884e4fef4a3)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.LNA1.9df1f91d-0492-4871-8bb7-f884e4fef4a3_Trajectory.txt' using 6:2 w l ls 1 title 'LNA1' noenhanced
 
