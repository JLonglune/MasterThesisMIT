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
#               gnuplot driver file -sara.Pi_1D-Fragment-a6bfcbfa-60aa-4e7a-bf6f-ed921bdc8db6.gnu-  
#                           runID: sara				   
#                   run date+time: mer., avr. 23 2025 17:53:04			   
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
 																				
set title "DRAMA-SERAM\nglobal impact prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: sara\n Results: Fragment-a6bfcbfa-60aa-4e7a-bf6f-ed921bdc8db6"															
set ylabel 'Impact Prob.[-]'											
set yrange[0:] 
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'sara.Pi_1D-Fragment-a6bfcbfa-60aa-4e7a-bf6f-ed921bdc8db6.png'														
plot 'sara.Risk-Fragment-a6bfcbfa-60aa-4e7a-bf6f-ed921bdc8db6.dat' u 1:2 w boxes lt 01 lw 01 notitle	

