 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EPRM.6d068f8c-42c1-4e67-8a34-0e2d5d014c75_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EPRM (6d068f8c-42c1-4e67-8a34-0e2d5d014c75)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EPRM.6d068f8c-42c1-4e67-8a34-0e2d5d014c75_Trajectory.txt' using 1:2 w l ls 1 title 'EPRM' noenhanced, \
 
set o 'sara.EPRM.6d068f8c-42c1-4e67-8a34-0e2d5d014c75_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EPRM (6d068f8c-42c1-4e67-8a34-0e2d5d014c75)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EPRM.6d068f8c-42c1-4e67-8a34-0e2d5d014c75_Trajectory.txt' using 6:2 w l ls 1 title 'EPRM' noenhanced
 
