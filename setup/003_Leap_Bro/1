# This python script was made to calculate the number of (monovalent) 
# ions needed to add to a volume to reach a desired concentration.
# the volume (in A^3) and desired concentration (in M) are entered as arguments upon usage
# you can find the volume from you leap.log file when solvating your system. 
# Take that volume (in A^3) and enter it here, along with the desired concentration
# (in M)
# python calc_ions.py 722218.313 0.150 
import matplotlib
matplotlib.use('Agg')
import numpy as np
import sys
Vol  = float(1298060.581) #float(sys.argv[1]) # volume from leap in A^3
Conc = float(0.15) #float(sys.argv[2]) # desired salt concentration in M
VolL = Vol * (10**-24) * 0.001 # convert A^3 to L
ions = Conc * VolL * (6.022*10**23) # calculate # of ions needed
print("You need " + str(round(ions)) + " of KCl to reach your concentration of " 
+ str(Conc) + " M in a volume of " + str(Vol) + " A^3.")
