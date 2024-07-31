
comb<-read.csv("combfile.csv")

library(caret)
library("e1071")
convert_counts <- function(x) {
  x <- ifelse(x > 0, 1, 0)
  x <- factor(x, levels = c(0, 1), labels = c("No", "Yes"))
  2
  return(x)
}


comb<-apply(comb,2,convert_counts)
comb <- as.data.frame(comb)
indxTrain <- createDataPartition(y = comb$Email.Class,p = 0.8,list = FALSE)
train <- comb[indxTrain,]
test <- comb[-indxTrain,]

NClassifier<-naiveBayes(train, train$Email.Class)

predicted<-predict(NClassifier, test, type="class")
predicted[1:100]

vecTest<-as.factor(test$Email.Class)
confusionMatrix(predicted, vecTest)
