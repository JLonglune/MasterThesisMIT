#ARES 3.1.1 driver file
reset
set noclip points
set clip one
set noclip two
set format x '%g'
set format y '%g'
set format z '%g'
set nogrid
set key below Left reverse
set noarrow
set offsets 0, 0, 0, 0
set angles degrees
set noparametric
set view 60, 30, 1, 1
set surface
set nopolar
set nocontour
set hidden3d
set cntrparam order 4
set cntrparam linear
set cntrparam points 5
set style data linespoints
set tics in
set ticslevel 0.05
set xtics
set ytics
set ztics
set notime
set autoscale x
set autoscale y
set autoscale z
set title offset -5,0
set border
set terminal png       
set output 'ares.dv.png'
set title "  DRAMA\n  Assessment of Risk Event Statistics\nDelta-Velocity"
set xlabel 'Number of Revs. for long- and short-term strategy'
set ylabel 'Required Delta-V (m/s)'
set logscale y
plot 'ares.dv'          using 1:($2) title 'ACPL =1.0000E-06', \
     'ares.dv'          using 1:($3) title 'ACPL =1.0000E-05', \
     'ares.dv'          using 1:($4) title 'ACPL =5.0000E-05', \
     'ares.dv'          using 1:($5) title 'ACPL =8.0000E-05', \
     'ares.dv'          using 1:($6) title 'ACPL =1.0000E-04', \
     'ares.dv'          using 1:($7) title 'ACPL =4.0000E-04', \
     'ares.dv'          using 1:($8) title 'ACPL =5.0000E-04', \
     'ares.dv'          using 1:($9) title 'ACPL =1.0000E-03', \
     'ares.dv'          using 1:($10) title 'ACPL =1.5000E-03', \
     'ares.dv'          using 1:($11) title 'ACPL =1.0000E-02'
