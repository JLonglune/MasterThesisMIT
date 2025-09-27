 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SSR.04515579-e5af-4cce-9bd7-ef29afced2c5_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SSR (04515579-e5af-4cce-9bd7-ef29afced2c5)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SSR.04515579-e5af-4cce-9bd7-ef29afced2c5_Trajectory.txt' using 1:2 w l ls 1 title 'SSR' noenhanced, \
 
set o 'PySara.SSR.04515579-e5af-4cce-9bd7-ef29afced2c5_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SSR (04515579-e5af-4cce-9bd7-ef29afced2c5)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SSR.04515579-e5af-4cce-9bd7-ef29afced2c5_Trajectory.txt' using 6:2 w l ls 1 title 'SSR' noenhanced
 
