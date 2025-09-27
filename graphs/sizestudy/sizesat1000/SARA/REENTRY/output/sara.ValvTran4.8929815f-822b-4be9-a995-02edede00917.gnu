 
set datafile separator whitespace
set term png size 960,480
 
set o 'sara.ValvTran4.8929815f-822b-4be9-a995-02edede00917_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of ValvTran4 (8929815f-822b-4be9-a995-02edede00917)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'sara.ValvTran4.8929815f-822b-4be9-a995-02edede00917_Trajectory.txt' using 1:2 w l ls 1 title 'ValvTran4' noenhanced, \
 
set o 'sara.ValvTran4.8929815f-822b-4be9-a995-02edede00917_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of ValvTran4 (8929815f-822b-4be9-a995-02edede00917)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'sara.ValvTran4.8929815f-822b-4be9-a995-02edede00917_Trajectory.txt' using 6:2 w l ls 1 title 'ValvTran4' noenhanced
 
