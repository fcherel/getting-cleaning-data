library(dplyr)

## Reading the data into R

feat <- read.table("UCI HAR Dataset/features.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Renaming the variables

names(x_train) <- feat[[2]]
names(x_test) <- feat[[2]]
names(y_train) <- "activity"
names(y_test) <- "activity"

## Using descriptive activity names

y_train[[1]] <- act_labels[y_train[[1]],2]
y_test[[1]] <- act_labels[y_test[[1]],2]


