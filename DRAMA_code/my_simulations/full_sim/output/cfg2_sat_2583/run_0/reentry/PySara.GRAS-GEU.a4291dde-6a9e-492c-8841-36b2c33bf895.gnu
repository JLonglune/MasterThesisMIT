 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.GRAS-GEU.a4291dde-6a9e-492c-8841-36b2c33bf895_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of GRAS-GEU (a4291dde-6a9e-492c-8841-36b2c33bf895)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.GRAS-GEU.a4291dde-6a9e-492c-8841-36b2c33bf895_Trajectory.txt' using 1:2 w l ls 1 title 'GRAS-GEU' noenhanced, \
 
set o 'PySara.GRAS-GEU.a4291dde-6a9e-492c-8841-36b2c33bf895_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of GRAS-GEU (a4291dde-6a9e-492c-8841-36b2c33bf895)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.GRAS-GEU.a4291dde-6a9e-492c-8841-36b2c33bf895_Trajectory.txt' using 6:2 w l ls 1 title 'GRAS-GEU' noenhanced
 
