 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EIU.ff1aaf73-80e2-4d35-8d64-7e51fe643ecf_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EIU (ff1aaf73-80e2-4d35-8d64-7e51fe643ecf)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EIU.ff1aaf73-80e2-4d35-8d64-7e51fe643ecf_Trajectory.txt' using 1:2 w l ls 1 title 'EIU' noenhanced, \
 
set o 'sara.EIU.ff1aaf73-80e2-4d35-8d64-7e51fe643ecf_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EIU (ff1aaf73-80e2-4d35-8d64-7e51fe643ecf)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EIU.ff1aaf73-80e2-4d35-8d64-7e51fe643ecf_Trajectory.txt' using 6:2 w l ls 1 title 'EIU' noenhanced
 
