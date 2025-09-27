 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATRFU2.47f10662-ff1d-49f1-a914-6c3ea10deb35_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATRFU2 (47f10662-ff1d-49f1-a914-6c3ea10deb35)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATRFU2.47f10662-ff1d-49f1-a914-6c3ea10deb35_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATRFU2' noenhanced, \
 
set o 'PySara.ASCATRFU2.47f10662-ff1d-49f1-a914-6c3ea10deb35_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATRFU2 (47f10662-ff1d-49f1-a914-6c3ea10deb35)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATRFU2.47f10662-ff1d-49f1-a914-6c3ea10deb35_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATRFU2' noenhanced
 
