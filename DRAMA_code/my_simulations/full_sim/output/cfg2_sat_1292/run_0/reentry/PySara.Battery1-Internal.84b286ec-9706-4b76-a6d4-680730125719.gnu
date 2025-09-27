 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Battery1-Internal.84b286ec-9706-4b76-a6d4-680730125719_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery1-Internal (84b286ec-9706-4b76-a6d4-680730125719)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Battery1-Internal.84b286ec-9706-4b76-a6d4-680730125719_Trajectory.txt' using 1:2 w l ls 1 title 'Battery1-Internal' noenhanced, \
 
set o 'PySara.Battery1-Internal.84b286ec-9706-4b76-a6d4-680730125719_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery1-Internal (84b286ec-9706-4b76-a6d4-680730125719)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Battery1-Internal.84b286ec-9706-4b76-a6d4-680730125719_Trajectory.txt' using 6:2 w l ls 1 title 'Battery1-Internal' noenhanced
 
