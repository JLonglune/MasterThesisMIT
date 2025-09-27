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
#               gnuplot driver file -PySara.Pc_1D-Fragment-3643ab44-f912-4884-babe-b7c09067369a.gnu-  
#                           runID: PySara				   
#                   run date+time: jeu., mai 22 2025 12:08:01			   
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
 																				
set title "DRAMA-SERAM\nglobal casualty prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-3643ab44-f912-4884-babe-b7c09067369a"															
set ylabel 'Casualty Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pc_1D-Fragment-3643ab44-f912-4884-babe-b7c09067369a.png'														
plot 'PySara.Risk-Fragment-3643ab44-f912-4884-babe-b7c09067369a.dat' u 1:3 w boxes lt 01 lw 01 notitle	

