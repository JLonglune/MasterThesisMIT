 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.Battery3.e813dbdf-3048-4bd2-9678-4312889d58fe_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of Battery3 (e813dbdf-3048-4bd2-9678-4312889d58fe)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.Battery3.e813dbdf-3048-4bd2-9678-4312889d58fe_Trajectory.txt' using 1:2 w l ls 1 title 'Battery3' noenhanced, \
 
set o 'sara.Battery3.e813dbdf-3048-4bd2-9678-4312889d58fe_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of Battery3 (e813dbdf-3048-4bd2-9678-4312889d58fe)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.Battery3.e813dbdf-3048-4bd2-9678-4312889d58fe_Trajectory.txt' using 6:2 w l ls 1 title 'Battery3' noenhanced
 
