##set up
dat = read.csv("output 2_14 final.csv")

library(ggplot2)
library(reshape)

##put recall on correct scale
dat$Scored_Response = (dat$Scored_Response * 100) 

##make jol score numeric
dat$Jol_Response = as.numeric(dat$Jol_Response)

##make 101's = 100
dat$Jol_Response[dat$Jol_Response > "100"] = NA

##get sample size
summary(dat$Subject) #n = 18

##remove missing
nomissing = na.omit(dat)

##get descriptives
tapply(nomissing$Jol_Response,
       nomissing$Direction, mean)
tapply(nomissing$Jol_Response,
       nomissing$Direction, sd)

tapply(nomissing$Scored_Response,
       nomissing$Direction, mean)
tapply(nomissing$Scored_Response,
       nomissing$Direction, sd)

####make the graph####
nomiss = na.omit(long.dat)

##melt the data
long.dat = melt(dat, id = c("Subject", "Block",
                               "ListNum", "Direction", "ExperimentName", "cue_target",
                               "recall_response", "cue_prompt"))

summary(long.dat)

colnames(long.dat)[9] = "Task"
colnames(long.dat)[10] = "Score"

cleanup = theme(panel.grid.major = element_blank(), 
                panel.grid.minor = element_blank(), 
                panel.background = element_blank(), 
                axis.line = element_line(colour = "black"), 
                legend.key = element_rect(fill = "white"),
                text = element_text(size = 15))

bar1 = ggplot(nomiss, aes(Direction, Score, fill = Task))
bar1 = bar1 +
  stat_summary(fun.y = mean, 
               geom = "bar",
               position = "dodge",
               color = "Black") +
  stat_summary(fun.data = mean_cl_normal,                
               geom = "errorbar", 
               position = position_dodge(width = 0.90),
               width = 0.2,
               color = "black") +
  scale_fill_manual("Task",
                    values = c("Jol_Response" = "indianred4",
                               "Scored_Response" = "dimgray")) +
  cleanup +
  xlab("Direction") +
  ylab("Mean Task Performance") +
  ylim(0,100) +
  labs(title="All Blocks") 
bar1
