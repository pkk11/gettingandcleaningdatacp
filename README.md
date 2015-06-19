# This repository includes the Course Project for the Coursera course "Getting and Cleaning Data"
## The course is part of the Johns Hopkins Data Science Specialization 

##### For the project data, accelerometer and gyroscope data was obtained from a Samsung smartphone for 30 different subjects engaging in six different bodily motion activities.  The data was randomly partitioned into two data sets.  More information about the data is available here:  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##### The features.txt and features_info.txt files located in the dataset folder include more information on the data and the 561 variables collected for each observation.  Information is also contained in the codebook in this repository.

##### The course project involved reading this data from the downloaded file (the "UCI HAR Dataset" folder should be located in the working directory for the function to run properly), merging the two data sets into one, extracting the meanand standard deviation for each measurement, labeling the variables and activities with descriptive names and then creating an independent tidy data set ("tidydata.txt") with the average of each variable for each activity and subject.

##### The run_analysis function that accomplishes the above does so with the following steps:

##### First, the function goes into the UCI HAR Dataset folder and reads in the necessary files, with appropriate column names.  The function also reads the activity_labels.txt file, for activity labels.
##### Second, using cbind and rbind, the read-in data is combined into one combined dataframe for both the test and train data.
##### Third, using dplyr's select function, the variables that represent mean and standard deviation values are selected from the dataframe.
##### Fourth, the subject number and activity labels are changed to factors, and activity labels improved.
##### Finally, the dcast function is used to calculate the mean value of each variable by subject and activity, and those mean values are output to "tidydata.txt" using the write.table() function.
