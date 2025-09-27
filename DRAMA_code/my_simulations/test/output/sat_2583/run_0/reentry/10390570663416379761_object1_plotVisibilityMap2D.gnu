reset
set term png size 300,480
set output '10390570663416379761_object1_VisibilityMap.png'
set ylabel 'Angle of Attack'
set xlabel 'Angle of Side Slip'
set cblabel 'Visibility Fraction'
set title 'PLM' noenhanced 
set pm3d map
set cbrange [0:1]
splot '10390570663416379761_object1.dat' using ($2/3.141592*180):($1/3.141592*180):3 title ''
