# Codebook

The run_analysis.R script performs the following operations:

- Check if the zip file already exists in WD; if not: download and unzip the file
- Read the individual datasets
        * features <- features.txt (561 rows, 2 columns): Features come from the accelerometer and gyroscope raw signals tACC-XYZ and tGyro-XYZ
        * activities <- activity_labels.txt (6 rows, 2 columns): Activities performed when the  measurements were taken and its codes (labels)
        * subject_test <- test/subject_test.txt (2947 rows, 1 column): Test data of 9/30 individuals
        * x_test <- test/X_test.txt (2947 rows, 561 columns): Recorded features test data
        * y_test <- test/y_test.txt (2947 rows, 1 columns): Test data of activities
        * subject_train <- test/subject_train.txt (7352 rows, 1 column): Training data of 21/30 individuals
        * x_train <- test/X_train.txt (7352 rows, 561 columns): Recorded features of training data
        * y_train <- test/y_train.txt (7352 rows, 1 columns): Training data of activities

- Merge the individuals datasets loaded in the previous step with rbind()
- Extract the measurements on the mean and standard deviation for each measurement with select()
- Change the activity codes to activity names stores in the "activities" dataframe
- Appropriately label the data set with descriptive variable names:
        * names(cleandata)[2] = "activity"
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