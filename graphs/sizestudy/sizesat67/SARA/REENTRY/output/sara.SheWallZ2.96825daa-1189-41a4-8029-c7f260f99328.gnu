 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SheWallZ2.96825daa-1189-41a4-8029-c7f260f99328_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SheWallZ2 (96825daa-1189-41a4-8029-c7f260f99328)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SheWallZ2.96825daa-1189-41a4-8029-c7f260f99328_Trajectory.txt' using 1:2 w l ls 1 title 'SheWallZ2' noenhanced, \
 
set o 'sara.SheWallZ2.96825daa-1189-41a4-8029-c7f260f99328_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SheWallZ2 (96825daa-1189-41a4-8029-c7f260f99328)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SheWallZ2.96825daa-1189-41a4-8029-c7f260f99328_Trajectory.txt' using 6:2 w l ls 1 title 'SheWallZ2' noenhanced
 
