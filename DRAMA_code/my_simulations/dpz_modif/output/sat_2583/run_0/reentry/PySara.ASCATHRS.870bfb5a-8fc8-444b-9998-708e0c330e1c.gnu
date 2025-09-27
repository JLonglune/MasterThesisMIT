 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ASCATHRS.870bfb5a-8fc8-444b-9998-708e0c330e1c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATHRS (870bfb5a-8fc8-444b-9998-708e0c330e1c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ASCATHRS.870bfb5a-8fc8-444b-9998-708e0c330e1c_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATHRS' noenhanced, \
 
set o 'PySara.ASCATHRS.870bfb5a-8fc8-444b-9998-708e0c330e1c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATHRS (870bfb5a-8fc8-444b-9998-708e0c330e1c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ASCATHRS.870bfb5a-8fc8-444b-9998-708e0c330e1c_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATHRS' noenhanced
 
