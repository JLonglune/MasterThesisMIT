 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ValvTran3.e3e44d35-027b-4caf-a9ef-a1f6bd2be195_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran3 (e3e44d35-027b-4caf-a9ef-a1f6bd2be195)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ValvTran3.e3e44d35-027b-4caf-a9ef-a1f6bd2be195_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran3' noenhanced, \
 
set o 'sara.ValvTran3.e3e44d35-027b-4caf-a9ef-a1f6bd2be195_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran3 (e3e44d35-027b-4caf-a9ef-a1f6bd2be195)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ValvTran3.e3e44d35-027b-4caf-a9ef-a1f6bd2be195_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran3' noenhanced
 
