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
#               gnuplot driver file -PySara.Impact-Locations2D.gnu-  
#                           runID: PySara				   
#                   run date+time: lun., mai 19 2025 12:19:21			   
#_______________________________________________________________________________
# 
 
reset

# png
set terminal png size 1200, 900

# color definitions
set border 

unset key

# axes and title formatation
set xlabel "Lon [deg]    "
set format x "%+-3.0f"
set ylabel "    Lat [deg]"
set format y "%+-2.0f"
set zlabel "Alt [km]    "
set format z "%+-3.0f"
set ticslevel 0
set view 55,30,1,1.1
set grid xtics ytics 
show grid

set title "DRAMA-SERAM\n\
debris impact locations for a known (controlled) re-entry state\n\
run ID: PySara  "

LonMid =  60.0
LatMid =  0.0
LonWin =  360.0
LonTic =  60.0
LatWin =  180.0
LatTic =  30.0
LonLimW = LonMid-LonWin/2.0
LonLimE = LonMid+LonWin/2.0
LatLimS = LatMid-LatWin/2.0
LatLimN = LatMid+LatWin/2.0
set xrange [LonLimW:LonLimE]
set xtics  LonLimW,LonTic,LonLimE
set yrange [LatLimS:LatLimN]
set ytics  LatLimS,LatTic,LatLimN

# plotting in different resolutions
set output 'PySara.Impact-Locations2D.png'
plot \
'/Applications/DRAMA-3.1.1/TOOLS/SARA/RISK/data/shores.plt' with l lt -1 lw 1,\
'PySara.Impact-Locations.dat' using 2:1 with points pt 1 ps 2 lw 2 lt 1

