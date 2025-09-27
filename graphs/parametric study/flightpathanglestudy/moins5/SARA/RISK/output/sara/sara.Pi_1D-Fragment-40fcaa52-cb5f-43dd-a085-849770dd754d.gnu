#_______________________________________________________________________________
#    ######   ####     ##             #####   #####     ##    #    #    ##      
#    #       #        #  #            #    #  #    #   #  #   ##  ##   #  #     
#    #####    ####   ######           #    #  #####   ######  # ## #  ######    
#    #            #  #    #           #    #  #    #  #    #  #    #  #    #    
#____######__#####___#____#___________#####___#____#__#____#__#____#__#____#____
#										   
#           ESA Debris Risk Assessment and Mitigation Analysis Tool             
#                                                                               
#             ---- DRAMA ( Re-entry Risk Analysis v 3.0.0 ) ---- 
#                               ESA July 2024                   
#                                                                               
#               gnuplot driver file -sara.Pi_1D-Fragment-40fcaa52-cb5f-43dd-a085-849770dd754d.gnu-  
#                           runID: sara				   
#                   run date+time: mar., juin 17 2025 19:58:22			   
#_______________________________________________________________________________
# 
 
reset															
set datafile separator ','														
set style data lines															
set term png																
set xlabel 'Lat [deg]'															
set xrange[-95.0:+95.0]									
set xtics nomirror																
set mxtics 4																		
set grid xtics ytics																
show grid																		
 																				
set title "DRAMA-SERAM\nimpact prob. for an uncontrolled re-entry from a near circular orbit \nrun ID: sara\nResults: Fragment-40fcaa52-cb5f-43dd-a085-849770dd754d"															
set ylabel 'Impact Prob.[-]'											
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'sara.Pi_1D-Fragment-40fcaa52-cb5f-43dd-a085-849770dd754d.png'														
plot 'sara.Risk-Fragment-40fcaa52-cb5f-43dd-a085-849770dd754d.dat' u 1:2 w steps lt 01 lw 01 notitle			

