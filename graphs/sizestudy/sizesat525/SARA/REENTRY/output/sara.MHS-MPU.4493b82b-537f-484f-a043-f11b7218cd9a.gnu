 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.MHS-MPU.4493b82b-537f-484f-a043-f11b7218cd9a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of MHS-MPU (4493b82b-537f-484f-a043-f11b7218cd9a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.MHS-MPU.4493b82b-537f-484f-a043-f11b7218cd9a_Trajectory.txt' using 1:2 w l ls 1 title 'MHS-MPU' noenhanced, \
 
set o 'sara.MHS-MPU.4493b82b-537f-484f-a043-f11b7218cd9a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of MHS-MPU (4493b82b-537f-484f-a043-f11b7218cd9a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.MHS-MPU.4493b82b-537f-484f-a043-f11b7218cd9a_Trajectory.txt' using 6:2 w l ls 1 title 'MHS-MPU' noenhanced
 
