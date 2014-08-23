# Getting and Cleaning Data - Peer Assessment/Course Project

## Overview

In this repository you will find the R-source code for the course project in the coursera course "Getting and Cleaning Data".
It contains:
1.README.md - this file
2.run_analysis.R - the R-source code
3. codeBook.md - describes the variables used in the data

## Raw Data

Name: Human Activity Recognition Using Smartphones 

Origin: UCI's Machine Learning Repository

Link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Source:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws 

Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The data set was downloaded and unzipped to its default folder named `UCI HAR Dataset`.

The raw data archive needs to be downloaded and extracted into 'UCI HAR Dataset' inside the R-Studio working directory.
(A script for doing so is provided in the source code).

##   Code description
The script run_analysis.R will do the following steps:
1. Merge the training set and the test set to create a single data set.
	* check if directory "UCI HAR Dataset" exists
	* convert files (for subjects, measurement sets and labels) into r-table objects
	* merge the tables
2. Extract the measurement on the mean and the standard deviation for each measurement.
	* find measurement types with "`std()`" or "`mean()`" in its name 
    * replace the default column names in measurement set
	* extract only relevant measurements
3. Use descriptive activity names to name the activities in the data set.
    * transform numeric activity labels into correct written names
4. Appropriately label the data set with descriptive variable names.
    * apply capitalization for names easier to read
    * fix typos
	* add proper names for subject and activity column
	* merge data of subjects, measurement sets and labels into one table
5. Create a second, independent tidy data set with the average of each variable for each activity and for each subject.
     * subset data by subject and activity
     * aggregate data by calculating the mean of all measurement types
     * write the returned table to hard disk
	 
## Output
`tidyData_average_activity_subject.txt` in R-working directory.




