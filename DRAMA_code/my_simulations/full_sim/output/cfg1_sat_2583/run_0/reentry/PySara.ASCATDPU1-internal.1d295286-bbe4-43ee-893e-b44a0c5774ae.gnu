 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATDPU1-internal.1d295286-bbe4-43ee-893e-b44a0c5774ae_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATDPU1-internal (1d295286-bbe4-43ee-893e-b44a0c5774ae)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATDPU1-internal.1d295286-bbe4-43ee-893e-b44a0c5774ae_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATDPU1-internal' noenhanced, \
 
set o 'PySara.ASCATDPU1-internal.1d295286-bbe4-43ee-893e-b44a0c5774ae_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATDPU1-internal (1d295286-bbe4-43ee-893e-b44a0c5774ae)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATDPU1-internal.1d295286-bbe4-43ee-893e-b44a0c5774ae_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATDPU1-internal' noenhanced
 
