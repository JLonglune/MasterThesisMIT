 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of case3_hollow (8ef60be4-b279-4819-a3aa-6de0e10d8ae7)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt' using 1:2 w l ls 1 title 'case3_hollow' noenhanced, \
 
set o 'sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of case3_hollow (8ef60be4-b279-4819-a3aa-6de0e10d8ae7)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt' using 6:2 w l ls 1 title 'case3_hollow' noenhanced
 
