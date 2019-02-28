dat = read.csv("Final_CVOE.csv")

dat$zRT = scale(dat$RT, center = TRUE, scale = TRUE)

dat.trimmed = subset(dat,
                     dat$zRT < 3)

##what percent of the data is this?
removed = nrow(dat) - nrow(dat.trimmed)
p = removed / nrow(dat)
p

##write to csv
write.csv(dat.trimmed, file = "Final_CVOE_Trimmed.csv")
