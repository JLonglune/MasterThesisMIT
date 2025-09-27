 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATHRS.e451289e-5733-4b98-b37f-782c24ac28c2_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATHRS (e451289e-5733-4b98-b37f-782c24ac28c2)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATHRS.e451289e-5733-4b98-b37f-782c24ac28c2_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATHRS' noenhanced, \
 
set o 'sara.ASCATHRS.e451289e-5733-4b98-b37f-782c24ac28c2_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATHRS (e451289e-5733-4b98-b37f-782c24ac28c2)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATHRS.e451289e-5733-4b98-b37f-782c24ac28c2_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATHRS' noenhanced
 
