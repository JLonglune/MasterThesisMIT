 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATHRS.a8ecbe50-d69a-455f-884a-eae3ec9627e4_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATHRS (a8ecbe50-d69a-455f-884a-eae3ec9627e4)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATHRS.a8ecbe50-d69a-455f-884a-eae3ec9627e4_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATHRS' noenhanced, \
 
set o 'PySara.ASCATHRS.a8ecbe50-d69a-455f-884a-eae3ec9627e4_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATHRS (a8ecbe50-d69a-455f-884a-eae3ec9627e4)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATHRS.a8ecbe50-d69a-455f-884a-eae3ec9627e4_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATHRS' noenhanced
 
