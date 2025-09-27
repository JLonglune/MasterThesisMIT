 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.LNA1.844d48f4-13ed-41a6-a555-1762db662628_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of LNA1 (844d48f4-13ed-41a6-a555-1762db662628)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.LNA1.844d48f4-13ed-41a6-a555-1762db662628_Trajectory.txt' using 1:2 w l ls 1 title 'LNA1' noenhanced, \
 
set o 'sara.LNA1.844d48f4-13ed-41a6-a555-1762db662628_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of LNA1 (844d48f4-13ed-41a6-a555-1762db662628)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.LNA1.844d48f4-13ed-41a6-a555-1762db662628_Trajectory.txt' using 6:2 w l ls 1 title 'LNA1' noenhanced
 
