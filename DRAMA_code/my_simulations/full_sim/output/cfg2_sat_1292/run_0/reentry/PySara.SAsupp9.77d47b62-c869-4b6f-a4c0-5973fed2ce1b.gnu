 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SAsupp9.77d47b62-c869-4b6f-a4c0-5973fed2ce1b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAsupp9 (77d47b62-c869-4b6f-a4c0-5973fed2ce1b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SAsupp9.77d47b62-c869-4b6f-a4c0-5973fed2ce1b_Trajectory.txt' using 1:2 w l ls 1 title 'SAsupp9' noenhanced, \
 
set o 'PySara.SAsupp9.77d47b62-c869-4b6f-a4c0-5973fed2ce1b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAsupp9 (77d47b62-c869-4b6f-a4c0-5973fed2ce1b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SAsupp9.77d47b62-c869-4b6f-a4c0-5973fed2ce1b_Trajectory.txt' using 6:2 w l ls 1 title 'SAsupp9' noenhanced
 
