 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SADM1_internal.40e2ffab-db50-4f10-af07-844ac3cd46d1_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SADM1_internal (40e2ffab-db50-4f10-af07-844ac3cd46d1)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SADM1_internal.40e2ffab-db50-4f10-af07-844ac3cd46d1_Trajectory.txt' using 1:2 w l ls 1 title 'SADM1_internal' noenhanced, \
 
set o 'PySara.SADM1_internal.40e2ffab-db50-4f10-af07-844ac3cd46d1_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SADM1_internal (40e2ffab-db50-4f10-af07-844ac3cd46d1)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SADM1_internal.40e2ffab-db50-4f10-af07-844ac3cd46d1_Trajectory.txt' using 6:2 w l ls 1 title 'SADM1_internal' noenhanced
 
