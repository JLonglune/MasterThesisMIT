 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.DPU-SEM.689791a9-de13-4150-8f6a-c50e8cb6905a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of DPU-SEM (689791a9-de13-4150-8f6a-c50e8cb6905a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.DPU-SEM.689791a9-de13-4150-8f6a-c50e8cb6905a_Trajectory.txt' using 1:2 w l ls 1 title 'DPU-SEM' noenhanced, \
 
set o 'sara.DPU-SEM.689791a9-de13-4150-8f6a-c50e8cb6905a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of DPU-SEM (689791a9-de13-4150-8f6a-c50e8cb6905a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.DPU-SEM.689791a9-de13-4150-8f6a-c50e8cb6905a_Trajectory.txt' using 6:2 w l ls 1 title 'DPU-SEM' noenhanced
 
