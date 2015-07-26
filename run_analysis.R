run_analysis <- function() {
  # Get and extract data
  library(plyr)
  setInternet2(use=TRUE) ## not working with curl
  filePath <- function(...) { paste(..., sep = "/") }
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    
  zipFile <-  "dataset.zip"
         
  dataDir <- "UCI HAR Dataset"
  unzip(zipFile, exdir = ".")
    
  # Merge the training and the test sets.
   
  readData <- function(path) {
    read.table(filePath(dataDir, path))
  }
  
  # Read and cache XTrain and XTest data
  XTrain <<- readData("train/X_train.txt") 
  XTest  <<- readData("test/X_test.txt") 
  merged <- rbind(XTrain, XTest)

  # Read features.txt 
  feature_names <- readData("features.txt")[, 2]
  names(merged) <- feature_names
  
  # Extract only mean and sd for each measurement.
  # Limit to columns with feature names matching mean() or std():
  matches <- grep("(mean|std)\\(\\)", names(merged))
  limited <- merged[, matches]
  
  # Use descriptive activity names to name the activities in the data set.
  # Get the activity data and pretty them:
  yTrain <- readData("train/y_train.txt")
  yTest  <- readData("test/y_test.txt")
  yMerged <- rbind(yTrain, yTest)[, 1]
   
  activityNames <-
  c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")
    activities <- activityNames[yMerged]
  
  # Label the data set with descriptive variable names.
  # Change t to Time, f to Frequency, mean() to Mean and std() to StdDev
  # Remove extra dashes etc. errors from original feature names
  names(limited) <- gsub("^t", "Time", names(limited))
  names(limited) <- gsub("^f", "Frequency", names(limited))
  names(limited) <- gsub("-mean\\(\\)", "Mean", names(limited))
  names(limited) <- gsub("-std\\(\\)", "StdDev", names(limited))
  names(limited) <- gsub("-", "", names(limited))
  names(limited) <- gsub("BodyBody", "Body", names(limited))
  
  # Add activities and subject with pretty names
  subjectTrain <- readData("train/subject_train.txt")
  subjectTest  <- readData("test/subject_test.txt")
  subjects <- rbind(subjectTrain, subjectTest)[, 1]
  
  tidy <- cbind(Subject = subjects, Activity = activities, limited)
   
  # Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  # Column means for all but the subject and activity columns
  limitedColMeans <- function(data) { colMeans(data[,-c(1,2)]) }
  tidyMeans <- ddply(tidy, .(Subject, Activity), limitedColMeans)
  names(tidyMeans)[-c(1,2)] <- paste0("Mean", names(tidyMeans)[-c(1,2)])
  
  # Write to file
  write.table(tidyMeans, "tidyMeans.txt", row.names = FALSE)   
  tidyMeans

}
