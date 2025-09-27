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
#               gnuplot driver file -sara.Pi_1D-Fragment-7f7f274b-035d-4fd6-b84f-925bb3aa22a8.gnu-  
#                           runID: sara				   
#                   run date+time: lun., avr. 07 2025 09:57:30			   
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
 																				
set title "DRAMA-SERAM\nglobal impact prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: sara\n Results: Fragment-7f7f274b-035d-4fd6-b84f-925bb3aa22a8"															
set ylabel 'Impact Prob.[-]'											
set yrange[0:] 
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'sara.Pi_1D-Fragment-7f7f274b-035d-4fd6-b84f-925bb3aa22a8.png'														
plot 'sara.Risk-Fragment-7f7f274b-035d-4fd6-b84f-925bb3aa22a8.dat' u 1:2 w boxes lt 01 lw 01 notitle	

