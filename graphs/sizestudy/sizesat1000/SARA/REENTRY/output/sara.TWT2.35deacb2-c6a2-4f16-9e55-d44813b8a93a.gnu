 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.TWT2.35deacb2-c6a2-4f16-9e55-d44813b8a93a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of TWT2 (35deacb2-c6a2-4f16-9e55-d44813b8a93a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.TWT2.35deacb2-c6a2-4f16-9e55-d44813b8a93a_Trajectory.txt' using 1:2 w l ls 1 title 'TWT2' noenhanced, \
 
set o 'sara.TWT2.35deacb2-c6a2-4f16-9e55-d44813b8a93a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of TWT2 (35deacb2-c6a2-4f16-9e55-d44813b8a93a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.TWT2.35deacb2-c6a2-4f16-9e55-d44813b8a93a_Trajectory.txt' using 6:2 w l ls 1 title 'TWT2' noenhanced
 
