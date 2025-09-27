 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.NIU.e2f95e2d-87da-419c-9e0a-23294d603d7d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of NIU (e2f95e2d-87da-419c-9e0a-23294d603d7d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.NIU.e2f95e2d-87da-419c-9e0a-23294d603d7d_Trajectory.txt' using 1:2 w l ls 1 title 'NIU' noenhanced, \
 
set o 'PySara.NIU.e2f95e2d-87da-419c-9e0a-23294d603d7d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of NIU (e2f95e2d-87da-419c-9e0a-23294d603d7d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.NIU.e2f95e2d-87da-419c-9e0a-23294d603d7d_Trajectory.txt' using 6:2 w l ls 1 title 'NIU' noenhanced
 
