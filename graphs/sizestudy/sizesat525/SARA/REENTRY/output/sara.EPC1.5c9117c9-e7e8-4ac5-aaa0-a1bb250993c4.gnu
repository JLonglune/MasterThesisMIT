 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EPC1.5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EPC1 (5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EPC1.5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4_Trajectory.txt' using 1:2 w l ls 1 title 'EPC1' noenhanced, \
 
set o 'sara.EPC1.5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EPC1 (5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EPC1.5c9117c9-e7e8-4ac5-aaa0-a1bb250993c4_Trajectory.txt' using 6:2 w l ls 1 title 'EPC1' noenhanced
 
