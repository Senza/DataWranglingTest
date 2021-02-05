# change to match your csv file location
setwd('D:/MyWorks/Softwares/DataWranglingTest/source')

store <-
  read.csv("store.csv",
           header = TRUE)
train <-
  read.csv("train.csv",
           header = TRUE)


str(store)
head(store, 100)
summary(store)
typesOfStores <- unique(store$StoreType)
typesOfStores

typesOfAssortment <- unique(store$Assortment)
typesOfAssortment

str(train)
head(train)

head(train$DayOfWeek)
DaysOfTheWeek <- unique(train$DayOfWeek)
DaysOfTheWeek

totalSales <- sum(train$Sales)
totalSales

