 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RFCU4.17647099-9fb9-40b7-806d-bf0f8fac8fec_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RFCU4 (17647099-9fb9-40b7-806d-bf0f8fac8fec)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RFCU4.17647099-9fb9-40b7-806d-bf0f8fac8fec_Trajectory.txt' using 1:2 w l ls 1 title 'RFCU4' noenhanced, \
 
set o 'sara.RFCU4.17647099-9fb9-40b7-806d-bf0f8fac8fec_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RFCU4 (17647099-9fb9-40b7-806d-bf0f8fac8fec)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RFCU4.17647099-9fb9-40b7-806d-bf0f8fac8fec_Trajectory.txt' using 6:2 w l ls 1 title 'RFCU4' noenhanced
 
