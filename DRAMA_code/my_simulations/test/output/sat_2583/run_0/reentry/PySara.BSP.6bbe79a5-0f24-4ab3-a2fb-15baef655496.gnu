 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.BSP.6bbe79a5-0f24-4ab3-a2fb-15baef655496_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BSP (6bbe79a5-0f24-4ab3-a2fb-15baef655496)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.BSP.6bbe79a5-0f24-4ab3-a2fb-15baef655496_Trajectory.txt' using 1:2 w l ls 1 title 'BSP' noenhanced, \
 
set o 'PySara.BSP.6bbe79a5-0f24-4ab3-a2fb-15baef655496_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BSP (6bbe79a5-0f24-4ab3-a2fb-15baef655496)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.BSP.6bbe79a5-0f24-4ab3-a2fb-15baef655496_Trajectory.txt' using 6:2 w l ls 1 title 'BSP' noenhanced
 
