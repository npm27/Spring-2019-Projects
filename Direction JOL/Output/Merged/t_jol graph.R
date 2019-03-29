##set up
dat = read.csv("ex2 final output.csv")

library(ggplot2)
library(reshape)

##put recall on correct scale
dat$Scored_Response = (dat$Scored_Response * 100) 

##remove out of range scores
dat$Jol_Response[dat$Jol_Response > 100] = NA

##get sample size
summary(dat$Subject) #n = 27

summary(dat)

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

##fix column names
colnames(nomissing)[6] = "Jol"
colnames(nomissing)[9] = "Recall"

####make the graph####

##melt the data
long.dat = melt(nomissing, id = c("Subject", "Block",
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

bar1 = ggplot(long.dat, aes(Direction, Score, fill = Task))
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
                    values = c("Jol" = "midnightblue",
                               "Recall" = "dodgerblue")) +
  cleanup +
  xlab("Direction") +
  ylab("Mean Task Performance")
  #ylim(0,100)
  #labs(title="All Blocks") 
bar1

##get means
tapply(nomissing$Scored_Response,
       nomissing$Direction, mean)
tapply(nomissing$Scored_Response,
       nomissing$Direction, sd)

tapply(nomissing$Jol_Response,
       nomissing$Direction, mean)
tapply(nomissing$Jol_Response,
       nomissing$Direction, sd)

tapply(dat$Scored_Response, nomissing$Direction, length)
tapply(nomissing$Jol_Response, nomissing$Direction, length)

##run the ANOVAS
library(ez)

##recall
ezANOVA(data = nomissing,
        wid = Subject,
        within = Direction,
        dv = Scored_Response,
        type = 3)

##JOL
ezANOVA(data = nomissing,
        wid = Subject,
        within = Direction,
        dv = Jol_Response,
        type = 3)

##do post hocs
##Recall
pairwise.t.test(nomissing$Scored_Response, nomissing$Direction,
                paired = F)

##JOL
pairwise.t.test(nomissing$Jol_Response, nomissing$Direction,
                paired = F)

##get effect sizes
library(MOTE)

####Cohen's D for posthocs####
##JOL

##F & B
jfb = d.dep.t.avg(62.24917, 58.27500, 32.40954, 32.93337, 880, a = .05)  #d = .12
jfb.d = round(jfb$d, digits = 2)

##F & S
jfs = d.dep.t.avg(62.24917, 66.42011, 32.40954, 32.30136, 880, a = .05) #d = -.13
jfs.d = round(jfs$d, digits = 2)

##F & U
jfu = d.dep.t.avg(62.24917, 22.09742, 32.40954, 24.82979, 880, a = .05) #d = 1.4
jfu.d = round(jfu$d, digits = 2)

##B & S
jbs = d.dep.t.avg(58.27500, 66.42011, 32.93337, 32.30136, 880, a = .05) #d = -.25
jbs.d = round(jbs$d, digits = 2)

##B & U
jbu = d.dep.t.avg(58.27500, 22.09742, 32.93337, 24.82979, 880, a = .05) #d = 1.25
jbu.d = round(jbu$d, digits = 2)

##S & U
jsu = d.dep.t.avg(66.42011, 22.09742, 32.30136, 24.82979, 880, a = .05) #d = 1.55
jsu.d = round(jsu$d, digits = 2)

##Recall

##F & B
rfb = d.dep.t.avg(67.55260, 31.47727, 46.84374, 46.46894, 1080, a = .05) #d = .77
rfb.d = round(rfb$d, digits = 2)

##F & S
rfs = d.dep.t.avg(67.55260, 60.44693, 46.84374, 48.92378, 880, a = .05) #d = .15
rfs.d = round(rfs$d, digits = 2)

##F & U
rfu = d.dep.t.avg(67.55260, 10.92593, 46.84374, 31.21087, 880, a = .05) #d = 1.45
rfu.d = round(rfu$d, digits = 2)

##B & S
rbs = d.dep.t.avg(31.47727, 60.44693, 46.46894, 48.92378, 880, a = .05) #d = -.61
rbs.d = round(rbs$d, digits = 2)

##B & U
rbu = d.dep.t.avg(31.47727, 12.31803, 46.46894, 32.88282, 880, a = .05) #d = .48
rbu.d = round(rbu$d, digits = 2)

##S & U
rsu = d.dep.t.avg(60.44693, 12.31803, 48.92378, 32.88282, 880, a = .05) #d = 1.18
rsu.d = round(rsu$d, digits = 2)