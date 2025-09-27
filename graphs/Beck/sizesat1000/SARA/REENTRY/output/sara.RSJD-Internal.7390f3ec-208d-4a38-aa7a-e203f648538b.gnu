 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.RSJD-Internal.7390f3ec-208d-4a38-aa7a-e203f648538b_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of RSJD-Internal (7390f3ec-208d-4a38-aa7a-e203f648538b)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.RSJD-Internal.7390f3ec-208d-4a38-aa7a-e203f648538b_Trajectory.txt' using 1:2 w l ls 1 title 'RSJD-Internal' noenhanced, \
 
set o 'sara.RSJD-Internal.7390f3ec-208d-4a38-aa7a-e203f648538b_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of RSJD-Internal (7390f3ec-208d-4a38-aa7a-e203f648538b)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.RSJD-Internal.7390f3ec-208d-4a38-aa7a-e203f648538b_Trajectory.txt' using 6:2 w l ls 1 title 'RSJD-Internal' noenhanced
 
