 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ADCS-RPU.6be146fd-6b3d-48d2-8140-ddc02a7b864d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ADCS-RPU (6be146fd-6b3d-48d2-8140-ddc02a7b864d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ADCS-RPU.6be146fd-6b3d-48d2-8140-ddc02a7b864d_Trajectory.txt' using 1:2 w l ls 1 title 'ADCS-RPU' noenhanced, \
 
set o 'sara.ADCS-RPU.6be146fd-6b3d-48d2-8140-ddc02a7b864d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ADCS-RPU (6be146fd-6b3d-48d2-8140-ddc02a7b864d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ADCS-RPU.6be146fd-6b3d-48d2-8140-ddc02a7b864d_Trajectory.txt' using 6:2 w l ls 1 title 'ADCS-RPU' noenhanced
 
