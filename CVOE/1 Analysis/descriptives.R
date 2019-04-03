##Load data
combined = read.csv("Final_CVOE_Trimmed 4_1.csv")

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
subID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21)

output = data.frame(subID, pure_cv_m, pure_cv_rt, pure_oe_m, pure_oe_rt, alt_run_m, alt_run_rt, 
                    shuff_m, shuff_rt, switch_alt_run_m, switch_alt_run_rt, switch_shuff_m, 
                    switch_shuff_rt, no_switch_alt_run_m, no_switch_alt_run_rt,
                    no_switch_shuff_m, no_switch_shuff_rt)


colnames(output)[2:17] = c("pure_cv_m", "pure_cv_rt", "pure_oe_m", "pure_oe_rt", "altrun_m", "altrun_rt",
                           "shuff_m", "shuff_rt", "switch_altrun_m", "switch_altrun_rt", "switch_shuff_m",
                           "switch_shuff_rt", "no_switch_altrun_m", "no_switch_altrun_rt",
                           "no_switch_shuff_m", "no_switch_shuff_rt")

#write.csv(output, file = "CVOE_Means.csv", row.names = FALSE)

####set up output####
##mean errors
mean_cv_errors = 1 - output$pure_cv_m
mean_oe_errors = 1 - output$pure_oe_m
mean_alt_errors = 1 - output$altrun_m
mean_rand_errors = 1 - output$shuff_m
alt_switch_errors = 1 - output$switch_altrun_m
alt_non_switch_errors = 1 - output$no_switch_altrun_m
rand_switch_errors = 1 - output$switch_shuff_m
rand_non_switch_errors = 1 - output$no_switch_shuff_m

pure_block_errors = (mean_cv_errors + mean_oe_errors) / 2

##global switch cost
global_cost_alt = alt_non_switch_errors - pure_block_errors
global_cost_rand = rand_non_switch_errors - pure_block_errors

##local switch cost
local_switch_cost_alt = alt_switch_errors - alt_non_switch_errors
local_switch_cost_rand = rand_switch_errors - rand_non_switch_errors

##put it all together
output_errors = data.frame(mean_cv_errors, mean_oe_errors, pure_block_errors,
                           alt_switch_errors, alt_non_switch_errors, rand_switch_errors, rand_non_switch_errors,
                           global_cost_alt, global_cost_rand,
                           local_switch_cost_alt, local_switch_cost_rand)

#write.csv(output_errors, file = "Output errors 4_2.csv", row.names = FALSE)

####Analyses and graphs####
##set up and load libraries
library(ez)
library(reshape)
library(ggplot2)
library(Hmisc)

options(scipen = 999)

cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line.x = element_line(color = "black"),
                axis.line.y = element_line(color = "black"),
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 25))

##overall switch vs non switch here
##global switch vs pure
##set up overall switch data here
output_errors$switch_average = (output_errors$alt_switch_errors + output_errors$alt_non_switch_errors + 
  output_errors$rand_switch_errors + output_errors$rand_non_switch_errors) / 4

pure.switch = output_errors[ , c(3, 12)]

pure.switch$subID = 1:nrow(pure.switch)
pure.switch = pure.switch[-15, ]

long.dat1 = melt(pure.switch, id = ("subID"))

colnames(long.dat1)[2] = "Task_Type"
colnames(long.dat1)[3] = "Mean_Error"

bar1 = ggplot(long.dat1, aes(Task_Type, Mean_Error))
bar1 + 
  stat_summary(fun.y = mean, 
               geom = "bar", 
               fill = "Red", 
               color = "Red") +
  stat_summary(fun.data = mean_cl_normal, 
               geom = "errorbar", 
               width = .2, 
               position = "dodge") +
  cleanup +
  xlab("Task Type") +
  ylab("Mean Error Rate") +
  scale_x_discrete(labels = c("Pure", "Switch")) 

##just looking at switch data
switch.nonswitch = output_errors[ , c(4:7)]
switch.nonswitch$subID = 1:nrow(switch.nonswitch)
switch.nonswitch = switch.nonswitch[-15, ]

long.dat2 = melt(switch.nonswitch, id = ("subID"))

colnames(long.dat2)[2] = "Task_Type"
colnames(long.dat2)[3] = "Mean_Error"

long.dat2$switch_type = c(rep("Switch", 20), rep("Non-Switch", 20), rep("Switch", 20), rep("Non-Switch", 20))
long.dat2$Task_Type = c(rep("Alternating Runs", 40), rep("Random", 40))

long.dat2$Mean_Error = long.dat2$Mean_Error * 100

bar2 = ggplot(long.dat2, aes(Task_Type, Mean_Error, fill = switch_type))
bar2 +
  stat_summary(fun.y = mean,
               geom = "bar",
               position = "dodge") +
  stat_summary(fun.data = mean_cl_normal,
               geom = "errorbar", 
               position = position_dodge(width = 0.90),
               width = .2) +
  xlab("Task Type") +
  ylab("Mean Error Rate") + 
  cleanup +
  scale_fill_manual(name = "Switch Type", 
                    labels = c("Switch", "Non-Switch"),
                    values = c("Red", "Gray"))
bar2

####Pure, switch, and non-switch trials
dat3 = output_errors[ , c(3:7)]

dat3$subID = 1:nrow(dat3)
dat3 = dat3[-15, ]

dat3$Switch = (dat3$alt_switch_errors + dat3$rand_switch_errors) / 2
dat3$Non_Switch = (dat3$alt_non_switch_errors + dat3$rand_non_switch_errors) / 2

dat3 = dat3[ , -c(2:5)]
colnames(dat3)[1] = "Pure"

long.dat3 = melt(dat3, id = ("subID"))

colnames(long.dat3)[2] = "Task_Type"
colnames(long.dat3)[3] = "Mean_Error"

##make the graph
bar3 = ggplot(long.dat3, aes(Task_Type, Mean_Error))
bar3 + 
  stat_summary(fun.y = mean, 
               geom = "bar", 
               fill = "Red", 
               color = "Red") +
  stat_summary(fun.data = mean_cl_normal, 
               geom = "errorbar", 
               width = .2, 
               position = "dodge") +
  cleanup +
  xlab("Task Type") +
  ylab("Mean Error Rate") +
  scale_x_discrete(labels = c("Pure", "Switch", "Non-Switch"))
bar3

####run some ANOVA####
##difference between pure, switch, and non-switch
ezANOVA(data = long.dat3,
        wid = subID,
        within = Task_Type,
        dv = Mean_Error,
        type = 3) ##non-significant, p = .254

####t-test for alt runs switch vs non-switch and rand switch vs non-switch####
dat4 = subset(long.dat2,
              long.dat2$Task_Type == "Alternating Runs")
dat5 = subset(long.dat2,
              long.dat2$Task_Type == "Random")


t.test(dat4$Mean_Error ~ dat4$switch_type) ##signficant! ##ALT RUNS
t.test(dat5$Mean_Error ~ dat5$switch_type) ##signficant! ##RANDOM
