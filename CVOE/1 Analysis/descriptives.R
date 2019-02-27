dat = read.csv("CVOE_Final Output.csv")

####add block type####
#dat$block_type = rep(c("cv", "oe", "alt", "shuf", "oe", "cv", "shuf", "alt", "oe", "cv", "alt", "shuf", "cv", "oe", "shuf", "alt"),
#               c(96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120))


##split into subsets by experiment version
CVOE_A = subset(dat,
                dat$ExperimentName == "CVOE updated")
CVOE_B = subset(dat,
                dat$ExperimentName == "CVOE_B")
CVOE_C = subset(dat,
                dat$ExperimentName == "CVOE_C")
CVOE_D = subset(dat,
                dat$ExperimentName == "CVOE_D")

##add a column denoting type of cvoe task
task_listA = c("cv", "oe", "alt", "shuf")
task_listB = c("oe", "cv", "shuf", "alt")
task_listC = c("oe", "cv", "alt", "shuf")
task_listD = c("cv", "oe", "shuf", "alt")

rep_list = c(96, 96, 120, 120)

CVOE_A$block_type = rep(task_listA, rep_list)
CVOE_B$block_type = rep(task_listB, rep_list)
CVOE_C$block_type = rep(task_listC, rep_list)
CVOE_D$block_type = rep(task_listD, rep_list)

##put it all back together
combined = rbind(CVOE_A, CVOE_B, CVOE_C, CVOE_D)

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
