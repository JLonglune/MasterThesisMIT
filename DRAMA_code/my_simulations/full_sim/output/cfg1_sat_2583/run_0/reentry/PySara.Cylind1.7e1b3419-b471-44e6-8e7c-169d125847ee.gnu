 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Cylind1.7e1b3419-b471-44e6-8e7c-169d125847ee_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Cylind1 (7e1b3419-b471-44e6-8e7c-169d125847ee)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Cylind1.7e1b3419-b471-44e6-8e7c-169d125847ee_Trajectory.txt' using 1:2 w l ls 1 title 'Cylind1' noenhanced, \
 
set o 'PySara.Cylind1.7e1b3419-b471-44e6-8e7c-169d125847ee_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Cylind1 (7e1b3419-b471-44e6-8e7c-169d125847ee)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Cylind1.7e1b3419-b471-44e6-8e7c-169d125847ee_Trajectory.txt' using 6:2 w l ls 1 title 'Cylind1' noenhanced
 
