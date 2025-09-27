 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.MOD2.f5312407-e791-4f4d-a167-74a567287a2c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MOD2 (f5312407-e791-4f4d-a167-74a567287a2c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.MOD2.f5312407-e791-4f4d-a167-74a567287a2c_Trajectory.txt' using 1:2 w l ls 1 title 'MOD2' noenhanced, \
 
set o 'PySara.MOD2.f5312407-e791-4f4d-a167-74a567287a2c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MOD2 (f5312407-e791-4f4d-a167-74a567287a2c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.MOD2.f5312407-e791-4f4d-a167-74a567287a2c_Trajectory.txt' using 6:2 w l ls 1 title 'MOD2' noenhanced
 
