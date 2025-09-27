 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATRFU1.0aa8a2c0-ec39-42e6-8da8-bc6cc699c606_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATRFU1 (0aa8a2c0-ec39-42e6-8da8-bc6cc699c606)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATRFU1.0aa8a2c0-ec39-42e6-8da8-bc6cc699c606_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATRFU1' noenhanced, \
 
set o 'sara.ASCATRFU1.0aa8a2c0-ec39-42e6-8da8-bc6cc699c606_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATRFU1 (0aa8a2c0-ec39-42e6-8da8-bc6cc699c606)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATRFU1.0aa8a2c0-ec39-42e6-8da8-bc6cc699c606_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATRFU1' noenhanced
 
