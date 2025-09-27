 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.Tank3.b44d182e-cc26-4486-970c-ebf58aa27cc0_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Tank3 (b44d182e-cc26-4486-970c-ebf58aa27cc0)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.Tank3.b44d182e-cc26-4486-970c-ebf58aa27cc0_Trajectory.txt' using 1:2 w l ls 1 title 'Tank3' noenhanced, \
 
set o 'sara.Tank3.b44d182e-cc26-4486-970c-ebf58aa27cc0_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Tank3 (b44d182e-cc26-4486-970c-ebf58aa27cc0)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.Tank3.b44d182e-cc26-4486-970c-ebf58aa27cc0_Trajectory.txt' using 6:2 w l ls 1 title 'Tank3' noenhanced
 
