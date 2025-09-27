 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ValvTran2.d434ed3a-2eb2-42cd-9156-a61e1e3e9de8_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran2 (d434ed3a-2eb2-42cd-9156-a61e1e3e9de8)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ValvTran2.d434ed3a-2eb2-42cd-9156-a61e1e3e9de8_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran2' noenhanced, \
 
set o 'sara.ValvTran2.d434ed3a-2eb2-42cd-9156-a61e1e3e9de8_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran2 (d434ed3a-2eb2-42cd-9156-a61e1e3e9de8)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ValvTran2.d434ed3a-2eb2-42cd-9156-a61e1e3e9de8_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran2' noenhanced
 
