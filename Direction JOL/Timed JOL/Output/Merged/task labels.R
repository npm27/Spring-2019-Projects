##setup
dat = read.csv("output 2_14.csv")
dat$task = c(rep('jol', 80), rep('recall', 80))

#write.csv(dat, file = "output 2_14 with labels.csv")
