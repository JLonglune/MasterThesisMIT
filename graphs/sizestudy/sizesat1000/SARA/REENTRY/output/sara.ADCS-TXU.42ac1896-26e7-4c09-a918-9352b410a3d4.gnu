 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ADCS-TXU.42ac1896-26e7-4c09-a918-9352b410a3d4_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ADCS-TXU (42ac1896-26e7-4c09-a918-9352b410a3d4)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ADCS-TXU.42ac1896-26e7-4c09-a918-9352b410a3d4_Trajectory.txt' using 1:2 w l ls 1 title 'ADCS-TXU' noenhanced, \
 
set o 'sara.ADCS-TXU.42ac1896-26e7-4c09-a918-9352b410a3d4_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ADCS-TXU (42ac1896-26e7-4c09-a918-9352b410a3d4)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ADCS-TXU.42ac1896-26e7-4c09-a918-9352b410a3d4_Trajectory.txt' using 6:2 w l ls 1 title 'ADCS-TXU' noenhanced
 
