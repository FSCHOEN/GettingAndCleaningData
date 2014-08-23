## DEVELOPER : FSchoen
## $DATE : Wed Aug 20 17:41:42 2014
## REVISION : 0.1
## IDE : Rstudio, Version 0.98.994
## : R version 3.1.0 (2014-04-10) "Spring Dance"
## FILENAME : run_analysis.R
## OUTPUT : TidyData.txt
## DEPENDENCIES : Folder 'UCI HAR Dataset'
##  REFERENCE OF USED DATA: [1] Davide Anguita, Alessandro Ghio, Luca Oneto, 
##  Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
##  using a Multiclass Hardware-Friendly Support Vector Machine. International 
##  Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

#If data is not extracted yet, add the following code:
#fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL, "Dataset.zip", method="curl")
#unzip("Dataset.zip")

datapath <- "UCI HAR dataset"
if (!file.exists(datapath)) print(paste("No directory named ", datapath))

datanames <- list(
  "UCI HAR Dataset/train/X_train.txt", 
  "UCI HAR Dataset/test/X_test.txt",
  
  "UCI HAR Dataset/train/y_train.txt",
  "UCI HAR Dataset/test/y_test.txt",
  
  "UCI HAR Dataset/train/subject_train.txt", 
  "UCI HAR Dataset/test/subject_test.txt", 
  
  "UCI HAR Dataset/features.txt",
  "UCI HAR Dataset/activity_labels.txt")

rawdata <- sapply(datanames,read.table,simplify=FALSE)

###1. Merges the training and the test sets to create one data set.
sets <- rbind(rawdata[[1]],rawdata[[2]])
labels <- rbind(rawdata[[3]],rawdata[[4]])
subjects <- rbind(rawdata[[5]],rawdata[[6]]) 

features <- rawdata[[7]]
activity_labels <- rawdata[[8]]


###2. Extracts only the measurements on the mean and standard deviation for each measurement. 
mean_std <- grep("mean\\(\\)|std\\(\\)", features$V2)
names(sets)[mean_std] <- as.character(features$V2[mean_std]) 
sets <- sets[mean_std]

###3. Uses descriptive activity names to name the activities in the data set
activities <- as.factor(labels$V1)
levels(activities)<-as.vector(activity_labels$V2)

###4. Appropriately label the data set with descriptive variable names.
tmpNames <- names(sets) # temporal variable for storing the names

#Capitalization
tmpNames <- gsub("mean","Mean",tmpNames) 
tmpNames <- gsub("std","Std",tmpNames) 

#Removing punctuation
tmpNames <- gsub("[[:punct:]]","",tmpNames) 

#Correct "BodyBody"
tmpNames <- gsub("BodyBody","Body",tmpNames)

names(sets) <- tmpNames


allData <- cbind(subjects,activities,sets) #Merge data of subjects, activities and sets.

names(allData)[[1]] <- "Subject" # First Column
names(allData)[[2]] <- "Activity" #second column

#write.table(allData,file="allData.txt", row.name=FALSE)

rm(list=setdiff(ls(),"allData")) #Clean up.

###5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData_average_activity_subject <- aggregate(allData[,-1:-2],list(Subject=allData$Subject,Activity=allData$Activity),mean)
write.table(tidyData_average_activity_subject,file="tidyData_average_activity_subject.txt", row.name=FALSE)

