#install new packages
install.packages("readr")

#load packages
library(readr)

#uploading data
DatasetName <- read.csv('cars.csv')

#getting to know the data

#List your attributes within your data set
attributes(DatasetName)

#Prints the min, max, mean, median, and quartiles of each attribute
summary(DatasetName)

#Displays the structure of your data set
str(DatasetName)

#Displays the attributes within your data set
names(DatasetName)

#Will print out the instances within that particular column of your data set
DatasetName$name.of.car

#histogram plot
hist(DatasetName$speed.of.car)

#scatter (box) plot
plot(DatasetName$speed.of.car,DatasetName$distance.of.car)

#normal quantile plot to see if data is normally distributed
qqnorm(DatasetName$speed.of.car)

#how to change data types
DatasetName$name.of.car <- as.factor(DatasetName$name.of.car)

#how to rename attributes/columns
names(DatasetName) <- c("name","speed","distance")

#check how many missing values exist
summary(DatasetName)

#or (True if missing, False if present)
is.na(DatasetName)

#how to address missing values

#Remove any observations missing data
#use this if the missing data is less than 10% o the total data 
#and compare min/max of all features with and without missing data

#If you want the rows with missing values to be dropped and omitted forever
#na.omit(DatasetName$name)

#if you want to drop rows with missing values but keep track of where they were
#na.exclude(DatasetName$name)

#if you want to replace missing values with the mean.
#be careful but it can skew the data
#DatasetName$speed[is.na(DatsetName$speed)] <- mean(DatasetName$speed,na.rm = TRUE)

#creating testing and training sets for linear regression model
#123 is a common seed for a sequence of random numbers. 
#Use the same seed number through the modeling process to use the same set of random numbers

set.seed(123)

#split the data into training and test sets
#common split is 70/30 - 70% of the data is the training set size
#30% of the data is the test set.
#80/20 is also common.

trainSize <- round(nrow(DatasetName)*0.7)
testSize <- nrow(DatasetName)-trainSize

#see how many instances will be in each set
trainSize
testSize

#create the training and test sets
training_indices <- sample(seq_len(nrow(DatasetName)),size=trainSize)
trainSet <- DatasetName[training_indices,]
testSet <- DatasetName[-training_indices,]

#Linear Regression Model
# x -- predictor variable -- independent variable (doesn't depend on other attributes while making predictions)
# y -- response variable -- dependent variable (value depends on other variables)

#for this model, speed and distance will be the variables
#trying to predict distance, so it is Y
#speed is the independent/predictor/X variable.

#linear model function
distanceModel <- lm(distance~ speed, trainSet)

#check to see if this is an optimal model
summary(distanceModel)

#metrics
#multiple r-squared - how well regression line fits the data (1 is perfect fit)

#p-value how much the independent variable/predictor affects the dependent variable/response.
#p-value > .05 mean the independent variable has no effect on the dependent variable
#p-value < .095 means the relationship is statistically significant

#Predictions
#predict the cars distances through the speed of the cars
#use the prediction function - predict()

distancePrediction <- predict(distanceModel,testSet)

#view the predictions
distancePrediction

#output of distancePrediction


