library(caret)
library(randomForest)

classify<-as.factor(PCtrain$Email.Class)
PCtrain$Email.Class<-classify

PCtrain$Email.Class

PCtrain$emailNo

ctrl <- trainControl(method = "cv", number = 5)
rf_default <- train(Email.Class~., 
                    data=PCtrain, 
                    method='rf', 
                    trControl=ctrl)

summary(rf_default)

rf_default<-readRDS("rf.rds")
probabilities <- predict(rf_default,data = as.factor(PCtest$Email.Class),type="raw")
plot(rf_default)

confusionMatrix(probabilities,as.factor(PCtest$Email.Class))

length(probabilities)