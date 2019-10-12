##set up
dat = read.csv("ya pure RTs.csv",header=TRUE) #change filename

colnames(dat)[1] = "sub"
colnames(dat)[2] = "rt.data"
dat$cond = rep(1)

dat$sub = as.factor(dat$sub) 

#binning the things
m = 6 #number of quantiles 
numsub = length(levels(dat$sub)) #number of subjects 

#make a 3-d array of 
#total number of quantiles before averaging 
cond1 = 1:(numsub*m) 

dim(cond1)=c(numsub,m) 

id=1 

#for nonswitch 

#for switch trials
for (s in 1:numsub) 
{ 
  choose.sub = levels(dat$sub)[s] 
  rt.data = dat$rt[dat$sub == choose.sub & dat$cond == "1"] 
  c = quantile(rt.data, .15) 
  e = quantile(rt.data, .30) 
  g = quantile(rt.data, .45) 
  i = quantile(rt.data, .60) 
  k = quantile(rt.data, .75) 
  m = quantile(rt.data, .90) 
  
  vincent = c(mean(c), mean(e), mean(g), mean(i), mean(k), mean(m)) 
  cond1[s, ] = vincent 
  id[s] = choose.sub 
} 

#put everything together
y = cbind(cond1) 
data.frame(y)

#write the output to a .csv
#write.csv(y, file = "yapurevencintiles.csv")