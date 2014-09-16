#Instructions for the run\_analysis.R Script
 * The input for this script is the raw data contained in the "getdata-projectfiles-UCI HAR Dataset" folder which can be found at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This zip file should be downloaded and unzipped into the working directory of R. Do not otherwise alter the folder of the files therein.
 * The output for this script is a tidy data set SamsungGalaxyMeanData.txt to the working directory
 * This script requires that you first install the reshape 2 package, which can be installed using the command install.packages("reshape2")
 * There are no parameters to this script
 * If reading output file back into R, use command read.table("SamsungGalaxyMeanData.txt", head=TRUE, row.names=NULL)

#How the Scripts Work

##1. Merging the training and test data sets into one data set and adding descriptive activity names to the activities in the data set (Assignment Goals: 1 and 3)
###1.1. First all files are read into data frames in R with object names corresponding to their file names.

> X_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
 
> y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")

>subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")

>X_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")

>y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")

>subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

>features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")

>activity_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

###1. 2. The variable names in the features data frame are applied as column names for X\_test and X\_train.

>names(features) <- c("Number", "Features")

>names(X_test) <- features$Features
 
>names(X_train) <- features$Features 

###1.3. The numerical activity types contained in the y\_test and y\_train data frames are converted to labeled factors and a descriptive variable name is added "ActivityType".

>ylevels <- c(1:6) 

>ylabels <- as.character(activity_labels$V2)
 
>names(y_test) <- "ActivityType" 

>names(y_train) <- "ActivityType" 

>y_test$ActivityType <- factor(y_test$ActivityType, levels = ylevels, labels = ylabels) 

>y_train$ActivityType <- factor(y_train$ActivityType, levels = ylevels, labels = ylabels) 

###1.4. The descriptive activity type data now contained in y\_test and y\_train are now added as new left-most columns in X\_test and X\_train respectively, thereby labeling each row with a corresponding activity type. the new data frame objects are called acttest and acttrain.

>acttest <- cbind(y_test, X_test) 

>acttrain <- cbind(y_train, X_train)

###1.5. The descriptive variable name "SubjectID" is applied as a column name for subject\_test and subject\_train. The subject\_test and subject\_train data frames are added as new left-most columns on the acttest and acttrain objects, thereby labeling each row with a corresponding test subject ID number. The new data frame objects are called subtest and subtrain.

>names(subject_test) <- "SubjectID" 

>names(subject_train) <- "SubjectID" 

>subtest <- cbind(subject_test, acttest) 

>subtrain <- cbind(subject_train, acttrain) 

###1.6. The subtest and subtrain objects are combined row-wise into a single data set, now called completedata.

>completedata <- rbind(subtest, subtrain)

##2. Extracting only the measurements on the mean and standard deviation for each measurement (Assignment Goals: 2)

###2.1. In order to extract only the variables containing mean and standard deviations of measurements, a vector meanstd is created containing the column indexes of all columns containing mean and standard deviation data.

>meanstd <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)

###2.2. completedata is subsetted using meanstd as a parameter, resulting in a new object, data, which contains only mean and standard deviation measurements.

>data <- completedata[ ,meanstd]

###2.3. To make the set more neat, the data object is sorted according to increasing subject ID number and Activity Type.

>data <- data[order(data$SubjectID, data$ActivityType), ]

##3. Appropriately labeling the data set with descriptive variable names (Assignment Goals: 4)
###3.1.An object called newvariablenames is created containing a character vector of more descriptive variable names for each variable in the object "data".

>newvariablenames <- c("SubjectID", "ActivityType", "Mean_BodyAcceleration_X", "Mean_BodyAcceleration_Y", "Mean_BodyAcceleration_Z", "StDev_BodyAcceleration_X", "StDev_BodyAcceleration_Y", "StDev_BodyAcceleration_Z", "Mean_GravityAcceleration_X", "Mean_GravityAcceleration_Y", "Mean_GravityAcceleration_Z", "StDev_GravityAcceleration_X", "StDev_GravityAcceleration_Y", "StDev_GravityAcceleration_Z", "Mean_BodyJerk_X", "Mean_BodyJerk_Y", "Mean_BodyJerk_Z", "StDev_BodyJerk_X", "StDev_BodyJerk_Y", "StDev_BodyJerk_Z", "Mean_BodyAngularVelocity_X", "Mean_BodyAngularVelocity_Y", "Mean_BodyAngularVelocity_Z", "StDev_BodyAngularVelocity_X", "StDev_BodyAngularVelocity_Y", "StDev_BodyAngularVelocity_Z", "Mean_BodyAngularJerk_X", "Mean_BodyAngularJerk_Y", "Mean_BodyAngularJerk_Z", "StDev_BodyAngularJerk_X", "StDev_BodyAngularJerk_Y", "StDev_BodyAngularJerk_Z", "Mean_BodyAccerlationMagnitude", "StDev_BodyAccelerationMagnitude", "Mean_GravityAccelerationMagnitude", "StDev_GravityAccelerationMagnitude", "Mean_BodyJerkMagnitude", "StDev_BodyJerkMagnitude", "Mean_BodyAngularVelocityMagnitude", "StDev_BodyAngularVelocityMagnitude", "Mean_BodyAngularJerkMagnitude", "StDev_BodyAngularJerkMagnitude", "Mean_FourierTransform_of_BodyAcceleration_X", "Mean_FourierTransform_of_BodyAcceleration_Y", "Mean_FourierTransform_of_BodyAcceleration_Z", "StDev_FourierTransform_of_BodyAcceleration_X","StDev_FourierTransform_of_BodyAcceleration_Y","StDev_FourierTransform_of_BodyAcceleration_Z", "Mean_FourierTransform_of_BodyJerk_X", "Mean_FourierTransform_of_BodyJerk_Y", "Mean_FourierTransform_of_BodyJerk_Z", "StDev_FourierTransform_of_BodyJerk_X", "StDev_FourierTransform_of_BodyJerk_Y", "StDev_FourierTransform_of_BodyJerk_Z", "Mean_FourierTransform_of_BodyAngularVelocity_X", "Mean_FourierTransform_of_BodyAngularVelocity_Y", "Mean_FourierTransform_of_BodyAngularVelocity_Z", "StDev_FourierTransform_of_BodyAngularVelocity_X", "StDev_FourierTransform_of_BodyAngularVelocity_Y", "StDev_FourierTransform_of_BodyAngularVelocity_Z", "Mean_FourierTransform_of_BodyAccelerationMagnitude", "StDev_FourierTransform_of_BodyAccelerationMagnitude", "Mean_FourierTransform_of_BodyJerkMagnitude", "StDev_FourierTransform_of_BodyJerkMagnitude", "Mean_FourierTransform_of_BodyAngularVelocityMagnitude", "StDev_FourierTransform_of_BodyAngularVelocityMagnitude", "Mean_FourierTransform_of_BodyAngularJerkMagnitude", "StDev_FourierTransform_of_BodyAngularJerkMagnitude")

###3.2.The names contained in newvariablenames are applied as row names to the data object

>names(data) <- newvariablenames

##4. Creating a second, independent tidy data set with the average of each variable for each activity and each subject (Assignment Goals: 5)
###4.1. Using the reshape2 package, the object "data" is melted using SubjectID and ActivityType as ID variables. The molten data, meltdata, is then recast applying the mean function to each variable according to SubjectID and ActivityType. The resulting data frame is called meandata.

>library(reshape2)

>meltdata <- melt(data, id=newvariablenames[1:2], measure.vars=newvariablenames[3:68])
 
>meandata <- dcast(meltdata, SubjectID + ActivityType ~ variable, mean) 

###4.2. The tidy data set containing mean data for each variable according to SubjectID and ActivityType is written into an output .txt file called "SamsungGalaxyMeanData.txt".

>write.table(meandata, file="SamsungGalaxyMeanData.txt", row.names=FALSE)


