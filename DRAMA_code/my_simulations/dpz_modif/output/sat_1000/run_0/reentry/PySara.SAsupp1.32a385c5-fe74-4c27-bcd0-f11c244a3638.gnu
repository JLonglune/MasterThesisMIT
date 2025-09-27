 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.SAsupp1.32a385c5-fe74-4c27-bcd0-f11c244a3638_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of SAsupp1 (32a385c5-fe74-4c27-bcd0-f11c244a3638)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.SAsupp1.32a385c5-fe74-4c27-bcd0-f11c244a3638_Trajectory.txt' using 1:2 w l ls 1 title 'SAsupp1' noenhanced, \
 
set o 'PySara.SAsupp1.32a385c5-fe74-4c27-bcd0-f11c244a3638_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of SAsupp1 (32a385c5-fe74-4c27-bcd0-f11c244a3638)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.SAsupp1.32a385c5-fe74-4c27-bcd0-f11c244a3638_Trajectory.txt' using 6:2 w l ls 1 title 'SAsupp1' noenhanced
 
