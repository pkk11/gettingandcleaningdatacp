run_analysis <- function() {
     
     ## goes into the dataset folder, retrieves data and returns to working directory
     
     setwd("UCI HAR Dataset")
     
     feature.names <- read.table("features.txt")
          
     test.subject <- read.table("test/subject_test.txt", col.names="Subject")
     test.data <- read.table("test/X_test.txt", col.names=feature.names[,2])
     test.activity <- read.table("test/y_test.txt", col.names="Activity")
     
     train.subject <- read.table("train/subject_train.txt", col.names="Subject")
     train.data <- read.table("train/X_train.txt", col.names=feature.names[,2])
     train.activity <- read.table("train/y_train.txt", col.names="Activity") 
     
     activities.table <- read.table("activity_labels.txt", stringsAsFactors=F)
     
     setwd("..")
     
     ## combines the test and train data
     
     test.data <- cbind(test.subject, test.activity, test.data)
     train.data <- cbind(train.subject, train.activity, train.data)
     all.data <- rbind(test.data, train.data)
     
     ## extract only mean and standard deviation
     
     ## this is the manual method
     meanandstd = c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 
                   242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519,
                   531:532, 544:545)

     ## this is the grep method
#      meanfeatures <- grep("mean", feature.names[,2])
#      stdfeatures <- grep("std", feature.names[,2])
#      meanandstd <- c(meanfeatures,stdfeatures)

     ##for both methods, this selects the data
     meanandstd.data <- all.data[, meanandstd]
     
     ## adds labels for the six activities, and turns the subject and activity columns to factors

     activities <- activities.table[,2]
     
     meanandstd.data[,1] <- factor(meanandstd.data[,1])
     meanandstd.data[,2] <- factor(meanandstd.data[,2], levels=c(1:6), labels=activities)

     ## improves variable names
     
     colnames(meanandstd.data) <- c("Subject", "Activity",
                                    "Body Acceleration - Mean - X axis",
                                    "Body Acceleration - Mean - Y axis",
                                    "Body Acceleration - Mean - Z axis", 
                                    "Body Acceleration - Standard Deviation - X axis",
                                    "Body Acceleration - Standard Deviation - Y axis",
                                    "Body Acceleration - Standard Deviation - Z axis", 
                                    "Gravity Acceleration - Mean - X axis",
                                    "Gravity Acceleration - Mean - Y axis",
                                    "Gravity Acceleration - Mean - Z axis", 
                                    "Gravity Acceleration - Standard Deviation - X axis",
                                    "Gravity Acceleration - Standard Deviation - Y axis",
                                    "Gravity Acceleration - Standard Deviation - Z axis",
                                    "Body Acceleration Jerk - Mean - X axis", 
                                    "Body Acceleration Jerk - Mean - Y axis",
                                    "Body Acceleration Jerk - Mean - Z axis",
                                    "Body Acceleration Jerk - Standard Deviation - X axis", 
                                    "Body Acceleration Jerk - Standard Deviation - Y axis",
                                    "Body Acceleration Jerk - Standard Deviation - Z axis",
                                    "Body Gyroscope - Mean - X axis", 
                                    "Body Gyroscope - Mean - Y axis",
                                    "Body Gyroscope - Mean - Z axis",
                                    "Body Gyroscope - Standard Deviation - X axis",
                                    "Body Gyroscope - Standard Deviation - Y axis", 
                                    "Body Gyroscope - Standard Deviation - Z axis",
                                    "Body Gyroscope Jerk - Mean - X axis",
                                    "Body Gyroscope Jerk - Mean - Y axis", 
                                    "Body Gyroscope Jerk - Mean - Z axis",
                                    "Body Gyroscope Jerk - Standard Deviation - X axis",
                                    "Body Gyroscope Jerk - Standard Deviation - Y axis", 
                                    "Body Gyroscope Jerk - Standard Deviation - Z axis",
                                    "Body Acceleration Magnitude - Mean",
                                    "Body Acceleration Magnitude - Standard Deviation",
                                    "Gravity Acceleration Magnitude - Mean",
                                    "Gravity Acceleration Magnitude - Standard Deviation",
                                    "Body Acceleration Jerk Magnitude - Mean",
                                    "Body Acceleration Jerk Magnitude - Standard Deviation",
                                    "Body Gyroscope Magnitude - Mean",
                                    "Body Gyroscope Magnitude - Standard Deviation",
                                    "Body Gyroscope Jerk Magnitude - Mean",
                                    "Body Gyroscope Jerk Magnitude - Standard Deviation",
                                    "Body Acceleration (frequency) - Mean - X axis",
                                    "Body Acceleration (frequency) - Mean - Y axis",
                                    "Body Acceleration (frequency) - Mean - Z axis", 
                                    "Body Acceleration (frequency) - Standard Deviation - X axis",
                                    "Body Acceleration (frequency) - Standard Deviation - Y axis",
                                    "Body Acceleration (frequency) - Standard Deviation - Z axis", 
                                    "Body Acceleration Jerk (frequency) - Mean - X axis",
                                    "Body Acceleration Jerk (frequency) - Mean - Y axis",
                                    "Body Acceleration Jerk (frequency) - Mean - Z axis", 
                                    "Body Acceleration Jerk (frequency) - Standard Deviation - X axis",
                                    "Body Acceleration Jerk (frequency) - Standard Deviation - Y axis",
                                    "Body Acceleration Jerk (frequency) - Standard Deviation - Z axis", 
                                    "Body Gyroscope (frequency) - Mean - X axis", 
                                    "Body Gyroscope (frequency) - Mean - Y axis",
                                    "Body Gyroscope (frequency) - Mean - Z axis",
                                    "Body Gyroscope (frequency) - Standard Deviation - X axis",
                                    "Body Gyroscope (frequency) - Standard Deviation - Y axis", 
                                    "Body Gyroscope (frequency) - Standard Deviation - Z axis",
                                    "Body Acceleration Magnitude (frequency) - Mean",
                                    "Body Acceleration Magnitude (frequency) - Standard Deviation",
                                    "Body Acceleration Jerk Magnitude (frequency) - Mean",
                                    "Body Acceleration Jerk Magnitude (frequency) - Standard Deviation",
                                    "Body Gyroscope Magnitude (frequency) - Mean",
                                    "Body Gyroscope Magnitude (frequency) - Standard Deviation",
                                    "Body Gyroscope Jerk Magnitude (frequency) - Mean",
                                    "Body Gyroscope Jerk Magnitude (frequency) - Standard Deviation"
                                   )

     ## gets mean of variables by tapply/factors and puts them in a list by variable

     variables <- colnames(meanandstd.data)
     variables <- variables[-c(1,2)]

     answer <- list()

     for (variable in variables) {
          answer[[variable]] <- tapply(meanandstd.data[[variable]], 
                              INDEX=list(meanandstd.data$Subject, meanandstd.data$Activity), mean)
     }

     ## prints answer

     write.table(answer, file = "tidydata.txt", row.names = F)
     
}