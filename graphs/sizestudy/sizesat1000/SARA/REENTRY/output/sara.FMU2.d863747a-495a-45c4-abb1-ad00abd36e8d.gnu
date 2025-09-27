 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.FMU2.d863747a-495a-45c4-abb1-ad00abd36e8d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of FMU2 (d863747a-495a-45c4-abb1-ad00abd36e8d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.FMU2.d863747a-495a-45c4-abb1-ad00abd36e8d_Trajectory.txt' using 1:2 w l ls 1 title 'FMU2' noenhanced, \
 
set o 'sara.FMU2.d863747a-495a-45c4-abb1-ad00abd36e8d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of FMU2 (d863747a-495a-45c4-abb1-ad00abd36e8d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.FMU2.d863747a-495a-45c4-abb1-ad00abd36e8d_Trajectory.txt' using 6:2 w l ls 1 title 'FMU2' noenhanced
 
