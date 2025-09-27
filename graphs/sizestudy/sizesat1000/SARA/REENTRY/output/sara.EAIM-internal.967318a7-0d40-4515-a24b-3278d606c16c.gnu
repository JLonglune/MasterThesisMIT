 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EAIM-internal.967318a7-0d40-4515-a24b-3278d606c16c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EAIM-internal (967318a7-0d40-4515-a24b-3278d606c16c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EAIM-internal.967318a7-0d40-4515-a24b-3278d606c16c_Trajectory.txt' using 1:2 w l ls 1 title 'EAIM-internal' noenhanced, \
 
set o 'sara.EAIM-internal.967318a7-0d40-4515-a24b-3278d606c16c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EAIM-internal (967318a7-0d40-4515-a24b-3278d606c16c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EAIM-internal.967318a7-0d40-4515-a24b-3278d606c16c_Trajectory.txt' using 6:2 w l ls 1 title 'EAIM-internal' noenhanced
 
