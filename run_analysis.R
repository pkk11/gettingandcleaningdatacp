run_analysis <- function() {
     
     library(dplyr)
     library(reshape2)
     
     ## goes into the dataset folder, retrieves data and returns to working directory
     ## I have included the variable names as columns in this step, using col.names and features.txt
     
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
     
     ## extracts only mean and standard deviation variables
     
     ## this is the manual method, which seems sound but could be error-prone
#           meanandstd = c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 
#                         242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519,
#                         531:532, 544:545)
#           meanandstd.data <- all.data[, meanandstd]

     ##this uses the select function of dplyr, to select for the true mean/std variables (66 total)

     all.data <- select(all.data, -contains("meanFreq")) #removes meanFreq variables
     meanandstd.data <- select(all.data, Subject, Activity, contains("mean", ignore.case=F), contains("std"))
     
     ## adds labels for the six activities, and turns the subject and activity columns to factors
     
     activities <- activities.table[,2]
     
     meanandstd.data[,1] <- factor(meanandstd.data[,1])
     meanandstd.data[,2] <- factor(meanandstd.data[,2], levels=c(1:6), labels=activities)

     ## this method gets mean of variables by tapply/factors and puts them in a list by variable
     ## but turning the list to a simple tidy dataset seems a bit tricky....

#      answer <- list()
#      
#      for (variable in variables) {
#           answer[[variable]] <- tapply(meanandstd.data[[variable]], 
#                                        INDEX=list(meanandstd.data$Subject, meanandstd.data$Activity), mean)
#      }
# 

     ## this method uses melt and dcast to arrive at a tidy dataset

     columns <- colnames(meanandstd.data)
     ids <- columns[c(1,2)]
     variables <- columns[-c(1,2)]
     
     datamelt <- melt(meanandstd.data, id=ids, measure.vars=variables)

     answer <- dcast(datamelt, Subject + Activity ~ variable, mean)

     ## writes answer
     
     write.table(answer, file = "tidydata.txt", row.names = F)
     
}