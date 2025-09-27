 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.GRAS-GEU.3e3557b4-6663-48e9-990d-b3153e71579a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of GRAS-GEU (3e3557b4-6663-48e9-990d-b3153e71579a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.GRAS-GEU.3e3557b4-6663-48e9-990d-b3153e71579a_Trajectory.txt' using 1:2 w l ls 1 title 'GRAS-GEU' noenhanced, \
 
set o 'sara.GRAS-GEU.3e3557b4-6663-48e9-990d-b3153e71579a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of GRAS-GEU (3e3557b4-6663-48e9-990d-b3153e71579a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.GRAS-GEU.3e3557b4-6663-48e9-990d-b3153e71579a_Trajectory.txt' using 6:2 w l ls 1 title 'GRAS-GEU' noenhanced
 
