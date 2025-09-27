 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.EPC2.c447122c-bb20-4315-8121-0a35700a3f6b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EPC2 (c447122c-bb20-4315-8121-0a35700a3f6b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.EPC2.c447122c-bb20-4315-8121-0a35700a3f6b_Trajectory.txt' using 1:2 w l ls 1 title 'EPC2' noenhanced, \
 
set o 'PySara.EPC2.c447122c-bb20-4315-8121-0a35700a3f6b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EPC2 (c447122c-bb20-4315-8121-0a35700a3f6b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.EPC2.c447122c-bb20-4315-8121-0a35700a3f6b_Trajectory.txt' using 6:2 w l ls 1 title 'EPC2' noenhanced
 
