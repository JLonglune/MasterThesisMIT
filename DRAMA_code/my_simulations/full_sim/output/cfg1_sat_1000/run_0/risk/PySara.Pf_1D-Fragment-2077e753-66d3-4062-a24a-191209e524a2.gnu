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
#               gnuplot driver file -PySara.Pf_1D-Fragment-2077e753-66d3-4062-a24a-191209e524a2.gnu-  
#                           runID: PySara				   
#                   run date+time: mer., mai 21 2025 16:27:46			   
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
 																				
set title "DRAMA-SERAM\nglobal fatality prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-2077e753-66d3-4062-a24a-191209e524a2"															
set ylabel 'Fatality Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pf_1D-Fragment-2077e753-66d3-4062-a24a-191209e524a2.png'														
plot 'PySara.Risk-Fragment-2077e753-66d3-4062-a24a-191209e524a2.dat' u 1:4 w boxes lt 01 lw 01 notitle	

