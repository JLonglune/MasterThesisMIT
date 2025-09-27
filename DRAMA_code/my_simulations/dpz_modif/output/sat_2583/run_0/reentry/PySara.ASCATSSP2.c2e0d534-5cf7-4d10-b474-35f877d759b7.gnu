 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATSSP2.c2e0d534-5cf7-4d10-b474-35f877d759b7_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATSSP2 (c2e0d534-5cf7-4d10-b474-35f877d759b7)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATSSP2.c2e0d534-5cf7-4d10-b474-35f877d759b7_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATSSP2' noenhanced, \
 
set o 'PySara.ASCATSSP2.c2e0d534-5cf7-4d10-b474-35f877d759b7_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATSSP2 (c2e0d534-5cf7-4d10-b474-35f877d759b7)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATSSP2.c2e0d534-5cf7-4d10-b474-35f877d759b7_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATSSP2' noenhanced
 
