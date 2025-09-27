 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.OBA.1639538e-29da-4716-9d3c-53b7b487923a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of OBA (1639538e-29da-4716-9d3c-53b7b487923a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.OBA.1639538e-29da-4716-9d3c-53b7b487923a_Trajectory.txt' using 1:2 w l ls 1 title 'OBA' noenhanced, \
 
set o 'PySara.OBA.1639538e-29da-4716-9d3c-53b7b487923a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of OBA (1639538e-29da-4716-9d3c-53b7b487923a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.OBA.1639538e-29da-4716-9d3c-53b7b487923a_Trajectory.txt' using 6:2 w l ls 1 title 'OBA' noenhanced
 
