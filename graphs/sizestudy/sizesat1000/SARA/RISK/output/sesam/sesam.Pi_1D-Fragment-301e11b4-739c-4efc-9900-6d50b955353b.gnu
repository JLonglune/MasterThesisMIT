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
#               gnuplot driver file -sesam.Pi_1D-Fragment-301e11b4-739c-4efc-9900-6d50b955353b.gnu-  
#                           runID: sesam				   
#                   run date+time: jeu., févr. 20 2025 14:11:39			   
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
set boxwidth 0.001 
 																				
set title "DRAMA-SERAM\nglobal impact prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: sesam\n Results: Fragment-301e11b4-739c-4efc-9900-6d50b955353b"															
set ylabel 'Impact Prob.[-]'											
set yrange[0:] 
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'sesam.Pi_1D-Fragment-301e11b4-739c-4efc-9900-6d50b955353b.png'														
plot 'sesam.Risk-Fragment-301e11b4-739c-4efc-9900-6d50b955353b.dat' u 1:2 w boxes lt 01 lw 01 notitle	

