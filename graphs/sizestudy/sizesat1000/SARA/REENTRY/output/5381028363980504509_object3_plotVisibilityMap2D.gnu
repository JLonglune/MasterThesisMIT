reset
set term png size 300,480
set output '5381028363980504509_object3_VisibilityMap.png'
set ylabel 'Angle of Attack'
set xlabel 'Angle of Side Slip'
set cblabel 'Visibility Fraction'
set title 'SolarP' noenhanced 
set pm3d map
set cbrange [0:1]
splot '5381028363980504509_object3.dat' using ($2/3.141592*180):($1/3.141592*180):3 title ''
