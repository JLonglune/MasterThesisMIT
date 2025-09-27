 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SAsupp5.b780d3fd-f6d3-4fe4-9213-52c680cd507b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAsupp5 (b780d3fd-f6d3-4fe4-9213-52c680cd507b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SAsupp5.b780d3fd-f6d3-4fe4-9213-52c680cd507b_Trajectory.txt' using 1:2 w l ls 1 title 'SAsupp5' noenhanced, \
 
set o 'sara.SAsupp5.b780d3fd-f6d3-4fe4-9213-52c680cd507b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAsupp5 (b780d3fd-f6d3-4fe4-9213-52c680cd507b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SAsupp5.b780d3fd-f6d3-4fe4-9213-52c680cd507b_Trajectory.txt' using 6:2 w l ls 1 title 'SAsupp5' noenhanced
 
