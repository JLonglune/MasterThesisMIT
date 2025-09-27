 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ADCS-TXU-internal.8fb80bdc-9527-4c99-a844-ed98ae3af01e_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ADCS-TXU-internal (8fb80bdc-9527-4c99-a844-ed98ae3af01e)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ADCS-TXU-internal.8fb80bdc-9527-4c99-a844-ed98ae3af01e_Trajectory.txt' using 1:2 w l ls 1 title 'ADCS-TXU-internal' noenhanced, \
 
set o 'PySara.ADCS-TXU-internal.8fb80bdc-9527-4c99-a844-ed98ae3af01e_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ADCS-TXU-internal (8fb80bdc-9527-4c99-a844-ed98ae3af01e)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ADCS-TXU-internal.8fb80bdc-9527-4c99-a844-ed98ae3af01e_Trajectory.txt' using 6:2 w l ls 1 title 'ADCS-TXU-internal' noenhanced
 
