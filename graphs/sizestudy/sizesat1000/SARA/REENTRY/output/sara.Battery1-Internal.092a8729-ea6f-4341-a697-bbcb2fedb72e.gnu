 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.Battery1-Internal.092a8729-ea6f-4341-a697-bbcb2fedb72e_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery1-Internal (092a8729-ea6f-4341-a697-bbcb2fedb72e)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.Battery1-Internal.092a8729-ea6f-4341-a697-bbcb2fedb72e_Trajectory.txt' using 1:2 w l ls 1 title 'Battery1-Internal' noenhanced, \
 
set o 'sara.Battery1-Internal.092a8729-ea6f-4341-a697-bbcb2fedb72e_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery1-Internal (092a8729-ea6f-4341-a697-bbcb2fedb72e)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.Battery1-Internal.092a8729-ea6f-4341-a697-bbcb2fedb72e_Trajectory.txt' using 6:2 w l ls 1 title 'Battery1-Internal' noenhanced
 
