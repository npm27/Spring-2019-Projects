dat = read.csv("older scored 11_18.csv")

#dat = dat[ , -1]

dat$zRT = scale(dat$RT, center = TRUE, scale = TRUE)

dat.trimmed = subset(dat,
                     dat$zRT < 3)
dat.trimmed2 = subset(dat.trimmed,
                      dat.trimmed$zRT > -3)

##what percent of the data is this?
removed = nrow(dat) - nrow(dat.trimmed2)
p = removed / nrow(dat)
p

##write to csv
#write.csv(dat.trimmed, file = "Older_CVOE_Trimmed 11_18.csv", row.names = FALSE)
