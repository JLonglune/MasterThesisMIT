 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.BSP.0b78a548-49bc-4f2b-8b9f-999d24c804ae_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BSP (0b78a548-49bc-4f2b-8b9f-999d24c804ae)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.BSP.0b78a548-49bc-4f2b-8b9f-999d24c804ae_Trajectory.txt' using 1:2 w l ls 1 title 'BSP' noenhanced, \
 
set o 'PySara.BSP.0b78a548-49bc-4f2b-8b9f-999d24c804ae_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BSP (0b78a548-49bc-4f2b-8b9f-999d24c804ae)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.BSP.0b78a548-49bc-4f2b-8b9f-999d24c804ae_Trajectory.txt' using 6:2 w l ls 1 title 'BSP' noenhanced
 
