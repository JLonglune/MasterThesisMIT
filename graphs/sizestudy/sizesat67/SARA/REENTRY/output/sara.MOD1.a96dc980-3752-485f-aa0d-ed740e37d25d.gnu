 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.MOD1.a96dc980-3752-485f-aa0d-ed740e37d25d_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MOD1 (a96dc980-3752-485f-aa0d-ed740e37d25d)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.MOD1.a96dc980-3752-485f-aa0d-ed740e37d25d_Trajectory.txt' using 1:2 w l ls 1 title 'MOD1' noenhanced, \
 
set o 'sara.MOD1.a96dc980-3752-485f-aa0d-ed740e37d25d_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MOD1 (a96dc980-3752-485f-aa0d-ed740e37d25d)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.MOD1.a96dc980-3752-485f-aa0d-ed740e37d25d_Trajectory.txt' using 6:2 w l ls 1 title 'MOD1' noenhanced
 
