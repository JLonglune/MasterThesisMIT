 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Battery4.47883bf6-dd97-4ab2-bcb1-a794ee346539_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery4 (47883bf6-dd97-4ab2-bcb1-a794ee346539)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Battery4.47883bf6-dd97-4ab2-bcb1-a794ee346539_Trajectory.txt' using 1:2 w l ls 1 title 'Battery4' noenhanced, \
 
set o 'PySara.Battery4.47883bf6-dd97-4ab2-bcb1-a794ee346539_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery4 (47883bf6-dd97-4ab2-bcb1-a794ee346539)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Battery4.47883bf6-dd97-4ab2-bcb1-a794ee346539_Trajectory.txt' using 6:2 w l ls 1 title 'Battery4' noenhanced
 
