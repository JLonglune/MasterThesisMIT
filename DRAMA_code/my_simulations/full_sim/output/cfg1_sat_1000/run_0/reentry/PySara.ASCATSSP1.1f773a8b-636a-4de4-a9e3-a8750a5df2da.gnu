 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATSSP1.1f773a8b-636a-4de4-a9e3-a8750a5df2da_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATSSP1 (1f773a8b-636a-4de4-a9e3-a8750a5df2da)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATSSP1.1f773a8b-636a-4de4-a9e3-a8750a5df2da_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATSSP1' noenhanced, \
 
set o 'PySara.ASCATSSP1.1f773a8b-636a-4de4-a9e3-a8750a5df2da_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATSSP1 (1f773a8b-636a-4de4-a9e3-a8750a5df2da)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATSSP1.1f773a8b-636a-4de4-a9e3-a8750a5df2da_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATSSP1' noenhanced
 
