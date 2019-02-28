##Load data
combined = read.csv("Final_CVOE_Trimmed.csv")

####check descriptives####
##mean rts by group
tapply(combined$RT,
              combined$block_type, mean)

##mean percent correct by group
tapply(combined$score * 100,
              combined$block_type, mean)

##differences within switch groups
##make a switch group subset
yes.switch = subset(combined,
                    combined$Switch == "Y")
no.switch = subset(combined,
                   combined$Switch == "N")

tapply(yes.switch$RT,
       yes.switch$block_type, mean)
tapply(no.switch$RT,
       no.switch$block_type, mean)

tapply(yes.switch$score * 100,
       yes.switch$block_type, mean)
tapply(no.switch$score * 100,
       no.switch$block_type, mean)

##congruency
tapply(combined$RT,
       list(combined$block_type, combined$Congruent), mean)
tapply(combined$score,
       list(combined$block_type, combined$Congruent), mean)

##so screens/trimming
##trim at the subject level, not overall average (do it within subjects)

##transform rts to z
##cost as a function of trial effects?
##look at it as function of subject

##check by subject
tapply(combined$score,
       list(combined$block_type, combined$Subject), mean)
tapply(combined$RT,
       list(combined$block_type, combined$Subject), mean)
