PCComb<-read.csv("noModPCA.csv")

sum(is.na(PCComb))
PCCombNew<-PCComb[,2:903]
nrow(PCComb)
names(PCCombNew)