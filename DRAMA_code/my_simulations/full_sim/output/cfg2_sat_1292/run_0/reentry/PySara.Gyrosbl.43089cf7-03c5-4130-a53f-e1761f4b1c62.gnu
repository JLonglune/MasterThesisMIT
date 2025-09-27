 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Gyrosbl.43089cf7-03c5-4130-a53f-e1761f4b1c62_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Gyrosbl (43089cf7-03c5-4130-a53f-e1761f4b1c62)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Gyrosbl.43089cf7-03c5-4130-a53f-e1761f4b1c62_Trajectory.txt' using 1:2 w l ls 1 title 'Gyrosbl' noenhanced, \
 
set o 'PySara.Gyrosbl.43089cf7-03c5-4130-a53f-e1761f4b1c62_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Gyrosbl (43089cf7-03c5-4130-a53f-e1761f4b1c62)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Gyrosbl.43089cf7-03c5-4130-a53f-e1761f4b1c62_Trajectory.txt' using 6:2 w l ls 1 title 'Gyrosbl' noenhanced
 
