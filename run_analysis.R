###Before beginning, make sure that both the run_analysis.R Rscript and the Samsung Galaxy data
###contained in the folder "getdata-projectfiles-UCI HAR Dataset" are in your working directory


##Read all files into R

X_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

##Reconstruct test and train data frames by adding label rows

#add variable labels from the "features" dataframe to test (X_test) and train (X_train) dataframes
names(features) <- c("Number", "Features") #rename variable column as Features
names(X_test) <- features$Features #use features variable names to name columns of X_test
names(X_train) <- features$Features #use features variable names to name columns of X_train

#change activity type variables (y_test, y_train) to factors and add as column in test and train dataframes
ylevels <- c(1:6) #label vector for the numeric activity levels
ylabels <- as.character(activity_labels$V2) #character vector for the names we want to replace those numeric activity levels with
names(y_test) <- "ActivityType" #descriptive variable name for activity type
names(y_train) <- "ActivityType" #descriptive variable name for activity type
y_test$ActivityType <- factor(y_test$ActivityType, levels = ylevels, labels = ylabels) #change y_test into descriptive activity names
y_train$ActivityType <- factor(y_train$ActivityType, levels = ylevels, labels = ylabels) #change y_train into descriptive activity names
acttest <- cbind(y_test, X_test) #add y_test as column 1 on X_test
acttrain <- cbind(y_train, X_train) #add y_train as column 1 on X_train

#label subject_test and subject_train as "SubjectID" and add as column in test and train dataframes
names(subject_test) <- "SubjectID" #descriptive variable name for Subject ID number
names(subject_train) <- "SubjectID" #descriptive variable name for Subject ID number
subtest <- cbind(subject_test, acttest) #add subject ID numbers to test data
subtrain <- cbind(subject_train, acttrain) #add subject ID numbers to train data

##Merge test and train datasets into completedata using rbind function
completedata <- rbind(subtest, subtrain)

##Extract only mean and standard deviation variables
#vector of columns containing means and standard deviations
meanstd <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)
#subset completedata by the columns contained in meanstd vector
data <- completedata[ ,meanstd]
#reorder the resulting data frame in increasing order of SubjectID and ActivityType
data <- data[order(data$SubjectID, data$ActivityType), ]

##Appropriately label the data with descriptive variable names (see code book for more detail)
#create character vector newvariablenames with descriptive variable names for data set
newvariablenames <- c("SubjectID", "ActivityType", "Mean_BodyAcceleration_X", "Mean_BodyAcceleration_Y", "Mean_BodyAcceleration_Z", "StDev_BodyAcceleration_X", "StDev_BodyAcceleration_Y", "StDev_BodyAcceleration_Z", "Mean_GravityAcceleration_X", "Mean_GravityAcceleration_Y", "Mean_GravityAcceleration_Z", "StDev_GravityAcceleration_X", "StDev_GravityAcceleration_Y", "StDev_GravityAcceleration_Z", "Mean_BodyJerk_X", "Mean_BodyJerk_Y", "Mean_BodyJerk_Z", "StDev_BodyJerk_X", "StDev_BodyJerk_Y", "StDev_BodyJerk_Z", "Mean_BodyAngularVelocity_X", "Mean_BodyAngularVelocity_Y", "Mean_BodyAngularVelocity_Z", "StDev_BodyAngularVelocity_X", "StDev_BodyAngularVelocity_Y", "StDev_BodyAngularVelocity_Z", "Mean_BodyAngularJerk_X", "Mean_BodyAngularJerk_Y", "Mean_BodyAngularJerk_Z", "StDev_BodyAngularJerk_X", "StDev_BodyAngularJerk_Y", "StDev_BodyAngularJerk_Z", "Mean_BodyAccerlationMagnitude", "StDev_BodyAccelerationMagnitude", "Mean_GravityAccelerationMagnitude", "StDev_GravityAccelerationMagnitude", "Mean_BodyJerkMagnitude", "StDev_BodyJerkMagnitude", "Mean_BodyAngularVelocityMagnitude", "StDev_BodyAngularVelocityMagnitude", "Mean_BodyAngularJerkMagnitude", "StDev_BodyAngularJerkMagnitude", "Mean_FourierTransform_of_BodyAcceleration_X", "Mean_FourierTransform_of_BodyAcceleration_Y", "Mean_FourierTransform_of_BodyAcceleration_Z", "StDev_FourierTransform_of_BodyAcceleration_X","StDev_FourierTransform_of_BodyAcceleration_Y","StDev_FourierTransform_of_BodyAcceleration_Z", "Mean_FourierTransform_of_BodyJerk_X", "Mean_FourierTransform_of_BodyJerk_Y", "Mean_FourierTransform_of_BodyJerk_Z", "StDev_FourierTransform_of_BodyJerk_X", "StDev_FourierTransform_of_BodyJerk_Y", "StDev_FourierTransform_of_BodyJerk_Z", "Mean_FourierTransform_of_BodyAngularVelocity_X", "Mean_FourierTransform_of_BodyAngularVelocity_Y", "Mean_FourierTransform_of_BodyAngularVelocity_Z", "StDev_FourierTransform_of_BodyAngularVelocity_X", "StDev_FourierTransform_of_BodyAngularVelocity_Y", "StDev_FourierTransform_of_BodyAngularVelocity_Z", "Mean_FourierTransform_of_BodyAccelerationMagnitude", "StDev_FourierTransform_of_BodyAccelerationMagnitude", "Mean_FourierTransform_of_BodyJerkMagnitude", "StDev_FourierTransform_of_BodyJerkMagnitude", "Mean_FourierTransform_of_BodyAngularVelocityMagnitude", "StDev_FourierTransform_of_BodyAngularVelocityMagnitude", "Mean_FourierTransform_of_BodyAngularJerkMagnitude", "StDev_FourierTransform_of_BodyAngularJerkMagnitude")
#apply newvariablenames to dataset
names(data) <- newvariablenames

##Generate new data set with variable means for each Subject and Activity
#requires installation of reshape2 package
library(reshape2)
meltdata <- melt(data, id=newvariablenames[1:2], measure.vars=newvariablenames[3:68]) #melt data using SubjectID and ActivityType as ID variables
meandata <- dcast(meltdata, SubjectID + ActivityType ~ variable, mean) #Cast the molten data with the dcast mean function to get a summary table of means for every SubjectID and ActivityType

#write file to working directory
write.table(meandata, file="SamsungGalaxyMeanData.txt", row.names=FALSE)

##file to be read back into R using 
# read.table("SamsungGalaxyMeanData.txt", header=TRUE, row.names=NULL)
