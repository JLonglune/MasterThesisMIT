 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ValvTran1.8908b1bc-115a-431c-a614-4f92e53da761_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran1 (8908b1bc-115a-431c-a614-4f92e53da761)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ValvTran1.8908b1bc-115a-431c-a614-4f92e53da761_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran1' noenhanced, \
 
set o 'PySara.ValvTran1.8908b1bc-115a-431c-a614-4f92e53da761_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran1 (8908b1bc-115a-431c-a614-4f92e53da761)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ValvTran1.8908b1bc-115a-431c-a614-4f92e53da761_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran1' noenhanced
 
