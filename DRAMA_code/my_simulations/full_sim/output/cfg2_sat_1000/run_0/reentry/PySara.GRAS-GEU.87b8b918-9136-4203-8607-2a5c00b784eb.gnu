 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.GRAS-GEU.87b8b918-9136-4203-8607-2a5c00b784eb_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of GRAS-GEU (87b8b918-9136-4203-8607-2a5c00b784eb)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.GRAS-GEU.87b8b918-9136-4203-8607-2a5c00b784eb_Trajectory.txt' using 1:2 w l ls 1 title 'GRAS-GEU' noenhanced, \
 
set o 'PySara.GRAS-GEU.87b8b918-9136-4203-8607-2a5c00b784eb_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of GRAS-GEU (87b8b918-9136-4203-8607-2a5c00b784eb)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.GRAS-GEU.87b8b918-9136-4203-8607-2a5c00b784eb_Trajectory.txt' using 6:2 w l ls 1 title 'GRAS-GEU' noenhanced
 
