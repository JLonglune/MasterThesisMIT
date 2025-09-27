 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.MOD1.b3430ea6-7c48-4042-b5f7-b07cf49a6371_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MOD1 (b3430ea6-7c48-4042-b5f7-b07cf49a6371)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.MOD1.b3430ea6-7c48-4042-b5f7-b07cf49a6371_Trajectory.txt' using 1:2 w l ls 1 title 'MOD1' noenhanced, \
 
set o 'sara.MOD1.b3430ea6-7c48-4042-b5f7-b07cf49a6371_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MOD1 (b3430ea6-7c48-4042-b5f7-b07cf49a6371)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.MOD1.b3430ea6-7c48-4042-b5f7-b07cf49a6371_Trajectory.txt' using 6:2 w l ls 1 title 'MOD1' noenhanced
 
