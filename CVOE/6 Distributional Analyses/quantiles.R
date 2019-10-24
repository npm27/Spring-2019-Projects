##setup
library(tidyverse)

data = read.csv("Older_CVOE_Trimmed 10_12.csv")
colnames(data)[2] = "subject"
colnames(data)[12] = "rt"
#data$condition = rep("pure")

##subset into pure, switch, and non-switch subsets
pure = subset(data,
              data$block_type == "cv" | data$TASK == "oe")
switch.trial = subset(data,
                      data$Switch == "Y")
non_switch.trial = subset(data,
                          data$Switch == "N")

##add condition column
pure$condition = rep("pure")
switch.trial$condition = rep("switch")
non_switch.trial$condition = rep("non-switch")

##put it all back together
combined = rbind(pure, switch.trial, non_switch.trial)

#quantiles
data2 <- combined %>% group_by(subject,condition) %>% summarize(one = quantile(rt, probs = .1),two = quantile(rt, probs = .3),three = quantile(rt, probs = .5),four = quantile(rt, probs = .7), five = quantile(rt, probs = .9))

# vincentiles

num_vins = 6 # how many vincentiles do you want

data3 <- combined %>% group_by(subject,condition) %>% mutate(bin = ntile(rt,  num_vins)) %>% group_by(subject,condition,bin) %>% summarize(mean = mean(rt))

##write data
#write.csv(data3, file = "ya_vinc.csv", row.names = FALSE)

#split by healhty and mci
data3.healthy = subset(data3,
                       data3$subject < 2000)
data3.mci = subset(data3,
                       data3$subject >= 2000)

#write data
#write.csv(data3.healthy, file = "healthy_vinc.csv", row.names = FALSE)
#write.csv(data3.mci, file = "mci_vinc.csv", row.names = FALSE)
