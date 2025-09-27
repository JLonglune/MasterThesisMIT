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
#               gnuplot driver file -PySara.Pf_1D-Fragment-13d8ee2c-01e2-4ab1-9e89-340e96614479.gnu-  
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
 																				
set title "DRAMA-SERAM\nglobal fatality prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-13d8ee2c-01e2-4ab1-9e89-340e96614479"															
set ylabel 'Fatality Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pf_1D-Fragment-13d8ee2c-01e2-4ab1-9e89-340e96614479.png'														
plot 'PySara.Risk-Fragment-13d8ee2c-01e2-4ab1-9e89-340e96614479.dat' u 1:4 w boxes lt 01 lw 01 notitle	

