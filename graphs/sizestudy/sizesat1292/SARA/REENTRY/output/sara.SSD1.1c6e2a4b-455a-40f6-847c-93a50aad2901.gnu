 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SSD1.1c6e2a4b-455a-40f6-847c-93a50aad2901_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SSD1 (1c6e2a4b-455a-40f6-847c-93a50aad2901)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SSD1.1c6e2a4b-455a-40f6-847c-93a50aad2901_Trajectory.txt' using 1:2 w l ls 1 title 'SSD1' noenhanced, \
 
set o 'sara.SSD1.1c6e2a4b-455a-40f6-847c-93a50aad2901_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SSD1 (1c6e2a4b-455a-40f6-847c-93a50aad2901)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SSD1.1c6e2a4b-455a-40f6-847c-93a50aad2901_Trajectory.txt' using 6:2 w l ls 1 title 'SSD1' noenhanced
 
