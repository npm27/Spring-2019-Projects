##setup
#dat = read.csv("CVOE Scored.csv")
dat = read.csv("CVOE 2_27_19.csv")

#dat = dat[ , -c(13, 15:16)]
#dat = dat[ , -13]

##does response match key?
dat$Match = dat$Response == dat$Key

dat$score = as.numeric(dat$Match)

write.csv(dat, file = "CVOE_Final 2_27_19.csv")