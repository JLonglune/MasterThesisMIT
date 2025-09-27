 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Battery3.d62ffb09-5716-42d4-9382-65e4c7f6ab3a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery3 (d62ffb09-5716-42d4-9382-65e4c7f6ab3a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Battery3.d62ffb09-5716-42d4-9382-65e4c7f6ab3a_Trajectory.txt' using 1:2 w l ls 1 title 'Battery3' noenhanced, \
 
set o 'PySara.Battery3.d62ffb09-5716-42d4-9382-65e4c7f6ab3a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery3 (d62ffb09-5716-42d4-9382-65e4c7f6ab3a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Battery3.d62ffb09-5716-42d4-9382-65e4c7f6ab3a_Trajectory.txt' using 6:2 w l ls 1 title 'Battery3' noenhanced
 
