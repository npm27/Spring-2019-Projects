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

##write to csv for future use
write.csv(combined, file = "Final_CVOE.csv")