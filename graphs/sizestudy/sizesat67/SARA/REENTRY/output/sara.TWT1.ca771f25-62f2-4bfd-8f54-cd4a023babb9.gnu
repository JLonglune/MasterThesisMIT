 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.TWT1.ca771f25-62f2-4bfd-8f54-cd4a023babb9_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TWT1 (ca771f25-62f2-4bfd-8f54-cd4a023babb9)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.TWT1.ca771f25-62f2-4bfd-8f54-cd4a023babb9_Trajectory.txt' using 1:2 w l ls 1 title 'TWT1' noenhanced, \
 
set o 'sara.TWT1.ca771f25-62f2-4bfd-8f54-cd4a023babb9_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TWT1 (ca771f25-62f2-4bfd-8f54-cd4a023babb9)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.TWT1.ca771f25-62f2-4bfd-8f54-cd4a023babb9_Trajectory.txt' using 6:2 w l ls 1 title 'TWT1' noenhanced
 
