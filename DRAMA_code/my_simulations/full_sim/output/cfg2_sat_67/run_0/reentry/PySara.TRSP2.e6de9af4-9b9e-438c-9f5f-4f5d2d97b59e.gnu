 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.TRSP2.e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TRSP2 (e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.TRSP2.e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e_Trajectory.txt' using 1:2 w l ls 1 title 'TRSP2' noenhanced, \
 
set o 'PySara.TRSP2.e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TRSP2 (e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.TRSP2.e6de9af4-9b9e-438c-9f5f-4f5d2d97b59e_Trajectory.txt' using 6:2 w l ls 1 title 'TRSP2' noenhanced
 
