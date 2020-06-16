
#Downloading, unziping and loading data

#First, I remove everything in my global environment and set my working directory
rm(list=ls())
setwd("~/Google Drive/CARPETA FACU-CASA/Econometría y métodos/Data Science/Cursos R coursera/2020/Curso 2. Getting and Cleaning Data/Final assignment")

#I download the files (they are in zip)
if(!file.exists("data")){dir.create("data")}
FileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(FileURL,destfile="./data/wearables.zip", method= "curl")
list.files("./data")

# Unzip databases to /data directory, defining the path in which the new folder is located:
unzip(zipfile="./data/wearables.zip",exdir="./data")
list.files("./data")
pathdata = file.path("./data", "UCI HAR Dataset")
#create a file which has the 28 file names. Recursives allows the function to navigate inside the folders within this folder
files = list.files(pathdata, recursive=TRUE)
files

"READING DATA"
#Train datasets:
x_train <-read.table(file.path(pathdata, "train", "X_train.txt"), header=FALSE)
y_train  <-read.table(file.path(pathdata, "train", "y_train.txt"), header=FALSE)
subject_train <- read.table(file.path(pathdata, "train", "subject_train.txt"), header=FALSE)

#Test datasets:
x_test = read.table(file.path(pathdata, "test", "X_test.txt"),header = FALSE)
y_test = read.table(file.path(pathdata, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathdata, "test", "subject_test.txt"),header = FALSE)


###Naming variables before joining datasets:
features = read.table(file.path(pathdata, "features.txt"),header = FALSE)
activity_labels = read.table(file.path(pathdata, "activity_labels.txt"),header = FALSE)
#Activity names for the train dataset:
colnames(x_train) = features[,2]
colnames(y_train) = "activityId"
colnames(subject_train) = "subjectId"
#Activity names por the test dataset:
colnames(x_test) = features[,2]
colnames(y_test) = "activityId"
colnames(subject_test) = "subjectId"
#labeling the columns in activity labels
colnames(activity_labels) <- c('activityId','activityType')


#1. Merging the training and the test sets to create one data set.
merged_train = cbind(y_train, subject_train, x_train)
merged_test = cbind(y_test, subject_test, x_test)
completedata = rbind(merged_train, merged_test)

#2. Extracting only the measurements on the mean and standard deviation for each measurement
colNames = colnames(completedata)
subset_mean_std = completedata[,(grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))]


#3. Uses descriptive activity names to name the activities in the data set
##I merge it with the activity_labels dataset, in which we can find both the activityId and activity type (the labels)
subset_mean_std_labeled = merge(subset_mean_std, activity_labels, by="activityId")


#4. Appropriately labels the data set with descriptive variable names.
#We use the ones provided by the dataset creators. We labeled the variables appropriately before starting with point 1 of the exercise.
#Therefore, this point is already addressed.


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
tidy_dataset <- subset_mean_std_labeled %>% group_by(activityType, subjectId) %>% summarize_all(mean, na.rm=TRUE)
#I export the dataset in tidy format.
write.csv(tidy_dataset, "./data/tidy_dataset.csv", row.names=F)


