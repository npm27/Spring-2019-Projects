####set up####
##load libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

##read in data
dat = pd.read_csv("CVOE data 8_8.csv")

#make the 95% confidence intervals
dat['diff'] = dat['Upper'].sub(dat['Lower']) #get the length of the bars
dat['diff2'] = dat['diff'].div(2) #length from end of bar to cap

##split the data into RT and Error groups
error_dat = dat[ dat['TYPE'] == "ERROR"]
rt_dat = dat[ dat['TYPE'] == "RT"]

##put errors on a 0-100 percentage scale
error_dat['Average'] = error_dat['Average'].multiply(100) #Disregard the warnings here
error_dat['diff2'] = error_dat['diff2'].multiply(100)

####First lets make the plot for error rates####
##set up the initial plot
error_fig = plt.figure()
error_fig.set_size_inches(6,20) #I'll need to tweak the figure size as I set this thing up

##make the sub plots
##ax1 will be pure vs ns vs s
##ax2 will be local vs global
ax1 = error_fig.add_subplot(2, 1, 1)
ax2 = error_fig.add_subplot(2, 1, 2)

##get the ya, healthy, and MCI subsets
