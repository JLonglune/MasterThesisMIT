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
#               gnuplot driver file -PySara.Pc_1D-Fragment-245acbc8-c195-45d0-a214-9898b52d5b5c.gnu-  
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
 																				
set title "DRAMA-SERAM\nglobal casualty prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-245acbc8-c195-45d0-a214-9898b52d5b5c"															
set ylabel 'Casualty Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pc_1D-Fragment-245acbc8-c195-45d0-a214-9898b52d5b5c.png'														
plot 'PySara.Risk-Fragment-245acbc8-c195-45d0-a214-9898b52d5b5c.dat' u 1:3 w boxes lt 01 lw 01 notitle	

