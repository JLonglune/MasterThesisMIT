 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SheWallY1.55fcf338-3461-468f-ae95-f36d48f25aae_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SheWallY1 (55fcf338-3461-468f-ae95-f36d48f25aae)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SheWallY1.55fcf338-3461-468f-ae95-f36d48f25aae_Trajectory.txt' using 1:2 w l ls 1 title 'SheWallY1' noenhanced, \
 
set o 'PySara.SheWallY1.55fcf338-3461-468f-ae95-f36d48f25aae_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SheWallY1 (55fcf338-3461-468f-ae95-f36d48f25aae)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SheWallY1.55fcf338-3461-468f-ae95-f36d48f25aae_Trajectory.txt' using 6:2 w l ls 1 title 'SheWallY1' noenhanced
 
