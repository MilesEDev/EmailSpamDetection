
setwd("P:/Downloads/Rass/Rass/CutterFiles")


test<-read.csv("email_spam_test.csv")

train<-read.csv("emails_spam_train.csv")
comb<- rbind(train, test)

z_score_stand<-as.data.frame(lapply(imp_set[2:3002], scale))

z_score_stand