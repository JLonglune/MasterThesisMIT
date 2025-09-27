 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.DBU2.afbd0b58-1f59-4fce-b54e-124fe1757b32_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DBU2 (afbd0b58-1f59-4fce-b54e-124fe1757b32)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.DBU2.afbd0b58-1f59-4fce-b54e-124fe1757b32_Trajectory.txt' using 1:2 w l ls 1 title 'DBU2' noenhanced, \
 
set o 'PySara.DBU2.afbd0b58-1f59-4fce-b54e-124fe1757b32_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DBU2 (afbd0b58-1f59-4fce-b54e-124fe1757b32)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.DBU2.afbd0b58-1f59-4fce-b54e-124fe1757b32_Trajectory.txt' using 6:2 w l ls 1 title 'DBU2' noenhanced
 
