 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.CentCone.dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of CentCone (dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.CentCone.dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd_Trajectory.txt' using 1:2 w l ls 1 title 'CentCone' noenhanced, \
 
set o 'PySara.CentCone.dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of CentCone (dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.CentCone.dbe0cea8-a0d5-4d89-8517-e1de3fc8b8fd_Trajectory.txt' using 6:2 w l ls 1 title 'CentCone' noenhanced
 
