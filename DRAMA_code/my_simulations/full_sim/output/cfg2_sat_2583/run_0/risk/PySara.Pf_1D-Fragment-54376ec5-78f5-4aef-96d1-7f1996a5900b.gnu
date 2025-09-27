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
#               gnuplot driver file -PySara.Pf_1D-Fragment-54376ec5-78f5-4aef-96d1-7f1996a5900b.gnu-  
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
 																				
set title "DRAMA-SERAM\nglobal fatality prob. for an uncontrolled, latitude-band-limited re-entry \nrun ID: PySara\n Results: Fragment-54376ec5-78f5-4aef-96d1-7f1996a5900b"															
set ylabel 'Fatality Prob.[-]'											
set ytics nomirror																
set yrange[0:] 
set mytics 4																		
set format y '%.1te%+02T'														
set output 'PySara.Pf_1D-Fragment-54376ec5-78f5-4aef-96d1-7f1996a5900b.png'														
plot 'PySara.Risk-Fragment-54376ec5-78f5-4aef-96d1-7f1996a5900b.dat' u 1:4 w boxes lt 01 lw 01 notitle	

