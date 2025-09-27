 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EAIM.049e68a2-6063-4a2e-b6f1-5aa39107fb56_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EAIM (049e68a2-6063-4a2e-b6f1-5aa39107fb56)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EAIM.049e68a2-6063-4a2e-b6f1-5aa39107fb56_Trajectory.txt' using 1:2 w l ls 1 title 'EAIM' noenhanced, \
 
set o 'sara.EAIM.049e68a2-6063-4a2e-b6f1-5aa39107fb56_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EAIM (049e68a2-6063-4a2e-b6f1-5aa39107fb56)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EAIM.049e68a2-6063-4a2e-b6f1-5aa39107fb56_Trajectory.txt' using 6:2 w l ls 1 title 'EAIM' noenhanced
 
