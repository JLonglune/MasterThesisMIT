reset
set datafile separator whitespace
set term png size 960,480

set o 'sara.AltitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid

set key font ",7"
set key below 
set title 'Altitude vs Time of all Objects'noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' pt 1 ps 3

plot \
'sara.new_object.40fcaa52-cb5f-43dd-a085-849770dd754d_Trajectory.txt' using 1:2 w l lw 3 title 'new_object' noenhanced, \
 
