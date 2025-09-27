 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SAR-Tx.2174174d-8633-470f-81db-77add3252e0f_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAR-Tx (2174174d-8633-470f-81db-77add3252e0f)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SAR-Tx.2174174d-8633-470f-81db-77add3252e0f_Trajectory.txt' using 1:2 w l ls 1 title 'SAR-Tx' noenhanced, \
 
set o 'PySara.SAR-Tx.2174174d-8633-470f-81db-77add3252e0f_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAR-Tx (2174174d-8633-470f-81db-77add3252e0f)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SAR-Tx.2174174d-8633-470f-81db-77add3252e0f_Trajectory.txt' using 6:2 w l ls 1 title 'SAR-Tx' noenhanced
 
