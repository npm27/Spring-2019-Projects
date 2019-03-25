##Load data
combined = read.csv("Final_CVOE_Trimmed.csv")

rt = subset(combined,
            combined$score2 == 1)

####check descriptives####
##mean rts by group
tapply(combined$RT,
              combined$block_type, mean)

##mean percent correct by group
tapply(combined$score2 * 100,
              combined$block_type, mean)

##differences within switch groups
##make a switch group subset
yes.switch = subset(combined,
                    combined$Switch == "Y")
no.switch = subset(combined,
                   combined$Switch == "N")

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
tapply(combined$RT,
       list(combined$block_type, combined$Congruent), mean)
tapply(combined$score,
       list(combined$block_type, combined$Congruent), mean)

##so screens/trimming
##trim at the subject level, not overall average (do it within subjects)

##transform rts to z
##cost as a function of trial effects?
##look at it as function of subject

####check by subject####
##overall
m1 = tapply(combined$score2,
       list(combined$block_type, combined$Subject), mean)

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

##Switch
m2 = tapply(yes.switch$score2,
       list(yes.switch$block_type, yes.switch$Subject), mean)

switch_alt_run_m = list(m2[1, ])
switch_shuff_m = list(m2[4, ])

rt2 = tapply(yes.switch.rt$RT,
       list(yes.switch.rt$block_type, yes.switch.rt$Subject), mean)

switch_alt_run_rt = list(rt2[1, ])
switch_shuff_rt = list(rt2[4, ])

##non-switch
m3 = tapply(no.switch$score2,
       list(no.switch$block_type, no.switch$Subject), mean)

no_switch_alt_run_m = list(m3[1, ])
no_switch_shuff_m = list(m3[4, ])

rt3 = tapply(no.switch.rt$RT,
       list(no.switch.rt$block_type, no.switch.rt$Subject), mean)

no_switch_alt_run_rt = list(rt3[1, ])
no_switch_shuff_rt = list(rt3[4, ])

####put all the output into a dataframe
subID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16)

output = data.frame(subID, pure_cv_m, pure_cv_rt, pure_oe_m, pure_oe_rt, alt_run_m, alt_run_rt, 
                    shuff_m, shuff_rt, switch_alt_run_m, switch_alt_run_rt, switch_shuff_m, 
                    switch_shuff_rt, no_switch_alt_run_m, no_switch_alt_run_rt,
                    no_switch_shuff_m, no_switch_shuff_rt)


colnames(output)[2:17] = c("pure_cv_m", "pure_cv_rt", "pure_oe_m", "pure_oe_rt", "altrun_m", "altrun_rt",
                           "shuff_m", "shuff_rt", "switch_altrun_m", "switch_altrun_rt", "switch_shuff_m",
                           "switch_shuff_rt", "no_switch_altrun_m", "no_switch_altrun_rt",
                           "no_switch_shuff_m", "no_switch_shuff_rt")

#write.csv(output, file = "CVOE_Means.csv", row.names = FALSE)
