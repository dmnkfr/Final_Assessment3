# Codebook
### List of Features

### Identifiers
* `subject_id`: ID of the volunteer ranging from 1 - 30
* `activity_name`: specific activities individuals were performing, includes: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`

### Measured Variables
#### feature info
* `t`: time domain signal
* `Acc`: acceleration signal
* `Gyro`: gyroscope signal
* `Jerk`: jerk signal obtained from linear acceleration and angular velocity
* `Mag`: magnitude of signal
* `-XYZ`: 3-axial signals in the `X`, `Y`, `Z` directions
* `f`: fast Fourier transform of the signal
* `mean()`: statistical mean applied to the time domain signal
* `std()`: standard deviation of the time domain signal
* `Body`: results from human movement
* `Gravity`: results from gravitational force

#### feature detail
* `tBodyAcc-mean()-X`
* `tBodyAcc-mean()-Y`
* `tBodyAcc-mean()-Z`
* `tBodyAcc-std()-X`
* `tBodyAcc-std()-Y`
* `tBodyAcc-std()-Z`
* `tGravityAcc-mean()-X`
* `tGravityAcc-mean()-Y`
* `tGravityAcc-mean()-Z`
* `tGravityAcc-std()-X`
* `tGravityAcc-std()-Y`
* `tGravityAcc-std()-Z`
* `tBodyAccJerk-mean()-X`
* `tBodyAccJerk-mean()-Y`
* `tBodyAccJerk-mean()-Z`
* `tBodyAccJerk-std()-X`
* `tBodyAccJerk-std()-Y`
* `tBodyAccJerk-std()-Z`
* `tBodyGyro-mean()-X`
* `tBodyGyro-mean()-Y`
* `tBodyGyro-mean()-Z`
* `tBodyGyro-std()-X`
* `tBodyGyro-std()-Y`
* `tBodyGyro-std()-Z`
* `tBodyGyroJerk-mean()-X`
* `tBodyGyroJerk-mean()-Y`
* `tBodyGyroJerk-mean()-Z`
* `tBodyGyroJerk-std()-X`
* `tBodyGyroJerk-std()-Y`
* `tBodyGyroJerk-std()-Z`
* `tBodyAccMag-mean()`
* `tBodyAccMag-std()`
* `tGravityAccMag-mean()`
* `tGravityAccMag-std()`
* `tBodyAccJerkMag-mean()`
* `tBodyAccJerkMag-std()`
* `tBodyGyroMag-mean()`
* `tBodyGyroMag-std()`
* `tBodyGyroJerkMag-mean()`
* `tBodyGyroJerkMag-std()`
* `fBodyAcc-mean()-X`
* `fBodyAcc-mean()-Y`
* `fBodyAcc-mean()-Z`
* `fBodyAcc-std()-X`
* `fBodyAcc-std()-Y`
* `fBodyAcc-std()-Z`
* `fBodyAcc-meanFreq()-X`
* `fBodyAcc-meanFreq()-Y`
* `fBodyAcc-meanFreq()-Z`
* `fBodyAccJerk-mean()-X`
* `fBodyAccJerk-mean()-Y`
* `fBodyAccJerk-mean()-Z`
* `fBodyAccJerk-std()-X`
* `fBodyAccJerk-std()-Y`
* `fBodyAccJerk-std()-Z`
* `fBodyAccJerk-meanFreq()-X`
* `fBodyAccJerk-meanFreq()-Y`
* `fBodyAccJerk-meanFreq()-Z`
* `fBodyGyro-mean()-X`
* `fBodyGyro-mean()-Y`
* `fBodyGyro-mean()-Z`
* `fBodyGyro-std()-X`
* `fBodyGyro-std()-Y`
* `fBodyGyro-std()-Z`
* `fBodyGyro-meanFreq()-X`
* `fBodyGyro-meanFreq()-Y`
* `fBodyGyro-meanFreq()-Z`
* `fBodyAccMag-mean()`
* `fBodyAccMag-std()`
* `fBodyAccMag-meanFreq()`
* `fBodyBodyAccJerkMag-mean()`
* `fBodyBodyAccJerkMag-std()`
* `fBodyBodyAccJerkMag-meanFreq()`
* `fBodyBodyGyroMag-mean()`
* `fBodyBodyGyroMag-std()`
* `fBodyBodyGyroMag-meanFreq()`
* `fBodyBodyGyroJerkMag-mean()`
* `fBodyBodyGyroJerkMag-std()`
* `fBodyBodyGyroJerkMag-meanFreq()`


### Script Operations
The run_analysis.R script performs the following operations:

- Check if the zip file already exists in WD; if not: download and unzip the file
- Read the individual datasets:
  - features <- features.txt (561 rows, 2 columns): Features come from the accelerometer and gyroscope raw signals tACC-XYZ and tGyro-XYZ
  - activities <- activity_labels.txt (6 rows, 2 columns): Activities performed when the  measurements were taken and its codes (labels)
  - subject_test <- test/subject_test.txt (2947 rows, 1 column): Test data of 9/30 individuals
  - x_test <- test/X_test.txt (2947 rows, 561 columns): Recorded features test data
  - y_test <- test/y_test.txt (2947 rows, 1 columns): Test data of activities
  - subject_train <- test/subject_train.txt (7352 rows, 1 column): Training data of 21/30 individuals
  - x_train <- test/X_train.txt (7352 rows, 561 columns): Recorded features of training data
  - y_train <- test/y_train.txt (7352 rows, 1 columns): Training data of activities

- Merge the individuals datasets loaded in the previous step with `bind()`
- Extract the measurements on the mean and standard deviation for each measurement with select()
- Change the activity codes to activity names stores in the "activities" dataframe
- Appropriately label the data set with descriptive variable names using `gsub()`:
  - rename column "code" to "activity"
  - replace "Acc" with "Accelerometer",
  - replace "Gyro" with "Gyroscope",
  - replace "BodyBody" with "Body",
  - replace "Mag" with "Magnitude",
  - replace "^t" with "Time",
  - replace "^f" with "Frequency",
  - replace "tBody" with "TimeBody",
  - replace "-mean()" with "Mean"
  - replace "-std()" with "STD"
  - replace "-freq()" with "Frequency"
  - replace "angle" with "Angle"
  - replace "gravity" with "Gravity"

- Create an independent tidy data set with the average of each variable for each activity and each subject, which is exported to WD as "tidydata.txt"

### The result __tidydata.txt__ has 180 rows and 88 columns.