##use grep functions to get remove rows containing buffer items
library(dplyr)

dat = read.csv("output 3_7.csv")

##make list containing key words for removal
exclude = c("Member", "Curtain", "Snow", "Haircut", "Shrimp",
            "Catcher", "Friendliness", "Geese", "Grab", "Trees",
            "Hide - Scare", "Disintegrate", "Sheriff", "Essay", "Malt",
            "Deciet", "Deaf", "Magician", "Contest", "Mind")

datx = filter(dat, !grepl(paste(exclude, collapse = "|"), dat$cue_target))

#write.csv(datx, file = ('output 3_7 no buffers.csv'))