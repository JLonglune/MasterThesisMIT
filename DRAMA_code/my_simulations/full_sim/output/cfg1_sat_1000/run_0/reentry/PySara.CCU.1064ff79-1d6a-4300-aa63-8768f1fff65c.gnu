 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.CCU.1064ff79-1d6a-4300-aa63-8768f1fff65c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of CCU (1064ff79-1d6a-4300-aa63-8768f1fff65c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.CCU.1064ff79-1d6a-4300-aa63-8768f1fff65c_Trajectory.txt' using 1:2 w l ls 1 title 'CCU' noenhanced, \
 
set o 'PySara.CCU.1064ff79-1d6a-4300-aa63-8768f1fff65c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of CCU (1064ff79-1d6a-4300-aa63-8768f1fff65c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.CCU.1064ff79-1d6a-4300-aa63-8768f1fff65c_Trajectory.txt' using 6:2 w l ls 1 title 'CCU' noenhanced
 
