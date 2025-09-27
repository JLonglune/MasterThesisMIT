 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.STD2.9e878564-4208-4e86-ad05-fc711c4160c8_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of STD2 (9e878564-4208-4e86-ad05-fc711c4160c8)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.STD2.9e878564-4208-4e86-ad05-fc711c4160c8_Trajectory.txt' using 1:2 w l ls 1 title 'STD2' noenhanced, \
 
set o 'PySara.STD2.9e878564-4208-4e86-ad05-fc711c4160c8_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of STD2 (9e878564-4208-4e86-ad05-fc711c4160c8)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.STD2.9e878564-4208-4e86-ad05-fc711c4160c8_Trajectory.txt' using 6:2 w l ls 1 title 'STD2' noenhanced
 
