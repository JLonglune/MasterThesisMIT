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
set output 'ares.far.png'
set logscale x
set title "  DRAMA\n  Assessment of Risk Event Statistics\nFalse Alarm Rate vs. Accepted Collision Probability Level"
set xlabel 'Accepted Collision Probability Level'
set ylabel 'False Alarm Rate'
plot 'ares.far'         using 1:($9) title 'False Alarm Rate'
