dat = read.csv("Final_CVOE_Trimmed 4_1.csv")
#dat = dat[ , -1]

table(dat$Subject)

####zscore each individual####
##start w/ making all the subsets!
sub1 = subset(dat,
              dat$Subject == 1)
sub2 = subset(dat,
              dat$Subject == 2)
sub3 = subset(dat,
              dat$Subject == 3)
sub4 = subset(dat,
              dat$Subject == 4)
sub5 = subset(dat,
              dat$Subject == 5)
sub6 = subset(dat,
              dat$Subject == 6)
sub7 = subset(dat,
              dat$Subject == 7)
sub8 = subset(dat,
              dat$Subject == 8)
sub9 = subset(dat,
              dat$Subject == 9)
sub10 = subset(dat,
              dat$Subject == 10)
sub11 = subset(dat,
              dat$Subject == 11)
sub12 = subset(dat,
              dat$Subject == 12)
sub13 = subset(dat,
              dat$Subject == 13)
sub14 = subset(dat,
              dat$Subject == 14)
sub15 = subset(dat,
              dat$Subject == 15)
sub16 = subset(dat,
              dat$Subject == 16)
sub17 = subset(dat,
              dat$Subject == 17)
sub18 = subset(dat,
              dat$Subject == 18)
sub19 = subset(dat,
              dat$Subject == 19)
sub20 = subset(dat,
              dat$Subject == 20)
sub21 = subset(dat,
              dat$Subject == 21)

##start z-scoring response
sub1$score2_z = scale(sub1$score2, scale = TRUE)
sub2$score2_z = scale(sub2$score2, scale = TRUE)
sub3$score2_z = scale(sub3$score2, scale = TRUE)
sub4$score2_z = scale(sub4$score2, scale = TRUE)
sub5$score2_z = scale(sub5$score2, scale = TRUE)
sub6$score2_z = scale(sub6$score2, scale = TRUE)
sub7$score2_z = scale(sub7$score2, scale = TRUE)
sub8$score2_z = scale(sub8$score2, scale = TRUE)
sub9$score2_z = scale(sub9$score2, scale = TRUE)
sub10$score2_z = scale(sub10$score2, scale = TRUE)
sub11$score2_z = scale(sub11$score2, scale = TRUE)
sub12$score2_z = scale(sub12$score2, scale = TRUE)
sub13$score2_z = scale(sub13$score2, scale = TRUE)
sub14$score2_z = scale(sub14$score2, scale = TRUE)
sub15$score2_z = scale(sub15$score2, scale = TRUE)
sub16$score2_z = scale(sub16$score2, scale = TRUE)
sub17$score2_z = scale(sub17$score2, scale = TRUE)
sub18$score2_z = scale(sub18$score2, scale = TRUE)
sub19$score2_z = scale(sub19$score2, scale = TRUE)
sub20$score2_z = scale(sub20$score2, scale = TRUE)
sub21$score2_z = scale(sub21$score2, scale = TRUE)

##put it all back together
z_scored1 = rbind(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10,
                  sub11, sub12, sub13, sub14, sub15, sub16, sub17, sub18, sub19, sub20, sub21)

####RTs####
##make RT subset
rt = subset(dat,
            dat$score2 == 1)

sub1 = subset(rt,
              rt$Subject == 1)
sub2 = subset(rt,
              rt$Subject == 2)
sub3 = subset(rt,
              rt$Subject == 3)
sub4 = subset(rt,
              rt$Subject == 4)
sub5 = subset(rt,
              rt$Subject == 5)
sub6 = subset(rt,
              rt$Subject == 6)
sub7 = subset(rt,
              rt$Subject == 7)
sub8 = subset(rt,
              rt$Subject == 8)
sub9 = subset(rt,
              rt$Subject == 9)
sub10 = subset(rt,
               rt$Subject == 10)
sub11 = subset(rt,
               rt$Subject == 11)
sub12 = subset(rt,
               rt$Subject == 12)
sub13 = subset(rt,
              rt$Subject == 13)
sub14 = subset(rt,
              rt$Subject == 14)
sub15 = subset(rt,
               rt$Subject == 15)
sub16 = subset(rt,
               rt$Subject == 16)
sub17 = subset(rt,
               rt$Subject == 17)
sub18 = subset(rt,
               rt$Subject == 18)
sub19 = subset(rt,
               rt$Subject == 19)
sub20 = subset(rt,
               rt$Subject == 20)
sub21 = subset(rt,
               rt$Subject == 21)

##start z-scoring response
sub1$RT_z = scale(sub1$RT, scale = TRUE)
sub2$RT_z = scale(sub2$RT, scale = TRUE)
sub3$RT_z = scale(sub3$RT, scale = TRUE)
sub4$RT_z = scale(sub4$RT, scale = TRUE)
sub5$RT_z = scale(sub5$RT, scale = TRUE)
sub6$RT_z = scale(sub6$RT, scale = TRUE)
sub7$RT_z = scale(sub7$RT, scale = TRUE)
sub8$RT_z = scale(sub8$RT, scale = TRUE)
sub9$RT_z = scale(sub9$RT, scale = TRUE)
sub10$RT_z = scale(sub10$RT, scale = TRUE)
sub11$RT_z = scale(sub11$RT, scale = TRUE)
sub12$RT_z = scale(sub12$RT, scale = TRUE)
sub13$RT_z = scale(sub13$RT, scale = TRUE)
sub14$RT_z = scale(sub14$RT, scale = TRUE)
sub15$RT_z = scale(sub15$RT, scale = TRUE)
sub16$RT_z = scale(sub16$RT, scale = TRUE)
sub17$RT_z = scale(sub17$RT, scale = TRUE)
sub18$RT_z = scale(sub18$RT, scale = TRUE)
sub19$RT_z = scale(sub19$RT, scale = TRUE)
sub20$RT_z = scale(sub20$RT, scale = TRUE)
sub21$RT_z = scale(sub21$RT, scale = TRUE)

##put it all back together
rt_output = rbind(sub1, sub2, sub3, sub4, sub5, sub6, sub7, sub8, sub9, sub10,
                  sub11, sub12, sub13, sub14, sub15, sub16, sub17, sub18, sub19, sub20, sub21)

####Get means for z_scored data####
##mean rts by group
tapply(combined$RT,
       combined$block_type, mean)

##mean percent correct by group
tapply(combined$score2 * 100,
       combined$block_type, mean)

##differences within switch groups
##make a switch group subset
yes.switch = subset(dat,
                    dat$Switch == "Y")
no.switch = subset(dat,
                   dat$Switch == "N")

yes.switch.rt = subset(rt_output,
                       rt_output$Switch == "Y")
no.switch.rt = subset(rt_output,
                      rt_output$Switch == "N")

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

rt1 = tapply(rt_output$RT,
             list(rt_output$block_type, rt_output$Subject), mean)

pure_cv_rt = list(rt1[2, ])
pure_oe_rt = list(rt1[3, ])
alt_run_rt = list(rt1[1, ])
shuff_rt = list(rt1[4, ])

z_rt1 = tapply(rt_output$zRT,
               list(rt_output$block_type, rt_output$Subject), mean)

pure_cv_z_rt = list(z_rt1[2, ])
pure_oe_z_rt = list(z_rt1[3, ])
alt_run_z_rt = list(z_rt1[1, ])
shuff_z_rt = list(z_rt1[4, ])

##Switch
m2 = tapply(yes.switch$score2,
            list(yes.switch$block_type, yes.switch$Subject), mean)

switch_alt_run_m = list(m2[1, ])
switch_shuff_m = list(m2[4, ])

rt2 = tapply(yes.switch.rt$RT,
             list(yes.switch.rt$block_type, yes.switch.rt$Subject), mean)

switch_alt_run_rt = list(rt2[1, ])
switch_shuff_rt = list(rt2[4, ])

z_rt2 = tapply(yes.switch.rt$zRT,
             list(yes.switch.rt$block_type, yes.switch.rt$Subject), mean)

z_switch_alt_run_rt = list(z_rt2[1, ])
z_switch_shuff_rt = list(z_rt2[4, ])

##non-switch
m3 = tapply(no.switch$score2,
            list(no.switch$block_type, no.switch$Subject), mean)

no_switch_alt_run_m = list(m3[1, ])
no_switch_shuff_m = list(m3[4, ])

rt3 = tapply(no.switch.rt$RT,
             list(no.switch.rt$block_type, no.switch.rt$Subject), mean)

no_switch_alt_run_rt = list(rt3[1, ])
no_switch_shuff_rt = list(rt3[4, ])

z_rt3 = tapply(no.switch.rt$zRT,
             list(no.switch.rt$block_type, no.switch.rt$Subject), mean)

z_no_switch_alt_run_rt = list(z_rt3[1, ])
z_no_switch_shuff_rt = list(z_rt3[4, ])

####put all the output into a dataframe
subID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)

outputz = data.frame(subID, pure_cv_m, pure_cv_rt, pure_oe_m, pure_oe_rt, alt_run_m, alt_run_rt, 
                    shuff_m, shuff_rt, switch_alt_run_m, switch_alt_run_rt, switch_shuff_m, 
                    switch_shuff_rt, no_switch_alt_run_m, no_switch_alt_run_rt,
                    no_switch_shuff_m, no_switch_shuff_rt)


colnames(outputz)[2:17] = c("pure_cv_m", "pure_cv_rt", "pure_oe_m", "pure_oe_rt", "altrun_m", "altrun_rt",
                           "shuff_m", "shuff_rt", "switch_altrun_m", "switch_altrun_rt", "switch_shuff_m",
                           "switch_shuff_rt", "no_switch_altrun_m", "no_switch_altrun_rt",
                           "no_switch_shuff_m", "no_switch_shuff_rt")

#write.csv(outputz, file = "CVOE_Means 4_1.csv", row.names = FALSE)
