 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RFCU2.185ca8fd-00f8-4470-b37e-a82dc41765b1_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RFCU2 (185ca8fd-00f8-4470-b37e-a82dc41765b1)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RFCU2.185ca8fd-00f8-4470-b37e-a82dc41765b1_Trajectory.txt' using 1:2 w l ls 1 title 'RFCU2' noenhanced, \
 
set o 'sara.RFCU2.185ca8fd-00f8-4470-b37e-a82dc41765b1_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RFCU2 (185ca8fd-00f8-4470-b37e-a82dc41765b1)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RFCU2.185ca8fd-00f8-4470-b37e-a82dc41765b1_Trajectory.txt' using 6:2 w l ls 1 title 'RFCU2' noenhanced
 
