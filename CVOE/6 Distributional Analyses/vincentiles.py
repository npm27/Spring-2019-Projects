##set up
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

pure = pd.read_csv("pure_final.csv")
switch = pd.read_csv("switch_final.csv")
non_switch = pd.read_csv("non_switch_final.csv")

#make errror bars
#dat['diff'] = dat['Upper'].sub(dat['Lower'])
#dat['diff2'] = dat['diff'].div(2)

##set up the initial plot
fig = plt.figure()
fig.set_size_inches(11,11)

ax1 = fig.add_subplot(3, 1, 1)
ax2 = fig.add_subplot(3, 1, 2)
ax3 = fig.add_subplot(3, 1, 3)

fig.subplots_adjust(hspace = .45)

mylabels = ["Younger", "Healthy Older", "MCI"]

#major_ticks = np.arange(0, 101, 20)

#fig.text(0.5, 0.04, 'Bin', ha='center', fontsize=18)
#fig.text(0.04, 0.5, 'Mean RT', va='center', rotation='vertical', fontsize=18)

##pure
y1 = pure.ya_pure
y2 = pure.healthy_pure
y3 = pure.mci_pure
x1 = pure.bin

ax1.plot( x1, y1, marker='o', markerfacecolor='k', markersize=6, color='k', linewidth=4)
ax1.plot( x1, y2, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = "dashed", linewidth=4)
ax1.plot( x1, y3, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = ":", linewidth=4)

#ax1.set_xticks(major_ticks)
#ax1.set_yticks(major_ticks)

#format plot
ax1.set_title("Pure", fontsize = 16)
ax1.set_ylim([0,3000])
ax1.legend(bbox_to_anchor=(1.25, 1), loc='upper right', ncol=1, fontsize = 12, labels = mylabels)
ax1.set_xlabel('Bin', fontsize = 16)
ax1.set_ylabel('Mean RT', fontsize = 16)

##switch
y4 = switch.ya_switch
y5 = switch.healthy_switch
y6 = switch.mci_switch
x2 = switch.bin

ax2.plot( x2, y4, marker='o', markerfacecolor='k', markersize=6, color='k', linewidth=4)
ax2.plot( x2, y5, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = "dashed", linewidth=4)
ax2.plot( x2, y6, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = ":", linewidth=4)

#ax2.set_xticks(major_ticks)
#ax2.set_yticks(major_ticks)

ax2.set_title("Switch", fontsize = 16)
ax2.set_ylim([0,4000])
ax2.legend(bbox_to_anchor=(1.25, 1), loc='upper right', ncol=1, fontsize = 12, labels = mylabels)
ax2.set_xlabel('Bin', fontsize = 16)
ax2.set_ylabel('Mean RT', fontsize = 16)

##non_switch
y7 = non_switch.ya_non_switch
y8 = non_switch.healthy_non_switch
y9 = non_switch.mci_non_switch
x3 = non_switch.bin

ax3.plot( x3, y7, marker='o', markerfacecolor='k', markersize=6, color='k', linewidth=4)
ax3.plot( x3, y8, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = "dashed", linewidth=4)
ax3.plot( x3, y9, marker='o', markerfacecolor='k', markersize=6, color='k', linestyle = ":", linewidth=4)

#ax3.xlim(0,4000)

#ax3.set_xticks(major_ticks)
#ax3.set_yticks(major_ticks)

ax3.set_title("Non-Switch", fontsize = 16)
ax3.set_ylim([0,5000])
ax3.legend(bbox_to_anchor=(1.23, 1), loc='upper right', ncol=1, fontsize = 12, labels = mylabels)
ax.legend(labels=mylabels)
ax3.set_xlabel('Bin', fontsize = 16)
ax3.set_ylabel('Mean RT', fontsize = 16)

##save figure
#fig.savefig('vincentiles.pdf')