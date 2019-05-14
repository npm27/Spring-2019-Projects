####delayed JOL data screening####
##load data
nomiss3 = read.csv("T final data.csv")

summary(nomiss3)

##load libraries
library(reshape)
library(ez)

options(scipen = 999)

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
nomiss3$Recall = nomiss3$Recall * 100
summary(nomiss3$Recall)

##get number of subjects
length(unique(unlist(nomiss3[c("Subject")]))) #n = 33

##means
meanJol_t = tapply(nomiss3$Jol, nomiss3$Direction, mean)
meanR_t = tapply(nomiss3$Recall, nomiss3$Direction, mean)

meanJol_t
meanR_t

#sds
sdJol_d = tapply(nomiss3$Jol, nomiss3$Direction, sd, na.rm = T)
sdR_d = tapply(nomiss3$Recall, nomiss3$Direction, sd, na.rm = T)

sdJol_d
sdR_d

####Analyses####
model3 = ezANOVA(data = nomiss2,
                 wid = Subject,
                 within = Direction,
                 dv = Jol,
                 detailed = TRUE)
model3

##significant main effect of direction for JOLs

##calculate MSE for JOLS
djol.mse = model3$ANOVA$SSd[2]/model3$ANOVA$DFd[2]

##RECALL ANALYSIS
model4 = ezANOVA(data = nomiss2,
                 wid = Subject,
                 within = Direction,
                 dv = Recall,
                 detailed = TRUE)
model4 ##significant main effect of direction for recall

##calculate MSE for Recall
dr.mse = model4$ANOVA$SSd[2]/model4$ANOVA$DFd[2]

djol.mse;dr.mse

##get dfn (mean)
ddfn.jol = model3$ANOVA$DFn[2]
dfn.r = model4$ANOVA$DFn[2]

##get dfd (error)
dfd.jol = model3$ANOVA$DFd[2]
dfd.r = model4$ANOVA$DFd[2]

##get ssn (mean)
dssn.jol = model3$ANOVA$SSn[2]
dssn.r = model4$ANOVA$SSn[2]

##get ssd (error)
dssd.jol = model3$ANOVA$SSd[2]
dssd.r = model4$ANOVA$SSd[2]

##get F
dfstat.jol = model3$ANOVA$F[2]
dfstat.r = model4$ANOVA$F[2]

####post hoc t-tests####
##JOL
pairwise.t.test(nomiss2$Jol, nomiss2$Direction, ##significant difference between Unrelated pairs and related pairs
                paired = F, p.adjust.method = 'bonferroni')

##Recall
pairwise.t.test(nomiss2$Recall, nomiss2$Direction, ##all are significant
                paired = F, p.adjust.method = 'bonferroni')

##get t values for post hocs
source("pairwise_t.R")

dJol.t = pairwise.t.test.with.t.and.df(nomiss2$Jol, nomiss2$Direction,
                                       paired = F, p.adjust.method = 'none')
dJol.t

print(dJol.t)[[5]] #T-values
print(dJol.t)[[6]] #df

dR.t = pairwise.t.test.with.t.and.df(nomiss2$Recall, nomiss2$Direction,
                                     paired = F, p.adjust.method = 'none')
dR.t

print(dR.t)[[5]] #T-values
print(dR.t)[[6]] #df