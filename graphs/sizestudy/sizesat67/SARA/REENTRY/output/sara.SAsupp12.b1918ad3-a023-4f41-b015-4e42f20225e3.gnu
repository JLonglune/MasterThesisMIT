 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SAsupp12.b1918ad3-a023-4f41-b015-4e42f20225e3_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAsupp12 (b1918ad3-a023-4f41-b015-4e42f20225e3)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SAsupp12.b1918ad3-a023-4f41-b015-4e42f20225e3_Trajectory.txt' using 1:2 w l ls 1 title 'SAsupp12' noenhanced, \
 
set o 'sara.SAsupp12.b1918ad3-a023-4f41-b015-4e42f20225e3_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAsupp12 (b1918ad3-a023-4f41-b015-4e42f20225e3)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SAsupp12.b1918ad3-a023-4f41-b015-4e42f20225e3_Trajectory.txt' using 6:2 w l ls 1 title 'SAsupp12' noenhanced
 
