 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.Ribpanel5.a9a97325-9930-4a15-bcb7-d35ddc54f136_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Ribpanel5 (a9a97325-9930-4a15-bcb7-d35ddc54f136)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.Ribpanel5.a9a97325-9930-4a15-bcb7-d35ddc54f136_Trajectory.txt' using 1:2 w l ls 1 title 'Ribpanel5' noenhanced, \
 
set o 'PySara.Ribpanel5.a9a97325-9930-4a15-bcb7-d35ddc54f136_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Ribpanel5 (a9a97325-9930-4a15-bcb7-d35ddc54f136)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.Ribpanel5.a9a97325-9930-4a15-bcb7-d35ddc54f136_Trajectory.txt' using 6:2 w l ls 1 title 'Ribpanel5' noenhanced
 
