 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ValvTran4.e09ab47f-053d-4141-9264-f8406883a641_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran4 (e09ab47f-053d-4141-9264-f8406883a641)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ValvTran4.e09ab47f-053d-4141-9264-f8406883a641_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran4' noenhanced, \
 
set o 'PySara.ValvTran4.e09ab47f-053d-4141-9264-f8406883a641_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran4 (e09ab47f-053d-4141-9264-f8406883a641)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ValvTran4.e09ab47f-053d-4141-9264-f8406883a641_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran4' noenhanced
 
