dat = read.csv('output 2_14 with labels.csv')

##rearrange so each row has jol and recall for word for each participant
sub1 = subset(dat,
              dat$task == 'jol')
sub2 = subset(dat,
              dat$task == 'recall')

dat.final = cbind(sub1, sub2)

colnames(dat.final)[11] = "cue_prompt"
colnames(dat.final)[13] = "recall_response"
colnames(dat.final)[14] = "task2"

dat.final = dat.final[ , -c(8:10, 12)]

##make sure jol prompt and recall prompts match
library(stringr)

dat.final$jol.short = str_sub(dat.final$cue_target, 1, 4)
dat.final$recall.short = str_sub(dat.final$cue_prompt, 1, 4)

dat.final$match = dat.final$jol.short == dat.final$recall.short

#write.csv(dat.final, file = "output 2_14 final.csv")
