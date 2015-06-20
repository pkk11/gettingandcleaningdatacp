##Code Book for tidydata.txt

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See below and http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for more details. 

####The tidy data is in the form of a 180x68 column data table.  The columns are as follows:

####1 - Subject
  This is a factor with levels 1 - 30, for each human subject in the experiment.
  
####2 - Activity
  This is a factor with the levels below, for each of the body movement activities in the experiment:
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING

####3-68 - Variables
  For each combination of Subject and Activity (180 rows), there are values for 66 additional variables.  The variables are the *mean* values for a number of different trials of each activity performed by each subject.  The 66 variables are:
  
                          Body Acceleration (time)- Mean - X axis  =  tBodyAcc-mean()-X
                          Body Acceleration (time)- Mean - Y axis  =  tBodyAcc-mean()-Y
                          Body Acceleration (time)- Mean - Z axis  =  tBodyAcc-mean()-Z 
                          Body Acceleration (time)- Standard Deviation - X axis  =  tBodyAcc-std()-X
                          Body Acceleration (time)- Standard Deviation - Y axis  =  tBodyAcc-std()-Y
                          Body Acceleration (time)- Standard Deviation - Z axis  =  tBodyAcc-std()-Z
                          Gravity Acceleration (time)- Mean - X axis  =  tGravityAcc-mean()-X
                          Gravity Acceleration (time)- Mean - Y axis  =  tGravityAcc-mean()-Y
                          Gravity Acceleration (time)- Mean - Z axis  =  tGravityAcc-mean()-Z
                          Gravity Acceleration (time)- Standard Deviation - X axis  =  tGravityAcc-std()-X
                          Gravity Acceleration (time)- Standard Deviation - Y axis  =  tGravityAcc-std()-Y
                          Gravity Acceleration (time)- Standard Deviation - Z axis  =  tGravityAcc-std()-Z
                          Body Acceleration Jerk (time)- Mean - X axis  =  tBodyAccJerk-mean()-X
                          Body Acceleration Jerk (time)- Mean - Y axis  =  tBodyAccJerk-mean()-Y
                          Body Acceleration Jerk (time)- Mean - Z axis  =  tBodyAccJerk-mean()-Z
                          Body Acceleration Jerk (time)- Standard Deviation - X axis  =  tBodyAccJerk-std()-X
                          Body Acceleration Jerk (time)- Standard Deviation - Y axis  =  tBodyAccJerk-std()-Y
                          Body Acceleration Jerk (time)- Standard Deviation - Z axis  =  tBodyAccJerk-std()-Z
                          Body Gyroscope (time)- Mean - X axis  =  tBodyGyro-mean()-X
                          Body Gyroscope (time)- Mean - Y axis  =  tBodyGyro-mean()-Y
                          Body Gyroscope (time)- Mean - Z axis  =  tBodyGyro-mean()-Z
                          Body Gyroscope (time)- Standard Deviation - X axis  =  tBodyGyro-std()-X
                          Body Gyroscope (time)- Standard Deviation - Y axis  =  tBodyGyro-std()-Y
                          Body Gyroscope (time)- Standard Deviation - Z axis  =  tBodyGyro-std()-Z
                          Body Gyroscope Jerk (time)- Mean - X axis  =  tBodyGyroJerk-mean()-X
                          Body Gyroscope Jerk (time)- Mean - Y axis  =  tBodyGyroJerk-mean()-Y
                          Body Gyroscope Jerk (time)- Mean - Z axis  =  tBodyGyroJerk-mean()-Z
                          Body Gyroscope Jerk (time)- Standard Deviation - X axis  =  tBodyGyroJerk-std()-X
                          Body Gyroscope Jerk (time)- Standard Deviation - Y axis  =  tBodyGyroJerk-std()-Y
                          Body Gyroscope Jerk (time)- Standard Deviation - Z axis  =  tBodyGyroJerk-std()-Z
                          Body Acceleration Magnitude (time)- Mean  =  tBodyAccMag-mean()
                          Body Acceleration Magnitude (time)- Standard Deviation  =  tBodyAccMag-std()
                          Gravity Acceleration Magnitude (time)- Mean  =  tGravityAccMag-mean()
                          Gravity Acceleration Magnitude (time)- Standard Deviation  =  tGravityAccMag-std()
                          Body Acceleration Jerk Magnitude (time)- Mean  =  tBodyAccJerkMag-mean()
                          Body Acceleration Jerk Magnitude (time)- Standard Deviation  =  tBodyAccJerkMag-std()
                          Body Gyroscope Magnitude (time)- Mean  =  tBodyGyroMag-mean()
                          Body Gyroscope Magnitude (time)- Standard Deviation  =  tBodyGyroMag-std()
                          Body Gyroscope Jerk Magnitude (time)- Mean  =  tBodyGyroJerkMag-mean()
                          Body Gyroscope Jerk Magnitude (time)- Standard Deviation  =  tBodyGyroJerkMag-std()
                          Body Acceleration (frequency) - Mean - X axis  =  fBodyAcc-mean()-X
                          Body Acceleration (frequency) - Mean - Y axis  =  fBodyAcc-mean()-Y
                          Body Acceleration (frequency) - Mean - Z axis  =  fBodyAcc-mean()-Z
                          Body Acceleration (frequency) - Standard Deviation - X axis  =  fBodyAcc-std()-X
                          Body Acceleration (frequency) - Standard Deviation - Y axis  =  fBodyAcc-std()-Y
                          Body Acceleration (frequency) - Standard Deviation - Z axis  =  fBodyAcc-std()-Z
                          Body Acceleration Jerk (frequency) - Mean - X axis  =  fBodyAccJerk-mean()-X
                          Body Acceleration Jerk (frequency) - Mean - Y axis  =  fBodyAccJerk-mean()-Y
                          Body Acceleration Jerk (frequency) - Mean - Z axis  =  fBodyAccJerk-mean()-Z
                          Body Acceleration Jerk (frequency) - Standard Deviation - X axis  =  fBodyAccJerk-std()-X
                          Body Acceleration Jerk (frequency) - Standard Deviation - Y axis  =  fBodyAccJerk-std()-Y
                          Body Acceleration Jerk (frequency) - Standard Deviation - Z axis  =  fBodyAccJerk-std()-Z
                          Body Gyroscope (frequency) - Mean - X axis  =  fBodyGyro-mean()-X
                          Body Gyroscope (frequency) - Mean - Y axis  =  fBodyGyro-mean()-Y
                          Body Gyroscope (frequency) - Mean - Z axis  =  fBodyGyro-mean()-Z
                          Body Gyroscope (frequency) - Standard Deviation - X axis  =  fBodyGyro-std()-X
                          Body Gyroscope (frequency) - Standard Deviation - Y axis  =  fBodyGyro-std()-Y
                          Body Gyroscope (frequency) - Standard Deviation - Z axis  =  fBodyGyro-std()-Z
                          Body Acceleration Magnitude (frequency) - Mean  =  fBodyAccMag-mean()
                          Body Acceleration Magnitude (frequency) - Standard Deviation  =  fBodyAccMag-std()
                          Body Acceleration Jerk Magnitude (frequency) - Mean  =  fBodyBodyAccJerkMag-mean()
                          Body Acceleration Jerk Magnitude (frequency) - Standard Deviation  =  fBodyBodyAccJerkMag-std()
                          Body Gyroscope Magnitude (frequency) - Mean  =  fBodyBodyGyroMag-mean()
                          Body Gyroscope Magnitude (frequency) - Standard Deviation  =  fBodyBodyGyroMag-std()
                          Body Gyroscope Jerk Magnitude (frequency) - Mean  =  fBodyBodyGyroJerkMag-mean()
                          Body Gyroscope Jerk Magnitude (frequency) - Standard Deviation  =  fBodyBodyGyroJerkMag-std()

The values come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals *(prefix 't' to denote time)* were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. *(Note the 'f' to indicate frequency domain signals)*. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For more information about the data set, please see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
