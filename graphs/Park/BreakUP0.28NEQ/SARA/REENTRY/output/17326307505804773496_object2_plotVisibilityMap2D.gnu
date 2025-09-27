reset
set term png size 300,480
set output '17326307505804773496_object2_VisibilityMap.png'
set ylabel 'Angle of Attack'
set xlabel 'Angle of Side Slip'
set cblabel 'Visibility Fraction'
set title 'case4_solid' noenhanced 
set pm3d map
set cbrange [0:1]
splot '17326307505804773496_object2.dat' using ($2/3.141592*180):($1/3.141592*180):3 title ''
