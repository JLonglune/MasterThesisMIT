 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.DPU-SEM.bd7f8fe5-b32a-460c-b396-4790d4115078_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DPU-SEM (bd7f8fe5-b32a-460c-b396-4790d4115078)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.DPU-SEM.bd7f8fe5-b32a-460c-b396-4790d4115078_Trajectory.txt' using 1:2 w l ls 1 title 'DPU-SEM' noenhanced, \
 
set o 'PySara.DPU-SEM.bd7f8fe5-b32a-460c-b396-4790d4115078_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DPU-SEM (bd7f8fe5-b32a-460c-b396-4790d4115078)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.DPU-SEM.bd7f8fe5-b32a-460c-b396-4790d4115078_Trajectory.txt' using 6:2 w l ls 1 title 'DPU-SEM' noenhanced
 
