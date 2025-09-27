 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.EPC2.c1df8c05-4d71-4dac-890b-8dfe07faebfd_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of EPC2 (c1df8c05-4d71-4dac-890b-8dfe07faebfd)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.EPC2.c1df8c05-4d71-4dac-890b-8dfe07faebfd_Trajectory.txt' using 1:2 w l ls 1 title 'EPC2' noenhanced, \
 
set o 'sara.EPC2.c1df8c05-4d71-4dac-890b-8dfe07faebfd_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of EPC2 (c1df8c05-4d71-4dac-890b-8dfe07faebfd)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.EPC2.c1df8c05-4d71-4dac-890b-8dfe07faebfd_Trajectory.txt' using 6:2 w l ls 1 title 'EPC2' noenhanced
 
