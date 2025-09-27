 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATEPC2-internal.170c51e7-5a72-41fb-ad75-9abcf426fe38_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATEPC2-internal (170c51e7-5a72-41fb-ad75-9abcf426fe38)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATEPC2-internal.170c51e7-5a72-41fb-ad75-9abcf426fe38_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATEPC2-internal' noenhanced, \
 
set o 'PySara.ASCATEPC2-internal.170c51e7-5a72-41fb-ad75-9abcf426fe38_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATEPC2-internal (170c51e7-5a72-41fb-ad75-9abcf426fe38)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATEPC2-internal.170c51e7-5a72-41fb-ad75-9abcf426fe38_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATEPC2-internal' noenhanced
 
