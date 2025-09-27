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
#               gnuplot driver file -sara.Pf_1D-Fragment-3f5a8f7d-39ce-4a62-bb78-f5530384abfa.gnu-  
#                           runID: sara				   
#                   run date+time: mar., avr. 15 2025 16:06:15			   
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
 																				
set title "DRAMA-SERAM\nglobal fatality prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: sara\n Results: Fragment-3f5a8f7d-39ce-4a62-bb78-f5530384abfa"															
set ylabel 'Fatality Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'sara.Pf_1D-Fragment-3f5a8f7d-39ce-4a62-bb78-f5530384abfa.png'														
plot 'sara.Risk-Fragment-3f5a8f7d-39ce-4a62-bb78-f5530384abfa.dat' u 1:4 w boxes lt 01 lw 01 notitle	

