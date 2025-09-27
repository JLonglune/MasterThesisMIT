 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.BEG2.744ed77b-395f-4e71-bb4d-25b2479d26c3_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BEG2 (744ed77b-395f-4e71-bb4d-25b2479d26c3)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.BEG2.744ed77b-395f-4e71-bb4d-25b2479d26c3_Trajectory.txt' using 1:2 w l ls 1 title 'BEG2' noenhanced, \
 
set o 'PySara.BEG2.744ed77b-395f-4e71-bb4d-25b2479d26c3_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BEG2 (744ed77b-395f-4e71-bb4d-25b2479d26c3)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.BEG2.744ed77b-395f-4e71-bb4d-25b2479d26c3_Trajectory.txt' using 6:2 w l ls 1 title 'BEG2' noenhanced
 
