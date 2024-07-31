

setwd("C:/Users/Miles/OneDrive/Documents/myRprogram/Rass")

test<-read.csv("email_spam_test.csv")

train<-read.csv("emails_spam_train.csv")
comb<- rbind(train, test)


library(mice)
Missing_col<- comb[,3002]
lenVector<-length(Missing_col)
copyNACol<-data.frame(index=lenVector,useful=Missing_col)
imp_set<- complete(mice(data =copyNACol, m = 10, method = "mean", maxit=10))

comb[,3002]<-imp_set$useful



imp_set<- comb



correlated <- cor(imp_set[,2:3002])

names(imp_set)

correlated[,2]