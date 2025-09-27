 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SAR-Rx-internal.6e1e7d38-4eaf-4260-a8f5-e56329fb164d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAR-Rx-internal (6e1e7d38-4eaf-4260-a8f5-e56329fb164d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SAR-Rx-internal.6e1e7d38-4eaf-4260-a8f5-e56329fb164d_Trajectory.txt' using 1:2 w l ls 1 title 'SAR-Rx-internal' noenhanced, \
 
set o 'PySara.SAR-Rx-internal.6e1e7d38-4eaf-4260-a8f5-e56329fb164d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAR-Rx-internal (6e1e7d38-4eaf-4260-a8f5-e56329fb164d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SAR-Rx-internal.6e1e7d38-4eaf-4260-a8f5-e56329fb164d_Trajectory.txt' using 6:2 w l ls 1 title 'SAR-Rx-internal' noenhanced
 
