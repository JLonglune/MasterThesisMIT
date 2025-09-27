 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.H-SSPA1.f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of H-SSPA1 (f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.H-SSPA1.f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39_Trajectory.txt' using 1:2 w l ls 1 title 'H-SSPA1' noenhanced, \
 
set o 'PySara.H-SSPA1.f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of H-SSPA1 (f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.H-SSPA1.f29a83d7-5acb-4d9e-a2bb-5c9f9fd86e39_Trajectory.txt' using 6:2 w l ls 1 title 'H-SSPA1' noenhanced
 
