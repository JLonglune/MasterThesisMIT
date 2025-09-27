 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Tank3.fa9558ee-ae76-48d8-82e6-cde76fd02986_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Tank3 (fa9558ee-ae76-48d8-82e6-cde76fd02986)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Tank3.fa9558ee-ae76-48d8-82e6-cde76fd02986_Trajectory.txt' using 1:2 w l ls 1 title 'Tank3' noenhanced, \
 
set o 'PySara.Tank3.fa9558ee-ae76-48d8-82e6-cde76fd02986_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Tank3 (fa9558ee-ae76-48d8-82e6-cde76fd02986)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Tank3.fa9558ee-ae76-48d8-82e6-cde76fd02986_Trajectory.txt' using 6:2 w l ls 1 title 'Tank3' noenhanced
 
