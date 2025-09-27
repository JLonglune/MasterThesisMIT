reset
set term png size 300,480
set output '12925668035829144937_object2_VisibilityMap.png'
set ylabel 'Angle of Attack'
set xlabel 'Angle of Side Slip'
set cblabel 'Visibility Fraction'
set title 'SVM' noenhanced 
set pm3d map
set cbrange [0:1]
splot '12925668035829144937_object2.dat' using ($2/3.141592*180):($1/3.141592*180):3 title ''
