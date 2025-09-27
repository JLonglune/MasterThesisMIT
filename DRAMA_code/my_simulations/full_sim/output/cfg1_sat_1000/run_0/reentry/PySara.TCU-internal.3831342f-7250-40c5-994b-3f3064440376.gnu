 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.TCU-internal.3831342f-7250-40c5-994b-3f3064440376_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TCU-internal (3831342f-7250-40c5-994b-3f3064440376)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.TCU-internal.3831342f-7250-40c5-994b-3f3064440376_Trajectory.txt' using 1:2 w l ls 1 title 'TCU-internal' noenhanced, \
 
set o 'PySara.TCU-internal.3831342f-7250-40c5-994b-3f3064440376_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TCU-internal (3831342f-7250-40c5-994b-3f3064440376)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.TCU-internal.3831342f-7250-40c5-994b-3f3064440376_Trajectory.txt' using 6:2 w l ls 1 title 'TCU-internal' noenhanced
 
