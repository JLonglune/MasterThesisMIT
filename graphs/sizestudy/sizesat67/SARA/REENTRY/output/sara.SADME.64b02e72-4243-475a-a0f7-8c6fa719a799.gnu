 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SADME.64b02e72-4243-475a-a0f7-8c6fa719a799_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SADME (64b02e72-4243-475a-a0f7-8c6fa719a799)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SADME.64b02e72-4243-475a-a0f7-8c6fa719a799_Trajectory.txt' using 1:2 w l ls 1 title 'SADME' noenhanced, \
 
set o 'sara.SADME.64b02e72-4243-475a-a0f7-8c6fa719a799_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SADME (64b02e72-4243-475a-a0f7-8c6fa719a799)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SADME.64b02e72-4243-475a-a0f7-8c6fa719a799_Trajectory.txt' using 6:2 w l ls 1 title 'SADME' noenhanced
 
