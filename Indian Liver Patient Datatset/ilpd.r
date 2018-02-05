#Setting working directory
setwd("D:\\R_lang\\ILPD")

#loading dataset
dataset=read.csv("ILPD.csv")

#checking NA value
dataset_NA=dataset[rowSums(is.na(dataset))>0,]

#replacing NA value with mean value 
dataset$ag=ifelse(is.na(dataset$ag),
                  ave(dataset$ag,
                      FUN = function(x)mean(x,na.rm = TRUE)),
                    dataset$ag)
#checking count for missing value
table(is.na(dataset))

#categorical

dataset$sex=factor(x=dataset$sex,levels = c('Female','Male'),
                   labels=c(0,1))

datasetsex=dataset$sex

dataset=dataset[-2]
dataset$sex=datasetsex

#Splitting in testing and training
#install.packages("catTools")
library(caTools)
set.seed(11)

split=sample.split(dataset$label,SplitRatio = 0.8)
training_set=subset(dataset, split==TRUE)
test_set=subset(dataset, split==FALSE)

#feature scaling 

training_set[,1:9]=scale(training_set[,1:9])
test_set[,1:9]=scale(test_set[,1:9])

#building logistic regression to the training set

Classifier=glm(formula = label~.,
               family = binomial,
               data = training_set)

#predicting  the test set results
prod_pred=predict(Classifier,type ='response',newdata = test_set[-10])

y_pred=ifelse(prod_pred>0.5,1,0)

#Making the confusion matrix
cm=confusionMatrix(test_set[,10],y_pred)
#************************************************************
#KNN Model
library(class)
#k=3
y_pred_knn_3=knn(train=training_set[,-10],
               test=test_set[,-10],cl=training_set[,10],k=3)
#k=5
y_pred_knn_5=knn(train=training_set[,-10],
                 test=test_set[,-10],cl=training_set[,10],k=5)
#K=7
y_pred_knn_7=knn(train=training_set[,-10],
                 test=test_set[,-10],cl=training_set[,10],k=7)


cm_knn_3=confusionMatrix(test_set[,10],y_pred_knn_3)


cm_knn_5=confusionMatrix(test_set[,10],y_pred_knn_5)

cm_knn_7=confusionMatrix(test_set[,10],y_pred_knn_7)
#*************************************************

#Decision Tree

library(rpart)
DecTreeModel=rpart(formula =training_set$label~ .,data = training_set,method = "class")
y_pred_DecTree=predict(DecTreeModel,newdata = test_set[-10],type='class')
cm_dec_tree=confusionMatrix(test_set[,10],y_pred_DecTree)
cm_dec_tree
