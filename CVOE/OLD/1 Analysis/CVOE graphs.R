####Analyses and graphs####
##set up and load libraries
library(ez)
library(reshape)
library(ggplot2)
library(Hmisc)

#source(descriptives.R)

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

####global vs local switch costs####
dat6 = output_errors[ , c(8:11)]
