####reshape vincentile stuff####
##load data
ya = read.csv("ya_vinc.csv")
healthy = read.csv("healthy_vinc.csv")
mci = read.csv("mci_vinc.csv")

colnames(ya)[4] = "average"
colnames(healthy)[4] = "average"
colnames(mci)[4] = "average"

library(reshape)

#split on trial type
#younger adults
ya_pure = subset(ya,
                 ya$condition == "pure")
ya_switch = subset(ya,
                 ya$condition == "switch")
ya_non_switch = subset(ya,
                   ya$condition == "non-switch")

#healthy older
healthy_pure = subset(healthy,
                 healthy$condition == "pure")
healthy_switch = subset(healthy,
                   healthy$condition == "switch")
healthy_non_switch = subset(healthy,
                       healthy$condition == "non-switch")

#Mci older
mci_pure = subset(mci,
                      mci$condition == "pure")
mci_switch = subset(mci,
                        mci$condition == "switch")
mci_non_switch = subset(mci,
                            mci$condition == "non-switch")

#reshape things
#ya
#pure
tap1 = tapply(ya_pure$average,
       ya_pure$bin, mean)
tap1 = as.data.frame(tap1)

tap1$bin = rep(1:6)
colnames(tap1)[1] = "ya_pure"

#switch
tap2 = tapply(ya_switch$average,
              ya_switch$bin, mean)
tap2 = as.data.frame(tap2)

tap2$bin = rep(1:6)
colnames(tap2)[1] = "ya_switch"

#non switch
tap3 = tapply(ya_non_switch$average,
              ya_non_switch$bin, mean)
tap3 = as.data.frame(tap3)

tap3$bin = rep(1:6)
colnames(tap3)[1] = "ya_non_switch"

#healthy
#pure
tap4 = tapply(healthy_pure$average,
              healthy_pure$bin, mean)
tap4 = as.data.frame(tap4)

tap4$bin = rep(1:6)
colnames(tap4)[1] = "healthy_pure"

#switch
tap5 = tapply(healthy_switch$average,
              healthy_switch$bin, mean)
tap5 = as.data.frame(tap5)

tap5$bin = rep(1:6)
colnames(tap5)[1] = "healthy_switch"

#non switch
tap6 = tapply(healthy_non_switch$average,
              healthy_non_switch$bin, mean)
tap6 = as.data.frame(tap6)

tap6$bin = rep(1:6)
colnames(tap6)[1] = "healthy_non_switch"

#mci
#pure
tap7 = tapply(mci_pure$average,
              mci_pure$bin, mean)
tap7 = as.data.frame(tap7)

tap7$bin = rep(1:6)
colnames(tap7)[1] = "mci_pure"

#switch
tap8 = tapply(mci_switch$average,
              mci_switch$bin, mean)
tap8 = as.data.frame(tap8)

tap8$bin = rep(1:6)
colnames(tap8)[1] = "mci_switch"

#non switch
tap9 = tapply(mci_non_switch$average,
              mci_non_switch$bin, mean)
tap9 = as.data.frame(tap9)

tap9$bin = rep(1:6)
colnames(tap9)[1] = "mci_non_switch"

#put things back together
combined_pure = cbind(tap1, tap4, tap7)
combined_switch = cbind(tap2, tap5, tap8)
combined_non_switch = cbind(tap3, tap6, tap9)

#drop duplicate columns
combined_pure = combined_pure[ , -c(2, 4)]
combined_switch = combined_switch[ , -c(2, 4)]
combined_non_switch = combined_non_switch[ , -c(2, 4)]

#write to csv
#write.csv(combined_pure, file = "pure_final.csv", row.names = FALSE)
#write.csv(combined_switch, file = "switch_final.csv", row.names = FALSE)
#write.csv(combined_non_switch, file = "non_switch_final.csv", row.names = FALSE)