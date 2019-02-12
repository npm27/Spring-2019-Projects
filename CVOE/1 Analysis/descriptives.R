dat = read.csv("CVOE_Final.csv")

##add block type
#dat$block_type = rep(c("cv", "oe", "alt", "shuf", "oe", "cv", "shuf", "alt", "oe", "cv", "alt", "shuf", "cv", "oe", "shuf", "alt"),
#               c(96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120))

task_list = c("cv", "oe", "alt", "shuf", "oe", "cv", "shuf", "alt", "oe", "cv", "alt", "shuf", "cv", "oe", "shuf", "alt")
rep_list = c(96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120, 96, 96, 120, 120)

dat$block_type = rep(task_list, rep_list)

####check descriptives####
##mean rts by group
tapply(dat$RT,
              dat$block_type, mean)

##mean percent correct by group
tapply(dat$score * 100,
              dat$block_type, mean)

##differences within switch groups
##make a switch group subset
yes.switch = subset(dat,
                    dat$Switch == "Y")
no.switch = subset(dat,
                   dat$Switch == "N")

tapply(yes.switch$RT,
       yes.switch$block_type, mean)
tapply(no.switch$RT,
       no.switch$block_type, mean)

tapply(yes.switch$score * 100,
       yes.switch$block_type, mean)
tapply(no.switch$score * 100,
       no.switch$block_type, mean)

##congruency
tapply(dat$RT,
       list(dat$block_type, dat$Congruent), mean)
tapply(dat$score,
       list(dat$block_type, dat$Congruent), mean)
