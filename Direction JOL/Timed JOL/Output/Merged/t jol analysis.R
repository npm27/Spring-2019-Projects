####delayed JOL data screening####
##load data
dat = read.csv("ex2 final output.csv")

library(ggplot2)
library(reshape)

##put recall on correct scale
dat$Scored_Response = (dat$Scored_Response * 100) 

##remove out of range scores
dat$Jol_Response[dat$Jol_Response > 100] = NA

##get sample size
summary(dat$Subject) #n = 34

summary(dat)

##remove missing
nomiss3 = na.omit(dat)

summary(nomiss3)

##load libraries
library(reshape)
library(ez)

options(scipen = 999)

colnames(nomiss3)[6] = "Jol"
colnames(nomiss3)[9] = "Recall"

##going to cut out anyone three SDs above or below
##JOL
wide.dat = cast(nomiss3, Subject ~ Block, mean, value = 'Jol')
wide.dat$meanJOL = apply(wide.dat, 1, mean)
wide.dat$ZJOL = scale(wide.dat$meanJOL)

##Recall
wide.dat2 = cast(nomiss3, Subject ~ Block, mean, value = 'Recall')
wide.dat2$meanRECALL = apply(wide.dat2, 1, mean)
wide.dat2$ZRECALL = scale(wide.dat2$meanRECALL)

##Combined Wide data
wide.final = cbind(wide.dat, wide.dat2)
wide.final = wide.final[ , -c(2:3, 6:8)] ##No sd outliers

##checking distributions
hist(wide.dat$meanJOL)

hist(wide.final$meanRECALL)

##checking correlations
cor(wide.final[ , -c(1, 3, 5)])

##data seems fine

####set up data for analysis####
##get recall on same scale as jols
summary(nomiss3$Recall)

##get number of subjects
length(unique(unlist(nomiss3[c("Subject")]))) #n = 34

##means
meanJol_t = tapply(nomiss3$Jol, nomiss3$Direction, mean)
meanR_t = tapply(nomiss3$Recall, nomiss3$Direction, mean)

meanJol_t
meanR_t

#sds
sdJol_t = tapply(nomiss3$Jol, nomiss3$Direction, sd, na.rm = T)
sdR_t = tapply(nomiss3$Recall, nomiss3$Direction, sd, na.rm = T)

sdJol_t
sdR_t

####Analyses####
model3t = ezANOVA(data = nomiss3,
                 wid = Subject,
                 within = Direction,
                 dv = Jol,
                 detailed = TRUE)
model3t

##significant main effect of direction for JOLs

##calculate MSE for JOLS
tjol.mse = model3t$ANOVA$SSd[2]/model3t$ANOVA$DFd[2]

##RECALL ANALYSIS
model4t = ezANOVA(data = nomiss3,
                 wid = Subject,
                 within = Direction,
                 dv = Recall,
                 detailed = TRUE)
model4t ##significant main effect of direction for recall

##calculate MSE for Recall
tr.mse = model4t$ANOVA$SSd[2]/model4t$ANOVA$DFd[2]

tjol.mse;tr.mse

##get dfn (mean)
tdfn.jol = model3t$ANOVA$DFn[2]
tdfn.r = model4t$ANOVA$DFn[2]

##get dfd (error)
dfd.jol = model3t$ANOVA$DFd[2]
dfd.r = model4t$ANOVA$DFd[2]

##get ssn (mean)
tssn.jol = model3t$ANOVA$SSn[2]
tssn.r = model4t$ANOVA$SSn[2]

##get ssd (error)
tssd.jol = model3t$ANOVA$SSd[2]
tssd.r = model4t$ANOVA$SSd[2]

##get F
tfstat.jol = model3t$ANOVA$F[2]
tfstat.r = model4t$ANOVA$F[2]

####post hoc t-tests####
##JOL
pairwise.t.test(nomiss3$Jol, nomiss3$Direction, ##significant difference between Unrelated pairs and related pairs
                paired = F, p.adjust.method = 'bonferroni')

##Recall
pairwise.t.test(nomiss3$Recall, nomiss3$Direction, ##all are significant
                paired = F, p.adjust.method = 'bonferroni')

##get t values for post hocs
source("pairwise_t.R")

tJol.t = pairwise.t.test.with.t.and.df(nomiss3$Jol, nomiss3$Direction,
                                       paired = F, p.adjust.method = 'bonferroni')
tJol.t

print(tJol.t)[[5]] #T-values
print(tJol.t)[[6]] #df

tR.t = pairwise.t.test.with.t.and.df(nomiss3$Recall, nomiss3$Direction,
                                     paired = F, p.adjust.method = 'bonferroni')
tR.t

print(tR.t)[[5]] #T-values
print(tR.t)[[6]] #df