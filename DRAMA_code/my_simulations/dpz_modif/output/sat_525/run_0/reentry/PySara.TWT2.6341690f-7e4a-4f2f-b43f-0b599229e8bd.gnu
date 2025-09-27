 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.TWT2.6341690f-7e4a-4f2f-b43f-0b599229e8bd_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TWT2 (6341690f-7e4a-4f2f-b43f-0b599229e8bd)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.TWT2.6341690f-7e4a-4f2f-b43f-0b599229e8bd_Trajectory.txt' using 1:2 w l ls 1 title 'TWT2' noenhanced, \
 
set o 'PySara.TWT2.6341690f-7e4a-4f2f-b43f-0b599229e8bd_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TWT2 (6341690f-7e4a-4f2f-b43f-0b599229e8bd)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.TWT2.6341690f-7e4a-4f2f-b43f-0b599229e8bd_Trajectory.txt' using 6:2 w l ls 1 title 'TWT2' noenhanced
 
