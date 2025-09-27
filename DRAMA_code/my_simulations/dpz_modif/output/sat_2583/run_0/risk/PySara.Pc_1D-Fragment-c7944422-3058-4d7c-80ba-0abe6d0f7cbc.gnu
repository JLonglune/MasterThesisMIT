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
#               gnuplot driver file -PySara.Pc_1D-Fragment-c7944422-3058-4d7c-80ba-0abe6d0f7cbc.gnu-  
#                           runID: PySara				   
#                   run date+time: mer., mai 21 2025 16:06:59			   
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
 																				
set title "DRAMA-SERAM\nglobal casualty prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-c7944422-3058-4d7c-80ba-0abe6d0f7cbc"															
set ylabel 'Casualty Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pc_1D-Fragment-c7944422-3058-4d7c-80ba-0abe6d0f7cbc.png'														
plot 'PySara.Risk-Fragment-c7944422-3058-4d7c-80ba-0abe6d0f7cbc.dat' u 1:3 w boxes lt 01 lw 01 notitle	

