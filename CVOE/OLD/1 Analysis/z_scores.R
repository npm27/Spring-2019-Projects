dat = read.csv("Final_CVOE_Trimmed 10_3_21.csv")
#dat = dat[ , -1]

table(dat$Subject)

dat = na.omit(dat)

####Z Responses####
##write a loop to z-score each subject
id = unique(dat$Subject)

temp2 = c()

for(i in id){
        
        temp = subset(dat,
                      dat$Subject == i)
        
        z_scored = scale(temp$score2, scale = TRUE)
        
        temp2 = c(temp2, z_scored)
        
}

dat$scored_z = temp2

####Z-RTs#####
rt = subset(dat,
            dat$score2 == 1)

id = unique(rt$Subject)

temp2 = c()

for(i in id){
        
        temp = subset(rt,
                      rt$Subject == i)
        
        z_scored = scale(temp$RT, scale = TRUE)
        
        temp2 = c(temp2, z_scored)
        
}

rt$zRT = temp2


####Get means for z_scored data####
##mean rts by group
tapply(dat$RT,
       dat$block_type, mean)

##mean percent correct by group
tapply(dat$score2 * 100,
       dat$block_type, mean)

##differences within switch groups
##make a switch group subset
yes.switch = subset(dat,
                    dat$Switch == "Y")
no.switch = subset(dat,
                   dat$Switch == "N")

yes.switch.rt = subset(rt,
                       rt$Switch == "Y")
no.switch.rt = subset(rt,
                      rt$Switch == "N")

tapply(yes.switch$RT,
       yes.switch$block_type, mean)
tapply(no.switch$RT,
       no.switch$block_type, mean)

tapply(yes.switch$score2 * 100,
       yes.switch$block_type, mean)
tapply(no.switch$score2 * 100,
       no.switch$block_type, mean)

##congruency
tapply(dat$RT,
       list(dat$block_type, dat$Congruent), mean)
tapply(dat$score2,
       list(dat$block_type, dat$Congruent), mean)

##transform rts to z
##cost as a function of trial effects?
##look at it as function of subject

####check by subject####
##overall
m1 = tapply(dat$score2,
            list(dat$block_type, dat$Subject), mean)

pure_cv_m = list(m1[2, ])
pure_oe_m = list(m1[3, ])
alt_run_m = list(m1[1, ])
shuff_m = list(m1[4, ])

rt1 = tapply(rt$RT,
             list(rt$block_type, rt$Subject), mean)

pure_cv_rt = list(rt1[2, ])
pure_oe_rt = list(rt1[3, ])
alt_run_rt = list(rt1[1, ])
shuff_rt = list(rt1[4, ])

z_rt1 = tapply(rt$zRT,
               list(rt$block_type, rt$Subject), mean)

pure_cv_z_rt = list(z_rt1[2, ])
pure_oe_z_rt = list(z_rt1[3, ])
alt_run_z_rt = list(z_rt1[1, ])
shuff_z_rt = list(z_rt1[4, ])

##Switch
m2 = tapply(yes.switch$score2,
            list(yes.switch$block_type, yes.switch$Subject), mean)

switch_alt_run_m = list(m2[1, ])
switch_shuff_m = list(m2[2, ])

rt2 = tapply(yes.switch.rt$RT,
             list(yes.switch.rt$block_type, yes.switch.rt$Subject), mean)

switch_alt_run_rt = list(rt2[1, ])
switch_shuff_rt = list(rt2[2, ])

z_rt2 = tapply(yes.switch.rt$zRT,
             list(yes.switch.rt$block_type, yes.switch.rt$Subject), mean)

z_switch_alt_run_rt = list(z_rt2[1, ])
z_switch_shuff_rt = list(z_rt2[2, ])

##non-switch
m3 = tapply(no.switch$score2,
            list(no.switch$block_type, no.switch$Subject), mean)

no_switch_alt_run_m = list(m3[1, ])
no_switch_shuff_m = list(m3[2, ])

rt3 = tapply(no.switch.rt$RT,
             list(no.switch.rt$block_type, no.switch.rt$Subject), mean)

no_switch_alt_run_rt = list(rt3[1, ])
no_switch_shuff_rt = list(rt3[2, ])

z_rt3 = tapply(no.switch.rt$zRT,
             list(no.switch.rt$block_type, no.switch.rt$Subject), mean)

z_no_switch_alt_run_rt = list(z_rt3[1, ])
z_no_switch_shuff_rt = list(z_rt3[2, ])

####put all the output into a dataframe

outputz = data.frame(id, pure_cv_m, pure_cv_z_rt, pure_oe_m, pure_oe_z_rt, alt_run_m, alt_run_z_rt, 
                    shuff_m, shuff_z_rt, switch_alt_run_m, switch_alt_run_rt, switch_shuff_m, 
                    switch_shuff_rt, no_switch_alt_run_m, no_switch_alt_run_rt,
                    no_switch_shuff_m, no_switch_shuff_rt)


colnames(outputz)[2:17] = c("pure_cv_m", "pure_cv_rt", "pure_oe_m", "pure_oe_rt", "altrun_m", "altrun_rt",
                           "shuff_m", "shuff_rt", "switch_altrun_m", "switch_altrun_rt", "switch_shuff_m",
                           "switch_shuff_rt", "no_switch_altrun_m", "no_switch_altrun_rt",
                           "no_switch_shuff_m", "no_switch_shuff_rt")

#write.csv(outputz, file = "CVOE_Means 10_3_21.csv", row.names = FALSE)
