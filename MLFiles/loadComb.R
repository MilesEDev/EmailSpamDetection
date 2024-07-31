
Comb<-read.csv("combfile.csv")
test<-read.csv("email_spam_test.csv")
train<-read.csv("emails_spam_train.csv")


test<-rownames(test)
Combtest<-Comb[test,2:2404]

train<-rownames(train)
Combtrain<-Comb[train,2:2404]

