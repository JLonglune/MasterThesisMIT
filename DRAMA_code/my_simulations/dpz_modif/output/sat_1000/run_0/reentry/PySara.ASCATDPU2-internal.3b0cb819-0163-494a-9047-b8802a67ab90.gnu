 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATDPU2-internal.3b0cb819-0163-494a-9047-b8802a67ab90_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATDPU2-internal (3b0cb819-0163-494a-9047-b8802a67ab90)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATDPU2-internal.3b0cb819-0163-494a-9047-b8802a67ab90_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATDPU2-internal' noenhanced, \
 
set o 'PySara.ASCATDPU2-internal.3b0cb819-0163-494a-9047-b8802a67ab90_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATDPU2-internal (3b0cb819-0163-494a-9047-b8802a67ab90)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATDPU2-internal.3b0cb819-0163-494a-9047-b8802a67ab90_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATDPU2-internal' noenhanced
 
