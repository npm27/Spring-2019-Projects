##use grep functions to get remove rows containing buffer items
library(dplyr)

dat = read.csv("output 3_7.csv")
z = dat$cue_target == "Member - Group"

grep("Hear", dat$cue_target)

##this code removes rows containing a certain string in the designated column
dat2 = filter(dat, !grepl("Hear", dat$cue_target))
dat3 = filter(dat2, !grepl("Member", dat2$cue_target))

##This will take forever...
##is there a way to accomplish this with a loop?

####Try a loop!####
##make list containing key words for removal
exclude = c("Member", "Curtain", "Snow", "Haircut", "Shrimp",
            "Catcher", "Friendliness", "Geese", "Grab", "Trees",
            "Hide", "Disintegrate", "Sheriff", "Essay", "Malt",
            "Deciet", "Deaf", "Magician", "Contest", "Mind")

for (word in exlcude){
  
}