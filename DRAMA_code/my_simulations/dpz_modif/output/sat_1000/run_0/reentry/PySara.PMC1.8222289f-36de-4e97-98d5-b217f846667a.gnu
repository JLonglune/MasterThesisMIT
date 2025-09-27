 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.PMC1.8222289f-36de-4e97-98d5-b217f846667a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PMC1 (8222289f-36de-4e97-98d5-b217f846667a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.PMC1.8222289f-36de-4e97-98d5-b217f846667a_Trajectory.txt' using 1:2 w l ls 1 title 'PMC1' noenhanced, \
 
set o 'PySara.PMC1.8222289f-36de-4e97-98d5-b217f846667a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PMC1 (8222289f-36de-4e97-98d5-b217f846667a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.PMC1.8222289f-36de-4e97-98d5-b217f846667a_Trajectory.txt' using 6:2 w l ls 1 title 'PMC1' noenhanced
 
