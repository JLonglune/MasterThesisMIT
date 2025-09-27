 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.H-SSPA2.bf96a4c3-9391-4af4-8dab-12202b581e79_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of H-SSPA2 (bf96a4c3-9391-4af4-8dab-12202b581e79)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.H-SSPA2.bf96a4c3-9391-4af4-8dab-12202b581e79_Trajectory.txt' using 1:2 w l ls 1 title 'H-SSPA2' noenhanced, \
 
set o 'sara.H-SSPA2.bf96a4c3-9391-4af4-8dab-12202b581e79_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of H-SSPA2 (bf96a4c3-9391-4af4-8dab-12202b581e79)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.H-SSPA2.bf96a4c3-9391-4af4-8dab-12202b581e79_Trajectory.txt' using 6:2 w l ls 1 title 'H-SSPA2' noenhanced
 
