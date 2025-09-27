 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SAR-Rx.7e04c61e-3319-481b-af18-815f518ca060_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAR-Rx (7e04c61e-3319-481b-af18-815f518ca060)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SAR-Rx.7e04c61e-3319-481b-af18-815f518ca060_Trajectory.txt' using 1:2 w l ls 1 title 'SAR-Rx' noenhanced, \
 
set o 'sara.SAR-Rx.7e04c61e-3319-481b-af18-815f518ca060_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAR-Rx (7e04c61e-3319-481b-af18-815f518ca060)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SAR-Rx.7e04c61e-3319-481b-af18-815f518ca060_Trajectory.txt' using 6:2 w l ls 1 title 'SAR-Rx' noenhanced
 
