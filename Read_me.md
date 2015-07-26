# Read me!

#This is a project requirement for Coursera's Getting and Cleaning course.
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set using R.
The goal was to prepare tidy data that can be used for later analysis. 
This read_me explains how all of the scripts work and how they are connected.  

#The main script is called run_analysis.R which does the following:
* Extracts data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
* Unzips the data.
* Merges the training and the test sets.
* Reads and caches XTrain and XTest data.
* Reads features.txt file.
* Extracts only mean and standard deviation for each measurement.
* Limits to columns with feature names matching mean() or standard deviation().
* Uses descriptive activity names to name the activities in the data set.
* Gets the activity data and makes them more human readable
* Labels the data set with descriptive variable names.
* Changes t to Time, f to Frequency, mean() to Mean and std() to StdDev.
* Removes extra dashes and errors from original feature names.
* Add activities and subject with pretty names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Column means extracted for all but the subject and activity columns.
* Finally the ultimate goal is reached when the tidy data is written to tidyMeans.txt

## Note:
* setInternet2(TRUE) is used in the code to download data. "Curl" was not compatible with my computer.
* For processing data needs to be a folder called "data".



