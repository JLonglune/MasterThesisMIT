 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.ADCS-RPU-internal.03edc3be-cf19-481c-9863-89be7cb55690_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ADCS-RPU-internal (03edc3be-cf19-481c-9863-89be7cb55690)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.ADCS-RPU-internal.03edc3be-cf19-481c-9863-89be7cb55690_Trajectory.txt' using 1:2 w l ls 1 title 'ADCS-RPU-internal' noenhanced, \
 
set o 'PySara.ADCS-RPU-internal.03edc3be-cf19-481c-9863-89be7cb55690_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ADCS-RPU-internal (03edc3be-cf19-481c-9863-89be7cb55690)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.ADCS-RPU-internal.03edc3be-cf19-481c-9863-89be7cb55690_Trajectory.txt' using 6:2 w l ls 1 title 'ADCS-RPU-internal' noenhanced
 
