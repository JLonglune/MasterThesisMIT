 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.H-SSPA2.9e0a805e-eac1-4103-891b-7ee76bc46231_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of H-SSPA2 (9e0a805e-eac1-4103-891b-7ee76bc46231)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.H-SSPA2.9e0a805e-eac1-4103-891b-7ee76bc46231_Trajectory.txt' using 1:2 w l ls 1 title 'H-SSPA2' noenhanced, \
 
set o 'PySara.H-SSPA2.9e0a805e-eac1-4103-891b-7ee76bc46231_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of H-SSPA2 (9e0a805e-eac1-4103-891b-7ee76bc46231)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.H-SSPA2.9e0a805e-eac1-4103-891b-7ee76bc46231_Trajectory.txt' using 6:2 w l ls 1 title 'H-SSPA2' noenhanced
 
