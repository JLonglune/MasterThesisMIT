 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.T4S.ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of T4S (ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.T4S.ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc_Trajectory.txt' using 1:2 w l ls 1 title 'T4S' noenhanced, \
 
set o 'sara.T4S.ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of T4S (ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.T4S.ef81eb2d-2aa0-42ee-801f-6c9d4f2836fc_Trajectory.txt' using 6:2 w l ls 1 title 'T4S' noenhanced
 
