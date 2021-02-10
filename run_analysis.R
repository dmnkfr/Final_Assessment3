### You should create one R script called run_analysis.R that does the following. 
### - Merges the training and the test sets to create one data set.
### - Extracts only the measurements on the mean and standard deviation for each measurement. 
### - Uses descriptive activity names to name the activities in the data set
### - Appropriately labels the data set with descriptive variable names. 
### - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Prepare
# load packages
library(data.table)
library(dplyr)

# Check if file exists, download and unzip if not
zipfile <- "UCI Dataset.zip"
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists(zipfile)){
  download.file(fileurl, zipfile, method = 'curl')
  unzip(zipfile, exdir = getwd())
}

# Load all dataframes
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

### Create Clean Dataset
# Merge training and test data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
mergeddata <- cbind(subject, y, x)
head(mergeddata)

# Extract the measurements on the mean and standard deviation for each measurement
cleandata  <- mergeddata %>% 
        select(subject, code, contains("mean"), contains("std"))

# Change to descriptive activity names (from activities data)
cleandata$code <- activities[cleandata$code, 2]

# Appropriately label the data set with descriptive variable names
names(cleandata)[2] = "activity"
names(cleandata)<-gsub("Acc", "Accelerometer", names(cleandata))
names(cleandata)<-gsub("Gyro", "Gyroscope", names(cleandata))
names(cleandata)<-gsub("BodyBody", "Body", names(cleandata))
names(cleandata)<-gsub("Mag", "Magnitude", names(cleandata))
names(cleandata)<-gsub("^t", "Time", names(cleandata))
names(cleandata)<-gsub("^f", "Frequency", names(cleandata))
names(cleandata)<-gsub("tBody", "TimeBody", names(cleandata))
names(cleandata)<-gsub("-mean()", "Mean", names(cleandata), ignore.case = TRUE)
names(cleandata)<-gsub("-std()", "STD", names(cleandata), ignore.case = TRUE)
names(cleandata)<-gsub("-freq()", "Frequency", names(cleandata), ignore.case = TRUE)
names(cleandata)<-gsub("angle", "Angle", names(cleandata))
names(cleandata)<-gsub("gravity", "Gravity", names(cleandata))

### Create final tidy data set
tidydata <- cleandata %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(tidydata, "tidydata.txt", row.name=FALSE)

### Some checks
str(tidydata)
