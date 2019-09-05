####Set up####
##load the data
ya = read.csv("0 Full Output/younger.csv")
oa = read.csv("0 Full Output/healthy.csv")
mci = read.csv("0 Full Output/mci.csv")

##now drop the means and what not from the bottom
ya = ya[c(1:38), ] ##note that these numbers will change
oa = oa[c(1:16), ]
mci = mci[c(1:11), ]

####now start subsetting!####
##I'm going to need subsets based on age (which I already have), RT vs Error, and the different trial types

##Younger
#first get all the subject numbers
ya_subID = as.numeric(as.character(ya$subID))
ya_subID = as.data.frame(ya_subID)

####now lets do errors####
y_pe = as.numeric(as.character(ya$PURE.ERRORS))
y_ase = as.numeric(as.character(ya$ALT.SWITCH.ERRORS))
y_anse = as.numeric(as.character(ya$ALT.NON.SWITCH.ERROR))
y_rse = as.numeric(as.character(ya$RAND.SWITCH.ERROR))
y_rnse = as.numeric(as.character(ya$RAND.NON.SWITCH.ERROR))
y_local_alt = as.numeric(as.character(ya$LOCAL.ALT))
y_local_rand = as.numeric(as.character(ya$LOCAL.RAND))
y_global_alt = as.numeric(as.character(ya$GLOBAL.ALT))
y_global_rand = as.numeric(as.character(ya$GLOBAL.RAND))

##now put things together and write it to a .csv
##pure errors
x = as.data.frame(y_pe)

y = cbind(ya_subID, x)
colnames(y)[2] = "pure_errors"
write.csv(y, file = "1 ya/ya pure errors.csv")

##alt switch errors
x = as.data.frame(y_ase)

y = cbind(ya_subID, x)
colnames(y)[2] = "altswitch_errors"
write.csv(y, file = "1 ya/ya alt switch errors.csv")

##alt non-switch errors
x = as.data.frame(y_anse)

y = cbind(ya_subID, x)
colnames(y)[2] = "altnonswitch_errors"
write.csv(y, file = "1 ya/ya alt non switch errors.csv")

##rand switch errors
x = as.data.frame(y_rse)

y = cbind(ya_subID, x)
colnames(y)[2] = "randswitch_errors"
write.csv(y, file = "1 ya/ya rand switch errors.csv")

##rand non-switch errors
x = as.data.frame(y_rnse)

y = cbind(ya_subID, x)
colnames(y)[2] = "randnonswitch_errors"
write.csv(y, file = "1 ya/ya rand non switch errors.csv")

##local alt errors
x = as.data.frame(y_local_alt)

y = cbind(ya_subID, x)
colnames(y)[2] = "local_alt_errors"
write.csv(y, file = "1 ya/ya local alt errors.csv")

##local rand errors
x = as.data.frame(y_local_rand)

y = cbind(ya_subID, x)
colnames(y)[2] = "local_rand_errors"
write.csv(y, file = "1 ya/ya loal rand errors.csv")

##global alt errors
x = as.data.frame(y_global_alt)

y = cbind(ya_subID, x)
colnames(y)[2] = "global_alt_errors"
write.csv(y, file = "1 ya/ya global alt errors.csv")

##global rand errors
x = as.data.frame(y_global_rand)

y = cbind(ya_subID, x)
colnames(y)[2] = "global_rand_errors"
write.csv(y, file = "1 ya/ya global rand errors.csv")

####now repeat but w/ RTs####
y_pe = as.numeric(as.character(ya$PURE.RT))
y_ase = as.numeric(as.character(ya$ALT.SWITCH.RT))
y_anse = as.numeric(as.character(ya$ALT.NON.SWITCH.RT))
y_rse = as.numeric(as.character(ya$RAND.SWITCH.RT))
y_rnse = as.numeric(as.character(ya$RAND.NON.SWITCH.RT))
y_local_alt = as.numeric(as.character(ya$LOCAL.ALT.RT))
y_local_rand = as.numeric(as.character(ya$LOCAL.RAND.RT))
y_global_alt = as.numeric(as.character(ya$GLOBAL.ALT.RT))
y_global_rand = as.numeric(as.character(ya$GLOBAL.RAND.RT))

##now put things together and write it to a .csv
##pure RT
x = as.data.frame(y_pe)

y = cbind(ya_subID, x)
colnames(y)[2] = "pure_RTs"
write.csv(y, file = "1 ya/ya pure RTs.csv")

##alt switch RT
x = as.data.frame(y_ase)

y = cbind(ya_subID, x)
colnames(y)[2] = "altswitch_RTs"
write.csv(y, file = "1 ya/ya alt switch RTs.csv")

##alt non-switch RT
x = as.data.frame(y_anse)

y = cbind(ya_subID, x)
colnames(y)[2] = "altnonswitch_RTs"
write.csv(y, file = "1 ya/ya alt non switch RTs.csv")

##rand switch RT
x = as.data.frame(y_rse)

y = cbind(ya_subID, x)
colnames(y)[2] = "randswitch_RTs"
write.csv(y, file = "1 ya/ya rand switch RTs.csv")

##rand non-switch RT
x = as.data.frame(y_rnse)

y = cbind(ya_subID, x)
colnames(y)[2] = "randnonswitch_RTs"
write.csv(y, file = "1 ya/ya rand non switch RTs.csv")

##local alt RT
x = as.data.frame(y_local_alt)

y = cbind(ya_subID, x)
colnames(y)[2] = "local_alt_RTs"
write.csv(y, file = "1 ya/ya local alt RTs.csv")

##local rand RT
x = as.data.frame(y_local_rand)

y = cbind(ya_subID, x)
colnames(y)[2] = "local_rand_RTs"
write.csv(y, file = "1 ya/ya loal rand RTs.csv")

##global alt RT
x = as.data.frame(y_global_alt)

y = cbind(ya_subID, x)
colnames(y)[2] = "global_alt_RTs"
write.csv(y, file = "1 ya/ya global alt RTs.csv")

##global rand RT
x = as.data.frame(y_global_rand)

y = cbind(ya_subID, x)
colnames(y)[2] = "global_rand_RTs"
write.csv(y, file = "1 ya/ya global rand RTs.csv")