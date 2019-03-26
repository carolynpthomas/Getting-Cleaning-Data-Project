#Getting and Cleaning Data Project
# Smartphones data on exercise

#load dplyr for text editing
library(dplyr)

#download data set
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="SmartphonesData.zip")

# Unzip data set to new directory
dir <- getwd()
folder <- "/SmartphonesData"
if(!file.exists(folder)){dir.create(folder)}
unzip(zipfile="SmartphonesData.zip", exdir =paste0(dir,folder))

# read training data
folder2 <- "/UCI HAR Dataset"
filepath <- paste0(dir,folder,folder2) 
subject_train <- read.table(file.path(filepath, "train", "subject_train.txt"))
x_train <- read.table(file.path(filepath, "train", "X_train.txt"))
y_train <- read.table(file.path(filepath, "train", "y_train.txt"))

# read test data
subject_test <- read.table(file.path(filepath, "test", "subject_test.txt"))
x_test <- read.table(file.path(filepath, "test", "X_test.txt"))
y_test <- read.table(file.path(filepath, "test", "y_test.txt"))

# read features
features <- read.table(file.path(filepath, "features.txt"))

# read activity labels
activity_labels <- read.table(file.path(filepath, "activity_labels.txt"))

# assign column names
colnames(subject_train) <- "subjectID"
colnames(subject_test) <- "subjectID"
colnames(x_train) <- features[,2]
colnames(x_test) <- features[,2]
colnames(y_train) <- "activityID"
colnames(y_test) <- "activityID"
colnames(features) <- c("featureID", "featureName")
colnames(activity_labels) <- c("activityID", "activityLabel")

#merge data into one data set
allTest <- cbind(subject_test, y_test, x_test)
allTrain <- cbind(subject_train, y_train, x_train)
allRows <- rbind(allTest, allTrain)

#change activity id to have descriptive labels, and set subjectID as a factor
allRows$activityID <- factor(allRows$activityID, levels = activity_labels[,1], labels = activity_labels[,2])
allRows$subjectID <- as.factor(allRows$subjectID)

#subset the data on the columns containing mean and standard deviation
meanStd <- allRows[ , grepl("activityID|subjectID|mean|std",colnames(allRows)) == TRUE]

#clean up the column names to be more descriptive
meanStdColumns <- colnames(meanStd)
meanStdColumns_Clean <- gsub("^t", "time", meanStdColumns, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("^f","frequency", meanStdColumns_Clean, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("[()]","",meanStdColumns_Clean)
meanStdColumns_Clean <- gsub("mean", "Mean", meanStdColumns_Clean, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("std", "Std", meanStdColumns_Clean, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("acc", "Acceleration", meanStdColumns_Clean, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("gyro", "Gyroscope", meanStdColumns_Clean, ignore.case = TRUE)
meanStdColumns_Clean <- gsub("mag", "Magnitude", meanStdColumns_Clean, ignore.case = TRUE)

#assign clean column names to the data containing means and standard deviations
colnames(meanStd) <- meanStdColumns_Clean

#View column names for Code Book
View(meanStdColumns_Clean)

#create an independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- aggregate(. ~subjectID + activityID, meanStd, mean)

# write dataset to "tidy_data.txt"
write.table(tidydata, "tidy_data.txt", row.names = FALSE, quote = FALSE)