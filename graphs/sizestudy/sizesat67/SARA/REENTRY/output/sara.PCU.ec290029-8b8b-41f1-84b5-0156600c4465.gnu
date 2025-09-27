 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.PCU.ec290029-8b8b-41f1-84b5-0156600c4465_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of PCU (ec290029-8b8b-41f1-84b5-0156600c4465)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.PCU.ec290029-8b8b-41f1-84b5-0156600c4465_Trajectory.txt' using 1:2 w l ls 1 title 'PCU' noenhanced, \
 
set o 'sara.PCU.ec290029-8b8b-41f1-84b5-0156600c4465_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of PCU (ec290029-8b8b-41f1-84b5-0156600c4465)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.PCU.ec290029-8b8b-41f1-84b5-0156600c4465_Trajectory.txt' using 6:2 w l ls 1 title 'PCU' noenhanced
 
