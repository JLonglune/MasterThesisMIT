 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.MHS-DBU.af9ae746-0675-4333-8b05-8e932cd4c1b0_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MHS-DBU (af9ae746-0675-4333-8b05-8e932cd4c1b0)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.MHS-DBU.af9ae746-0675-4333-8b05-8e932cd4c1b0_Trajectory.txt' using 1:2 w l ls 1 title 'MHS-DBU' noenhanced, \
 
set o 'PySara.MHS-DBU.af9ae746-0675-4333-8b05-8e932cd4c1b0_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MHS-DBU (af9ae746-0675-4333-8b05-8e932cd4c1b0)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.MHS-DBU.af9ae746-0675-4333-8b05-8e932cd4c1b0_Trajectory.txt' using 6:2 w l ls 1 title 'MHS-DBU' noenhanced
 
