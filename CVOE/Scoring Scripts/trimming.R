dat = read.csv("corrected pre-trimmed.csv")

#dat = dat[ , -1]

dat$zRT = with(dat, ave(RT, Subject, FUN = scale))

dat.trimmed = subset(dat,
                     dat$zRT < 3)
dat.trimmed2 = subset(dat.trimmed,
                      dat.trimmed$zRT > -3)

##what percent of the data is this?
removed = nrow(dat) - nrow(dat.trimmed2)
p = removed / nrow(dat)
p

#write to csv
#write.csv(dat.trimmed2, file = "Final_CVOE_Trimmed 10_3_21.csv", row.names = FALSE)
