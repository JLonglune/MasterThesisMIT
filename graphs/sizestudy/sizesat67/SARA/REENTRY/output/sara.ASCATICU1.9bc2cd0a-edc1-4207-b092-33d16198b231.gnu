 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATICU1.9bc2cd0a-edc1-4207-b092-33d16198b231_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATICU1 (9bc2cd0a-edc1-4207-b092-33d16198b231)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATICU1.9bc2cd0a-edc1-4207-b092-33d16198b231_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATICU1' noenhanced, \
 
set o 'sara.ASCATICU1.9bc2cd0a-edc1-4207-b092-33d16198b231_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATICU1 (9bc2cd0a-edc1-4207-b092-33d16198b231)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATICU1.9bc2cd0a-edc1-4207-b092-33d16198b231_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATICU1' noenhanced
 
