 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SARP-3-internal.e458bd60-f127-4009-afdd-1f540e3b5ea4_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SARP-3-internal (e458bd60-f127-4009-afdd-1f540e3b5ea4)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SARP-3-internal.e458bd60-f127-4009-afdd-1f540e3b5ea4_Trajectory.txt' using 1:2 w l ls 1 title 'SARP-3-internal' noenhanced, \
 
set o 'sara.SARP-3-internal.e458bd60-f127-4009-afdd-1f540e3b5ea4_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SARP-3-internal (e458bd60-f127-4009-afdd-1f540e3b5ea4)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SARP-3-internal.e458bd60-f127-4009-afdd-1f540e3b5ea4_Trajectory.txt' using 6:2 w l ls 1 title 'SARP-3-internal' noenhanced
 
