 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.L-SSPA1.813c8c0b-733c-44d2-acd5-ccde788a753d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of L-SSPA1 (813c8c0b-733c-44d2-acd5-ccde788a753d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.L-SSPA1.813c8c0b-733c-44d2-acd5-ccde788a753d_Trajectory.txt' using 1:2 w l ls 1 title 'L-SSPA1' noenhanced, \
 
set o 'PySara.L-SSPA1.813c8c0b-733c-44d2-acd5-ccde788a753d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of L-SSPA1 (813c8c0b-733c-44d2-acd5-ccde788a753d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.L-SSPA1.813c8c0b-733c-44d2-acd5-ccde788a753d_Trajectory.txt' using 6:2 w l ls 1 title 'L-SSPA1' noenhanced
 
