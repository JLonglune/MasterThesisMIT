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
#               gnuplot driver file -PySara.Pi_1D-Fragment-033f7482-d229-4653-8df8-c3666d4d7b38.gnu-  
#                           runID: PySara				   
#                   run date+time: mer., mai 21 2025 16:28:21			   
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
 																				
set title "DRAMA-SERAM\nglobal impact prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-033f7482-d229-4653-8df8-c3666d4d7b38"															
set ylabel 'Impact Prob.[-]'											
set yrange[0:] 
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pi_1D-Fragment-033f7482-d229-4653-8df8-c3666d4d7b38.png'														
plot 'PySara.Risk-Fragment-033f7482-d229-4653-8df8-c3666d4d7b38.dat' u 1:2 w boxes lt 01 lw 01 notitle	

