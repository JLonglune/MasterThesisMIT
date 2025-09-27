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
#               gnuplot driver file -PySara.Pi_1D-Fragment-f782f6c0-7963-417e-80c3-16d9fcda0a37.gnu-  
#                           runID: PySara				   
#                   run date+time: mer., mai 21 2025 16:29:59			   
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
 																				
set title "DRAMA-SERAM\nglobal impact prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-f782f6c0-7963-417e-80c3-16d9fcda0a37"															
set ylabel 'Impact Prob.[-]'											
set yrange[0:] 
set ytics nomirror																
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pi_1D-Fragment-f782f6c0-7963-417e-80c3-16d9fcda0a37.png'														
plot 'PySara.Risk-Fragment-f782f6c0-7963-417e-80c3-16d9fcda0a37.dat' u 1:2 w boxes lt 01 lw 01 notitle	

