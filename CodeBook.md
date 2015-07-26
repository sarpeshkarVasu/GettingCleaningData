#CodeBook for Course Project - Getting and Cleaning Data
26 July 2015

##Raw Data

Data was collected from the accelerometer data of Samsung Galaxy S smart phone project.
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Data file used for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
###Unzipped files from the above data:
*UCI HAR Dataset
*activity_labels.txt
*features.txt
*features_info.txt
*README.txt
*subject_test.txt,x_test,y_test,x_train,y_train in test and train folders

(Additional files not used for this analysis are skipped)

##File Descriptions:
x: rows of feature measurements
y: the activity labels corresponding to each row of X. Encoded as numbers.
subject: the subjects on which each row of X was measured. Encoded as numbers.
features
The encoding from activity labels ids to descriptive names.
activity_labels.txt

##Processing:
The data was extracted from each of the training and test dataset.
mean() and sd() columns were extracted from features.txt looking for patterns “-mean()” or “-std()”.

##Transformation
The activity descriptions were joined to the activity label data (y).
Used descriptive activity names to name the activities in the data set.
Extracted the activity data to pretty them:
Labelled the data set with descriptive variable names.
Changed t to Time, f to Frequency, mean() to Mean and std() to StdDev
Removed extra dashes etc. errors from original feature names
Added activities and subject with pretty names
Created a second, independent tidy data set with the average of each variable for each activity and each subject.
Column means calculated for all but the subject and activity columns

##Processed file
The processed file was saved as tidyMeans.txt which contains the average of each variable for 
each activity and each subject.