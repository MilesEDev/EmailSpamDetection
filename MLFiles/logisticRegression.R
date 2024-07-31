library(caret)
sum(is.na(PCCombNew))


indxTrain <- createDataPartition(y = PCCombNew$Email.Class,p = 0.8,list = FALSE)
train <- PCCombNew[indxTrain,]
test <- PCCombNew[-indxTrain,]

logit2 <- glm(Email.Class~., family = binomial,data = train)


summary(logit2)

probabilities <- predict(logit2, test[1:90,], type = "response")
probabilities
predicted.classes <- ifelse(probabilities > 0.5, 1, 0)
predicted.classes


mean(predicted.classes == test[1:90,]$Email.Class)

