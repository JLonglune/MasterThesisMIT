 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SRADipl.1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SRADipl (1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SRADipl.1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037_Trajectory.txt' using 1:2 w l ls 1 title 'SRADipl' noenhanced, \
 
set o 'PySara.SRADipl.1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SRADipl (1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SRADipl.1f2a4ef6-0ab3-4d25-a4be-d8e9c1642037_Trajectory.txt' using 6:2 w l ls 1 title 'SRADipl' noenhanced
 
