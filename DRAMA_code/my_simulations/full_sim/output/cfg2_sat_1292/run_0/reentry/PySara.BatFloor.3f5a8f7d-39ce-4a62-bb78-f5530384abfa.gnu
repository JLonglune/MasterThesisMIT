 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.BatFloor.3f5a8f7d-39ce-4a62-bb78-f5530384abfa_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BatFloor (3f5a8f7d-39ce-4a62-bb78-f5530384abfa)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.BatFloor.3f5a8f7d-39ce-4a62-bb78-f5530384abfa_Trajectory.txt' using 1:2 w l ls 1 title 'BatFloor' noenhanced, \
 
set o 'PySara.BatFloor.3f5a8f7d-39ce-4a62-bb78-f5530384abfa_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BatFloor (3f5a8f7d-39ce-4a62-bb78-f5530384abfa)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.BatFloor.3f5a8f7d-39ce-4a62-bb78-f5530384abfa_Trajectory.txt' using 6:2 w l ls 1 title 'BatFloor' noenhanced
 
