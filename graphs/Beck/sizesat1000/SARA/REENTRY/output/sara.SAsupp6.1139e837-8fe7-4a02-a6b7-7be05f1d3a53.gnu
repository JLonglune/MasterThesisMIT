 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SAsupp6.1139e837-8fe7-4a02-a6b7-7be05f1d3a53_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAsupp6 (1139e837-8fe7-4a02-a6b7-7be05f1d3a53)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SAsupp6.1139e837-8fe7-4a02-a6b7-7be05f1d3a53_Trajectory.txt' using 1:2 w l ls 1 title 'SAsupp6' noenhanced, \
 
set o 'sara.SAsupp6.1139e837-8fe7-4a02-a6b7-7be05f1d3a53_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAsupp6 (1139e837-8fe7-4a02-a6b7-7be05f1d3a53)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SAsupp6.1139e837-8fe7-4a02-a6b7-7be05f1d3a53_Trajectory.txt' using 6:2 w l ls 1 title 'SAsupp6' noenhanced
 
