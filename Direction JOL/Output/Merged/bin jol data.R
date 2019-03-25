##set up
library(dplyr)
library(reshape)

dat = read.csv("output 2_14 final.csv")

####create jol bins####
##Forward pairs
j0F = subset(dat,
             dat$Jol_Response == 0| dat$Direction == 'F')
j10F = subset(dat,
             dat$Jol_Response == 10| dat$Direction == 'F')
j20F = subset(dat,
             dat$Jol_Response == 20| dat$Direction == 'F')
j30F = subset(dat,
             dat$Jol_Response == 30| dat$Direction == 'F')
j40F = subset(dat,
             dat$Jol_Response == 40| dat$Direction == 'F')
j50F = subset(dat,
             dat$Jol_Response == 50| dat$Direction == 'F')
j60F = subset(dat,
             dat$Jol_Response == 60| dat$Direction == 'F')
j70F = subset(dat,
             dat$Jol_Response == 70| dat$Direction == 'F')
j80F = subset(dat,
             dat$Jol_Response == 80| dat$Direction == 'F')
j90F = subset(dat,
             dat$Jol_Response == 90| dat$Direction == 'F')
j100F = subset(dat,
             dat$Jol_Response == 100| dat$Direction == 'F')

##backward pairs
j0B = subset(dat,
             dat$Jol_Response == 0| dat$Direction == 'B')
j10B = subset(dat,
              dat$Jol_Response == 10| dat$Direction == 'B')
j20B = subset(dat,
              dat$Jol_Response == 20| dat$Direction == 'B')
j30B = subset(dat,
              dat$Jol_Response == 30| dat$Direction == 'B')
j40B = subset(dat,
              dat$Jol_Response == 40| dat$Direction == 'B')
j50B = subset(dat,
              dat$Jol_Response == 50| dat$Direction == 'B')
j60B = subset(dat,
              dat$Jol_Response == 60| dat$Direction == 'B')
j70B = subset(dat,
              dat$Jol_Response == 70| dat$Direction == 'B')
j80B = subset(dat,
              dat$Jol_Response == 80| dat$Direction == 'B')
j90B = subset(dat,
              dat$Jol_Response == 90| dat$Direction == 'B')
j100B = subset(dat,
               dat$Jol_Response == 100| dat$Direction == 'B')

##Symmetrical
j0S = subset(dat,
             dat$Jol_Response == 0| dat$Direction == 'S')
j10S = subset(dat,
              dat$Jol_Response == 10| dat$Direction == 'S')
j20S = subset(dat,
              dat$Jol_Response == 20| dat$Direction == 'S')
j30S = subset(dat,
              dat$Jol_Response == 30| dat$Direction == 'S')
j40S = subset(dat,
              dat$Jol_Response == 40| dat$Direction == 'S')
j50S = subset(dat,
              dat$Jol_Response == 50| dat$Direction == 'S')
j60S = subset(dat,
              dat$Jol_Response == 60| dat$Direction == 'S')
j70S = subset(dat,
              dat$Jol_Response == 70| dat$Direction == 'S')
j80S = subset(dat,
              dat$Jol_Response == 80| dat$Direction == 'S')
j90S = subset(dat,
              dat$Jol_Response == 90| dat$Direction == 'S')
j100S = subset(dat,
               dat$Jol_Response == 100| dat$Direction == 'S')

##unrelated
j0U = subset(dat,
             dat$Jol_Response == 0| dat$Direction == 'U')
j10U = subset(dat,
              dat$Jol_Response == 10| dat$Direction == 'U')
j20U = subset(dat,
              dat$Jol_Response == 20| dat$Direction == 'U')
j30U = subset(dat,
              dat$Jol_Response == 30| dat$Direction == 'U')
j40U = subset(dat,
              dat$Jol_Response == 40| dat$Direction == 'U')
j50U = subset(dat,
              dat$Jol_Response == 50| dat$Direction == 'U')
j60U = subset(dat,
              dat$Jol_Response == 60| dat$Direction == 'U')
j70U = subset(dat,
              dat$Jol_Response == 70| dat$Direction == 'U')
j80U = subset(dat,
              dat$Jol_Response == 80| dat$Direction == 'U')
j90U = subset(dat,
              dat$Jol_Response == 90| dat$Direction == 'U')
j100U = subset(dat,
               dat$Jol_Response == 100| dat$Direction == 'U')

####add jol bin columns####
##0
j0F$jolbin = rep(0, nrow(j0F))
j0B$jolbin = rep(0, nrow(j0B))
j0S$jolbin = rep(0, nrow(j0S))
j0U$jolbin = rep(0, nrow(j0U))

##10 column
j10F$jolbin = rep(10, nrow(j10F))
j10B$jolbin = rep(10, nrow(j10B))
j10S$jolbin = rep(10, nrow(j10S))
j10U$jolbin = rep(10, nrow(j10U))

##20
j20F$jolbin = rep(20, nrow(j20F))
j20B$jolbin = rep(20, nrow(j20B))
j20S$jolbin = rep(20, nrow(j20S))
j20U$jolbin = rep(20, nrow(j20U))

##30
j30F$jolbin = rep(30, nrow(j30F))
j30B$jolbin = rep(30, nrow(j30B))
j30S$jolbin = rep(30, nrow(j30S))
j30U$jolbin = rep(30, nrow(j30U))

##40
j40F$jolbin = rep(40, nrow(j40F))
j40B$jolbin = rep(40, nrow(j40B))
j40S$jolbin = rep(40, nrow(j40S))
j40U$jolbin = rep(40, nrow(j40U))

##50
j50F$jolbin = rep(50, nrow(j50F))
j50B$jolbin = rep(50, nrow(j50B))
j50S$jolbin = rep(50, nrow(j50S))
j50U$jolbin = rep(50, nrow(j50U))

##60
j60F$jolbin = rep(60, nrow(j60F))
j60B$jolbin = rep(60, nrow(j60B))
j60S$jolbin = rep(60, nrow(j60S))
j60U$jolbin = rep(60, nrow(j60U))

##70
j70F$jolbin = rep(70, nrow(j70F))
j70B$jolbin = rep(70, nrow(j70B))
j70S$jolbin = rep(70, nrow(j70S))
j70U$jolbin = rep(70, nrow(j70U))

##80
j80F$jolbin = rep(80, nrow(j80F))
j80B$jolbin = rep(80, nrow(j80B))
j80S$jolbin = rep(80, nrow(j80S))
j80U$jolbin = rep(80, nrow(j80U))

##90
j90F$jolbin = rep(90, nrow(j90F))
j90B$jolbin = rep(90, nrow(j90B))
j90S$jolbin = rep(90, nrow(j90S))
j90U$jolbin = rep(90, nrow(j90U))

##100
j100F$jolbin = rep(100, nrow(j100F))
j100B$jolbin = rep(100, nrow(j100B))
j100S$jolbin = rep(100, nrow(j100S))
j100U$jolbin = rep(100, nrow(j100U))

####Stick ll the things back together####
##Forward
binnedF = rbind(j0F, j10F, j20F, j30F, j40F, j50F,
                 j60F, j70F, j80F, j90F, j100F)

##Backward
binnedB = rbind(j0B, j10B, j20B, j30B, j40B, j50B,
                j60B, j70B, j80B, j90B, j100B)

##Symmetrical
binnedS = rbind(j0S, j10S, j20S, j30S, j40S, j50S,
                j60S, j70S, j80S, j90S, j100S)

##Unrelated
binnedU = rbind(j0U, j10U, j20U, j30U, j40U, j50U,
                j60U, j70U, j80U, j90U, j100U)

##make final binned data
combined = rbind(binnedF, binnedB, binnedS, binnedU)

####get means for each subset####
groupmeans = aggregate(combined$Jol_Response, list(combined$jolbin, combined$Direction), FUN = mean, na.rm = TRUE)

colnames(groupmeans)[1] = "Jol_Bin"
colnames(groupmeans)[2] = "Direction"
colnames(groupmeans)[3] = "Average"

####get sds for each subset####
##check these

groupsd = aggregate(combined$Jol_Response, list(combined$jolbin, combined$Direction), FUN = sd, na.rm = TRUE)

colnames(groupsd)[1] = "Jol_Bin"
colnames(groupsd)[2] = "Direction"
colnames(groupsd)[3] = "SD"

####get ns for each subset####
#group_n = aggregate(combined$Jol_Response, list(combined$jolbin, combined$Direction), FUN = nrow)

colnames(groupmeans)[1] = "Jol_Bin"
colnames(groupmeans)[2] = "Direction"
colnames(groupmeans)[3] = "n"

####get confidence intervals for each subset####


##write to csv
#write.csv(combined, file = "binnedJOL.csv")
