 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SSD2.cfb2351a-41cc-4000-8a6d-1bd21ea75eb1_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SSD2 (cfb2351a-41cc-4000-8a6d-1bd21ea75eb1)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SSD2.cfb2351a-41cc-4000-8a6d-1bd21ea75eb1_Trajectory.txt' using 1:2 w l ls 1 title 'SSD2' noenhanced, \
 
set o 'sara.SSD2.cfb2351a-41cc-4000-8a6d-1bd21ea75eb1_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SSD2 (cfb2351a-41cc-4000-8a6d-1bd21ea75eb1)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SSD2.cfb2351a-41cc-4000-8a6d-1bd21ea75eb1_Trajectory.txt' using 6:2 w l ls 1 title 'SSD2' noenhanced
 
