 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATDPU2.52086079-11dd-4ba5-86f1-ac04d0947720_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATDPU2 (52086079-11dd-4ba5-86f1-ac04d0947720)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATDPU2.52086079-11dd-4ba5-86f1-ac04d0947720_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATDPU2' noenhanced, \
 
set o 'sara.ASCATDPU2.52086079-11dd-4ba5-86f1-ac04d0947720_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATDPU2 (52086079-11dd-4ba5-86f1-ac04d0947720)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATDPU2.52086079-11dd-4ba5-86f1-ac04d0947720_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATDPU2' noenhanced
 
