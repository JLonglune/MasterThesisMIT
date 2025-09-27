 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.IASI-DPS.bbf22be4-2b2e-485c-afb6-40ee990bc60c_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of IASI-DPS (bbf22be4-2b2e-485c-afb6-40ee990bc60c)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.IASI-DPS.bbf22be4-2b2e-485c-afb6-40ee990bc60c_Trajectory.txt' using 1:2 w l ls 1 title 'IASI-DPS' noenhanced, \
 
set o 'PySara.IASI-DPS.bbf22be4-2b2e-485c-afb6-40ee990bc60c_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of IASI-DPS (bbf22be4-2b2e-485c-afb6-40ee990bc60c)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.IASI-DPS.bbf22be4-2b2e-485c-afb6-40ee990bc60c_Trajectory.txt' using 6:2 w l ls 1 title 'IASI-DPS' noenhanced
 
