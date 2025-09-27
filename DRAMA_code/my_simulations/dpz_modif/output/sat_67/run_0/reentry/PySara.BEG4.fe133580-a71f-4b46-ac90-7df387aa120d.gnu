 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.BEG4.fe133580-a71f-4b46-ac90-7df387aa120d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of BEG4 (fe133580-a71f-4b46-ac90-7df387aa120d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.BEG4.fe133580-a71f-4b46-ac90-7df387aa120d_Trajectory.txt' using 1:2 w l ls 1 title 'BEG4' noenhanced, \
 
set o 'PySara.BEG4.fe133580-a71f-4b46-ac90-7df387aa120d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of BEG4 (fe133580-a71f-4b46-ac90-7df387aa120d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.BEG4.fe133580-a71f-4b46-ac90-7df387aa120d_Trajectory.txt' using 6:2 w l ls 1 title 'BEG4' noenhanced
 
