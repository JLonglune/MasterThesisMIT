reset
set datafile separator whitespace
set term png size 960,480

set o 'sara.AltitudeVsTime.png'
set size 1,1 
set origin 0,0
set grid

set key font ",7"
set key below 
set title 'Altitude vs Time of all Objects'noenhanced font ",14"
set xlabel 'Time [s]' font ",14"
set ylabel 'Altitude [km]' font ",14"
set tics font ",14"
set style line 1 lc rgb 'blue' pt 1 ps 3

plot \
'sara.parent.8cdd1025-8654-431b-96ab-e0b972a7ddd1_Trajectory.txt' using 1:2 w l lw 3 title 'parent' noenhanced, \
'sara.Compound_of-case3_hollow-case4_hollow-case4_solid-case3_solid.4519942503439007991_Trajectory.txt' using 1:2 w l lw 3 title 'Compound' noenhanced, \
'sara.case3_hollow.8ef60be4-b279-4819-a3aa-6de0e10d8ae7_Trajectory.txt' using 1:2 w l lw 3 title 'case3_hollow' noenhanced, \
'sara.case4_hollow.e31cb76b-34e6-4852-9f69-92ea8464d372_Trajectory.txt' using 1:2 w l lw 3 title 'case4_hollow' noenhanced, \
'sara.case4_solid.7f7f274b-035d-4fd6-b84f-925bb3aa22a8_Trajectory.txt' using 1:2 w l lw 3 title 'case4_solid' noenhanced, \
'sara.case3_solid.301c2599-a612-4651-8c17-65d0288fcca2_Trajectory.txt' using 1:2 w l lw 3 title 'case3_solid' noenhanced, \
 
