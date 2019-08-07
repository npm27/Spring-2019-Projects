##setup
#dat = read.csv("CVOE Scored.csv")
dat = read.csv("scored 8_6.csv")

#dat = dat[ , -c(13, 15:16)]
#dat = dat[ , -13]

##does response match key?
dat$match2 = dat$response2 == dat$Key

dat$score = as.numeric(dat$match2)

#write.csv(dat, file = "CVOE_Final 8_6_19.csv")
