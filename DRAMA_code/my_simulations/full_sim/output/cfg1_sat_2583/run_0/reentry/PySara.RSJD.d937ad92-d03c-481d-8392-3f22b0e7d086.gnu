 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.RSJD.d937ad92-d03c-481d-8392-3f22b0e7d086_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RSJD (d937ad92-d03c-481d-8392-3f22b0e7d086)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.RSJD.d937ad92-d03c-481d-8392-3f22b0e7d086_Trajectory.txt' using 1:2 w l ls 1 title 'RSJD' noenhanced, \
 
set o 'PySara.RSJD.d937ad92-d03c-481d-8392-3f22b0e7d086_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RSJD (d937ad92-d03c-481d-8392-3f22b0e7d086)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.RSJD.d937ad92-d03c-481d-8392-3f22b0e7d086_Trajectory.txt' using 6:2 w l ls 1 title 'RSJD' noenhanced
 
