 
set datafile separator whitespace
set term png size 960,480
 
set o 'PySara.IASI-IMS.2820083a-a07a-4a45-8a91-ae1aeb026ab8_altitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Time of IASI-IMS (2820083a-a07a-4a45-8a91-ae1aeb026ab8)' noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' lw 3 pt 1 ps 3
 
plot 'PySara.IASI-IMS.2820083a-a07a-4a45-8a91-ae1aeb026ab8_Trajectory.txt' using 1:2 w l ls 1 title 'IASI-IMS' noenhanced, \
 
set o 'PySara.IASI-IMS.2820083a-a07a-4a45-8a91-ae1aeb026ab8_altitudeVsDownrange.png'
set size 1,1 
set origin 0,0
set grid
 
set key font ",14"
set title 'Altitude vs Downrange of IASI-IMS (2820083a-a07a-4a45-8a91-ae1aeb026ab8)' noenhanced font ",14"
set xlabel 'Downrange [Km]' font ",14"
set ylabel 'Altitude [Km]' font ",14"
set tics font ",14"
 
plot 'PySara.IASI-IMS.2820083a-a07a-4a45-8a91-ae1aeb026ab8_Trajectory.txt' using 6:2 w l ls 1 title 'IASI-IMS' noenhanced
 
