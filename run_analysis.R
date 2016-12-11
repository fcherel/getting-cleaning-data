library(reshape2)

## 1. Reading the data into R

feat <- read.table("UCI HAR Dataset/features.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## 2. Renaming the variables

names(x_train) <- feat[[2]]
names(x_test) <- feat[[2]]
names(y_train) <- "activity"
names(y_test) <- "activity"
names(subject_train) <- "subject"
names(subject_test) <- "subject"

## 3. Using descriptive activity names

y_train[[1]] <- act_labels[y_train[[1]],2]
y_test[[1]] <- act_labels[y_test[[1]],2]

## 4. Merging all data

train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
alldata <- rbind(train, test)

## 5. Selecting only subject, activity and mean and standard deviation of each measurement

selection <- c(1, 2, grep("-mean\\(|-std\\(", names(alldata)))
selected_data <- alldata[, selection]

## 6. Taking the average of each variable of the selected data for each activity and each subject, using the reshape2 package

melt_selected <- melt(selected_data, id.vars=c("subject", "activity"))
avg_selected <- dcast(melt_selected, subject + activity ~ variable, mean, na.rm = TRUE)

