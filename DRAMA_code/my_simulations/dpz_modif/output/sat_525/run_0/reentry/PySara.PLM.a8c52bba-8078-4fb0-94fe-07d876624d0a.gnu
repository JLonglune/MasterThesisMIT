 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.PLM.a8c52bba-8078-4fb0-94fe-07d876624d0a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PLM (a8c52bba-8078-4fb0-94fe-07d876624d0a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.PLM.a8c52bba-8078-4fb0-94fe-07d876624d0a_Trajectory.txt' using 1:2 w l ls 1 title 'PLM' noenhanced, \
 
set o 'PySara.PLM.a8c52bba-8078-4fb0-94fe-07d876624d0a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PLM (a8c52bba-8078-4fb0-94fe-07d876624d0a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.PLM.a8c52bba-8078-4fb0-94fe-07d876624d0a_Trajectory.txt' using 6:2 w l ls 1 title 'PLM' noenhanced
 
