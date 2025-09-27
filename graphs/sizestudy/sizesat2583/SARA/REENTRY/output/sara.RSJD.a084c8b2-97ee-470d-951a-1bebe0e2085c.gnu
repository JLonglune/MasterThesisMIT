 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RSJD.a084c8b2-97ee-470d-951a-1bebe0e2085c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RSJD (a084c8b2-97ee-470d-951a-1bebe0e2085c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RSJD.a084c8b2-97ee-470d-951a-1bebe0e2085c_Trajectory.txt' using 1:2 w l ls 1 title 'RSJD' noenhanced, \
 
set o 'sara.RSJD.a084c8b2-97ee-470d-951a-1bebe0e2085c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RSJD (a084c8b2-97ee-470d-951a-1bebe0e2085c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RSJD.a084c8b2-97ee-470d-951a-1bebe0e2085c_Trajectory.txt' using 6:2 w l ls 1 title 'RSJD' noenhanced
 
