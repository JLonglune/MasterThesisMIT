 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ASCATDPU1.50b225ea-27a3-4948-ba7e-9eb0aaa2833f_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ASCATDPU1 (50b225ea-27a3-4948-ba7e-9eb0aaa2833f)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ASCATDPU1.50b225ea-27a3-4948-ba7e-9eb0aaa2833f_Trajectory.txt' using 1:2 w l ls 1 title 'ASCATDPU1' noenhanced, \
 
set o 'sara.ASCATDPU1.50b225ea-27a3-4948-ba7e-9eb0aaa2833f_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ASCATDPU1 (50b225ea-27a3-4948-ba7e-9eb0aaa2833f)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ASCATDPU1.50b225ea-27a3-4948-ba7e-9eb0aaa2833f_Trajectory.txt' using 6:2 w l ls 1 title 'ASCATDPU1' noenhanced
 
