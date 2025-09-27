 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Cylind2.8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Cylind2 (8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Cylind2.8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b_Trajectory.txt' using 1:2 w l ls 1 title 'Cylind2' noenhanced, \
 
set o 'PySara.Cylind2.8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Cylind2 (8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Cylind2.8dcb8ef0-fe12-4766-9c27-6bc2e3f3855b_Trajectory.txt' using 6:2 w l ls 1 title 'Cylind2' noenhanced
 
