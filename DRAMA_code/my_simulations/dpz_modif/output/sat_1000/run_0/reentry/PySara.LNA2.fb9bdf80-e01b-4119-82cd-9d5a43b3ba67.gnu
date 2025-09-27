 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.LNA2.fb9bdf80-e01b-4119-82cd-9d5a43b3ba67_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of LNA2 (fb9bdf80-e01b-4119-82cd-9d5a43b3ba67)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.LNA2.fb9bdf80-e01b-4119-82cd-9d5a43b3ba67_Trajectory.txt' using 1:2 w l ls 1 title 'LNA2' noenhanced, \
 
set o 'PySara.LNA2.fb9bdf80-e01b-4119-82cd-9d5a43b3ba67_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of LNA2 (fb9bdf80-e01b-4119-82cd-9d5a43b3ba67)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.LNA2.fb9bdf80-e01b-4119-82cd-9d5a43b3ba67_Trajectory.txt' using 6:2 w l ls 1 title 'LNA2' noenhanced
 
