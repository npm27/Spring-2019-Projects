##setup
dat = read.csv("CVOE Scored.csv")
dat = dat[ , -c(15:16)]
dat = dat[ , -13]

##does response match key?
dat$Match = dat$Response == dat$KEY

dat$score = as.numeric(dat$Match)

write.csv(dat, file = "CVOE_Scored.csv")
