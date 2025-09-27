 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.SADM2-internal.40fdfd8c-e723-4faa-9e1f-5f012fbe443a_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SADM2-internal (40fdfd8c-e723-4faa-9e1f-5f012fbe443a)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.SADM2-internal.40fdfd8c-e723-4faa-9e1f-5f012fbe443a_Trajectory.txt' using 1:2 w l ls 1 title 'SADM2-internal' noenhanced, \
 
set o 'sara.SADM2-internal.40fdfd8c-e723-4faa-9e1f-5f012fbe443a_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SADM2-internal (40fdfd8c-e723-4faa-9e1f-5f012fbe443a)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.SADM2-internal.40fdfd8c-e723-4faa-9e1f-5f012fbe443a_Trajectory.txt' using 6:2 w l ls 1 title 'SADM2-internal' noenhanced
 
