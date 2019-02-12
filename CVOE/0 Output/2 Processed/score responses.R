##setup
dat = read.csv("CVOE Scored.csv")
dat = dat[ , -c(13, 15:16)]

##does response match key?
dat$Match = dat$Response == dat$KEY

dat$score = as.numeric(dat$Match)

write.csv(dat, file = "CVOE_Final.csv")