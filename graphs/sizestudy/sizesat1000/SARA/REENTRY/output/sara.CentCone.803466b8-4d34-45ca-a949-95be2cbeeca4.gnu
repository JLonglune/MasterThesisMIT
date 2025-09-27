 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.CentCone.803466b8-4d34-45ca-a949-95be2cbeeca4_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of CentCone (803466b8-4d34-45ca-a949-95be2cbeeca4)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.CentCone.803466b8-4d34-45ca-a949-95be2cbeeca4_Trajectory.txt' using 1:2 w l ls 1 title 'CentCone' noenhanced, \
 
set o 'sara.CentCone.803466b8-4d34-45ca-a949-95be2cbeeca4_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of CentCone (803466b8-4d34-45ca-a949-95be2cbeeca4)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.CentCone.803466b8-4d34-45ca-a949-95be2cbeeca4_Trajectory.txt' using 6:2 w l ls 1 title 'CentCone' noenhanced
 
