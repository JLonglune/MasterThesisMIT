 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATEPC2-internal.a933ab03-015e-441f-b11a-b091ee871152_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATEPC2-internal (a933ab03-015e-441f-b11a-b091ee871152)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATEPC2-internal.a933ab03-015e-441f-b11a-b091ee871152_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATEPC2-internal' noenhanced, \
 
set o 'sara.ASCATEPC2-internal.a933ab03-015e-441f-b11a-b091ee871152_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATEPC2-internal (a933ab03-015e-441f-b11a-b091ee871152)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATEPC2-internal.a933ab03-015e-441f-b11a-b091ee871152_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATEPC2-internal' noenhanced
 
