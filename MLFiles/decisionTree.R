library(rpart)

convert_counts <- function(x) {
  x <- ifelse(x > 0, 1, 0)
  x <- factor(x, levels = c(0, 1), labels = c("Ham", "Spam"))
  return(x)
}
train2<-apply(train,
      2, convert_counts)

trainClass<-train

dtTree<-rpart(Email.Class~ ., data=trainClass, method="class")
comb_pred <- predict(dtTree,test,type = "class")
length(comb_pred)
length(test)
testFactor<-factor(test$Email.Class, levels = c(0, 1))
# The Confusion Matrix
confusionMatrix(data = comb_pred, reference = testFactor)

