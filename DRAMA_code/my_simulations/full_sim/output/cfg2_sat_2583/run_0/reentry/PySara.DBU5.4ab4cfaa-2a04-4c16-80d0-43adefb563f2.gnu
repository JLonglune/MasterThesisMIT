 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.DBU5.4ab4cfaa-2a04-4c16-80d0-43adefb563f2_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DBU5 (4ab4cfaa-2a04-4c16-80d0-43adefb563f2)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.DBU5.4ab4cfaa-2a04-4c16-80d0-43adefb563f2_Trajectory.txt' using 1:2 w l ls 1 title 'DBU5' noenhanced, \
 
set o 'PySara.DBU5.4ab4cfaa-2a04-4c16-80d0-43adefb563f2_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DBU5 (4ab4cfaa-2a04-4c16-80d0-43adefb563f2)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.DBU5.4ab4cfaa-2a04-4c16-80d0-43adefb563f2_Trajectory.txt' using 6:2 w l ls 1 title 'DBU5' noenhanced
 
