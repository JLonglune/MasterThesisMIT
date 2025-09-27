 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.LH-MOD1.f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of LH-MOD1 (f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.LH-MOD1.f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0_Trajectory.txt' using 1:2 w l ls 1 title 'LH-MOD1' noenhanced, \
 
set o 'sara.LH-MOD1.f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of LH-MOD1 (f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.LH-MOD1.f9be32d6-1e7d-4319-bee1-3f5b3dd21cd0_Trajectory.txt' using 6:2 w l ls 1 title 'LH-MOD1' noenhanced
 
