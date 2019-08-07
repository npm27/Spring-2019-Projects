dat = read.csv("older scored 8_6.csv")

dat = dat[ , -1]

dat2 = subset(dat,
              dat$score2 == 1)

dat2$zRT = scale(dat2$RT, center = TRUE, scale = TRUE)

dat.trimmed = subset(dat2,
                     dat2$zRT < 3 & dat2$zRT > -3)

summary(dat$RT)
summary(dat2$RT)
summary(dat.trimmed$RT)

##what percent of the data is this?
removed = nrow(dat2) - nrow(dat.trimmed)
p = removed / nrow(dat2)
p

##write to csv
#write.csv(dat.trimmed, file = "Older_CVOE_Trimmed 8_6.csv", row.names = FALSE)