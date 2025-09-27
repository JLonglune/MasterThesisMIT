 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.BEG3.8a639930-64e9-49bd-bfb1-92dce15aa113_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BEG3 (8a639930-64e9-49bd-bfb1-92dce15aa113)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.BEG3.8a639930-64e9-49bd-bfb1-92dce15aa113_Trajectory.txt' using 1:2 w l ls 1 title 'BEG3' noenhanced, \
 
set o 'sara.BEG3.8a639930-64e9-49bd-bfb1-92dce15aa113_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BEG3 (8a639930-64e9-49bd-bfb1-92dce15aa113)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.BEG3.8a639930-64e9-49bd-bfb1-92dce15aa113_Trajectory.txt' using 6:2 w l ls 1 title 'BEG3' noenhanced
 
