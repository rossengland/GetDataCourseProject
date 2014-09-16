
#Data Information#
The raw data managed by the run\_analysis.R script can be downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

These data contain measurements of motion of test subjects (age 19 - 48 years) wearing a Samsung Galaxy S II smartphone, which contains an in-built accelerometer and gyroscope, on their waists. For the purposes of the study, 30 subjects were enrolled and linear (along 3 axes--X, Y, and Z) and angular dynamic motion data was collected from their phones for 6 activity types (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, and Laying). 

#Instructions#
The run\_analysis.R script requires that the zip folder of data available at the link above be unzipped and placed as an intact, unaltered folder within the working directory of R.

run\_analysis.R should be placed in the working directory.

run\_analysis.R requires installation of the package "reshape2." This can be accomplished by running the script prior to running run\_analysis.R:

>install.packages("reshape2")

#Data Transformations#
The raw data contained measurement data and label data in separate tables. The raw measurement data were contained in unlabeled data frames in the files X\_test.txt and X\_train.txt. The variable names were contained in the features.txt. The activity types corresponding to the rows in X\_test.txt and X\_train.txt were respectively contained in y\_test.txt and y\_train.txt. Descriptive labels describing the activity types were contained in activity\_labels.txt. Subject ID numbers corresponding to the rows in X\_test.txt and X\_train.txt were respectively contained in subject\_test.txt and subject\_train.txt. 

The run\_analysis.R script loads all of these raw files into R. It replaces the activity type numbers in the y files with the descriptive names in activity\_labels.txt. It then binds the subject ID and activity label files as new columns in the X files, thereby adding a Subject ID number and Activity Type label to each row of measurement data. The features.txt data names were bound as a new row at the top of each X data table to add a row of variable names to each table. To create one data table, X\_test and X\_train were then bound to each other row-wise and sorted by SubjectID and Activity Type.

In order to create a new summary table with variable means ordered by SubjectID and Activity Type, the combined table was subsetted to include only mean and standard deviation variables. The combined table was then melted using SubjectID and Activity type as ID variables and was then recast using the mean function to create a summary table of means by SubjectID and Activity Type.

Please see README.md file in this repository for more details on the scripts used to accomplish this data transformation.

#Code Book#

The run.analysis.R script produces a tidy data set composed of 68 variables from the raw data renamed to give a better description of the measurement being reported.

##SubjectID
ID Number identifying each of the 30 study subjects. 

##ActivityType
Factor variable identifying the type of activity the test subject was engaged in.

##Mean\_BodyAcceleration_X
Raw Data Name: tBodyAcc-mean()-X

Reports the mean of the test subject's linear acceleration in the X axis.

Units: g (standard gravity units)

##Mean\_BodyAcceleration_Y
Raw Data Name: tBodyAcc-mean()-Y

Reports the mean of the test subject's linear acceleration in the Y axis.

Units: g (standard gravity units)


##Mean\_BodyAcceleration_Z
Raw Data Name: tBodyAcc-mean()-Z

Reports the mean of the test subject's linear acceleration in the Z axis.

Units: g (standard gravity units)

##StDev\_BodyAcceleration_X 
Raw Data Name: tBodyAcc-std()-X

Reports the standard deviation of the mean of the test subject's linear acceleration in the X axis.

Units: g (standard gravity units)
  
##StDev\_BodyAcceleration_Y         
Raw Data Name: tBodyAcc-std()-Y

Reports the standard deviation of the mean of the test subject's linear acceleration in the Y axis.

Units: g (standard gravity units)

##StDev\_BodyAcceleration_Z

Raw Data Name: tBodyAcc-std()-Z

Reports the standard deviation of the mean of the test subject's linear acceleration in the Z axis.

Units: g (standard gravity units)


##Mean\_GravityAcceleration_X
Raw Data Name: tGravityAcc-mean()-X

Reports the mean of the gravitational acceleration experienced by the test subject in the X axis.

Units: g (standard gravity units)

##Mean\_GravityAcceleration_Y
Raw Data Name: tGravityAcc-mean()-Y

Reports the mean of the gravitational acceleration experienced by the test subject in the Y axis.

Units: g (standard gravity units)

##Mean\_GravityAcceleration_Z
Raw Data Name: tGravityAcc-mean()-Z

Reports the mean of the gravitational acceleration experienced by the test subject in the Z axis.

Units: g (standard gravity units)

##StDev\_GravityAcceleration_X
Raw Data Name: tGravityAcc-std()-X

Reports the standard deviation of the mean of the gravitational acceleration experienced by the test subject in the X axis

Units: g (standard gravity units)

##StDev\_GravityAcceleration_Y
Raw Data Name: tGravityAcc-std()-Y

Reports the standard deviation of the mean of the gravitational acceleration experienced by the test subject in the Y axis

Units: g (standard gravity units)

##StDev\_GravityAcceleration_Z
Raw Data Name: tGravityAcc-std()-Z

Reports the standard deviation of the mean of the gravitational acceleration experienced by the test subject in the Z axis

Units: g (standard gravity units)

##Mean\_BodyJerk_X
Raw Data Name: tBodyAccJerk-mean()-X

Reports the mean of the test subject's jerk (rate of change of linear acceleration) in the X axis

Units: g/s (standard gravity units per second)

##Mean\_BodyJerk_Y
Raw Data Name: tBodyAccJerk-mean()-Y

Reports the mean of the test subject's jerk (rate of change of linear acceleration) in the Y axis

Units: g/s (standard gravity units per second)

##Mean\_BodyJerk_Z
Raw Data Name: tBodyAccJerk-mean()-Z

Reports the mean of the test subject's jerk (rate of change of linear acceleration) in the Z axis

Units: g/s (standard gravity units per second)

##StDev\_BodyJerk_X
Raw Data Name: tBodyAccJerk-std()-X

Reports standard deviation of the test subject's jerk (rate of change of linear acceleration) in the X axis

Units: g/s (standard gravity units per second)

##StDev\_BodyJerk_Y
Raw Data Name: tBodyAccJerk-std()-Y

Reports standard deviation of the test subject's jerk (rate of change of linear acceleration) in the Y axis

Units: g/s (standard gravity units per second)

##StDev\_BodyJerk_Z
Raw Data Name: tBodyAccJerk-std()-Z

Reports standard deviation of the test subject's jerk (rate of change of linear acceleration) in the Z axis

Units: g/s (standard gravity units per second)

##Mean\_BodyAngularVelocity_X
Raw Data Name: tBodyGyro-mean()-X

Reports the mean of the test subject's angular velocity in the X axis

Units: rad/s (radians per second)

##Mean\_BodyAngularVelocity_Y
Raw Data Name: tBodyGyro-mean()-Y

Reports the mean of the test subject's angular velocity in the Y axis

Units: rad/s (radians per second)

##Mean\_BodyAngularVelocity_Z
Raw Data Name: tBodyGyro-mean()-Z

Reports the mean of the test subject's angular velocity in the Z axis

Units: rad/s (radians per second)

##StDev\_BodyAngularVelocity_X
Raw Data Name: tBodyGyro-std()-X

Reports the standard deviation of the mean of the test subject's angular velocity in the X axis

Units: rad/s (radians per second)

##StDev\_BodyAngularVelocity_Y
Raw Data Name: tBodyGyro-std()-Y

Reports the standard deviation of the mean of the test subject's angular velocity in the Y axis

Units: rad/s (radians per second)

##StDev\_BodyAngularVelocity_Z
Raw Data Name: tBodyGyro-std()-Z

Reports the standard deviation of the mean of the test subject's angular velocity in the Z axis

Units: rad/s (radians per second)

##Mean\_BodyAngularJerk_X
Raw Data Name: tBodyGyroJerk-mean()-X

Reports the mean of the rate of change of the test subject's angular velocity in the X axis

Units: rad/s^2 (radians per second-squared)

##Mean\_BodyAngularJerk_Y
Raw Data Name: tBodyGyroJerk-mean()-Y

Reports the mean of the rate of change of the test subject's angular velocity in the Y axis

Units: rad/s^2 (radians per second-squared)

##Mean\_BodyAngularJerk_Z
Raw Data Name: tBodyGyroJerk-mean()-Z

Reports the mean of the rate of change of the test subject's angular velocity in the Z axis

Units: rad/s^2 (radians per second-squared)

##StDev\_BodyAngularJerk_X
Raw Data Name: tBodyGyroJerk-std()-X

Reports the standard deviation of the mean of the rate of change of the test subject's angular velocity in the X axis

Units: rad/s^2 (radians per second-squared)

##StDev\_BodyAngularJerk_Y
Raw Data Name: tBodyGyroJerk-std()-Y

Reports the standard deviation of the mean of the rate of change of the test subject's angular velocity in the Y axis

Units: rad/s^2 (radians per second-squared)

##StDev\_BodyAngularJerk_Z
Raw Data Name: tBodyGyroJerk-std()-Z

Reports the standard deviation of the mean of the rate of change of the test subject's angular velocity in the Z axis

Units: rad/s^2 (radians per second-squared)

##Mean\_BodyAccerlationMagnitude
Raw Data Name: tBodyAccMag-mean()

Reports the mean of the magnitude of the test subject's linear acceleration.

Units: g (standard gravity units)

##StDev\_BodyAccelerationMagnitude
Raw Data Name: tBodyAccMag-std()

Reports the standard deviation of the mean of the test subject's linear acceleration.

Units: g (standard gravity units)

##Mean\_GravityAccelerationMagnitude
Raw Data Name: tGravityAccMag-mean()

Reports the mean of the magnitude of the gravitational acceleration experienced by the test subject

Units: g (standard gravity units)

##StDev\_GravityAccelerationMagnitude
tGravityAccMag-std()

Reports the standard deviation of the mean of the magnitude of the gravitational acceleration experienced by the test subject

Units: g (standard gravity units)

##Mean\_BodyJerkMagnitude
Raw Data Name: tBodyAccJerkMag-mean()

Reports the mean of the magnitude of the rate of change of the test subject's linear acceleration

Units: g/s (standard gravity units per second)

##StDev\_BodyJerkMagnitude
Raw Data Name: tBodyAccJerkMag-std()

Reports the standard deviation of the mean of the magnitude of the rate of change of the test subject's linear acceleration

Units: g/s (standard gravity units per second)

##Mean\_BodyAngularVelocityMagnitude
Raw Data Name: tBodyGyroMag-mean()

Reports the mean of the magnitude of test subject's angular velocity

Units: rad/s (radians per second)

##StDev\_BodyAngularVelocityMagnitude
Raw Data Name: tBodyGyroMag-std()

Reports the standard deviation of the mean of the magnitude of test subject's angular velocity

Units: rad/s (radians per second)

##Mean\_BodyAngularJerkMagnitude
Raw Data Name: tBodyGyroJerkMag-mean()

Reports the mean rate of change of the test subject's angular velocity

Units: rad/s^2 (radians per second-squared)

##StDev\_BodyAngularJerkMagnitude
Raw Data Name: tBodyGyroJerkMag-std()

Reports the standard deviation of the mean rate of change of the test subject's angular velocity

Units: rad/s^2 (radians per second-squared)

##Mean\_FourierTransform\_of\_BodyAcceleration_X
Raw Data Name: fBodyAcc-mean()-X

Reports the mean Fast Fourier Transform of test subject's linear acceleration in the X axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAcceleration_Y
Raw Data Name: fBodyAcc-mean()-Y

Reports the mean Fast Fourier Transform of test subject's linear acceleration in the Y axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAcceleration_Z
Raw Data Name: fBodyAcc-mean()-Z

Reports the mean Fast Fourier Transform of test subject's linear acceleration in the Z axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAcceleration_X
Raw Data Name: fBodyAcc-std()-X

Reports the standard deviation of the Fast Fourier Transform of test subject's linear acceleration in the X axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAcceleration_Y
Raw Data Name: fBodyAcc-std()-Y

Reports the standard deviation of the Fast Fourier Transform of test subject's linear acceleration in the Y axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAcceleration_Z
Raw Data Name: fBodyAcc-std()-Z

Reports the standard deviation of the Fast Fourier Transform of test subject's linear acceleration in the Z axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyJerk_X
Raw Data Name: fBodyAccJerk-mean()-X

Reports the mean Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the X axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyJerk_Y
Raw Data Name: fBodyAccJerk-mean()-Y

Reports the mean Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the Y axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyJerk_Z
Raw Data Name: fBodyAccJerk-mean()-Z

Reports the mean Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the Z axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyJerk_X
Raw Data Name: fBodyAccJerk-std()-X

Reports the standard deviation of the  Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the X axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyJerk_Y
Raw Data Name: fBodyAccJerk-std()-Y

Reports the standard deviation of the  Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the Y axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyJerk_Z
Raw Data Name: fBodyAccJerk-std()-Z

Reports the standard deviation of the  Fast Fourier Transform of the rate of change of the test subject's linear acceleration in the Z axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAngularVelocity_X
Raw Data Name: fBodyGyro-mean()-X

Reports the mean Fast Fourier Transform of the test subject's angular velocity in the X axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAngularVelocity_Y
Raw Data Name: fBodyGyro-mean()-Y

Reports the mean Fast Fourier Transform of the test subject's angular velocity in the Y axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAngularVelocity_Z
Raw Data Name: fBodyGyro-mean()-Z

Reports the mean Fast Fourier Transform of the test subject's angular velocity in the Z axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAngularVelocity_X
Raw Data Name: fBodyGyro-std()-X

Reports the standard deviation of the Fast Fourier Transform of the test subject's angular velocity in the X axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAngularVelocity_Y
Raw Data Name: fBodyGyro-std()-Y

Reports the standard deviation of the Fast Fourier Transform of the test subject's angular velocity in the Y axis

Units: frequency

##StDev\_FourierTransform\_of\_BodyAngularVelocity_Z
Raw Data Name: fBodyGyro-std()-Z

Reports the standard deviation of the Fast Fourier Transform of the test subject's angular velocity in the Z axis

Units: frequency

##Mean\_FourierTransform\_of\_BodyAccelerationMagnitude
Raw Data Name: fBodyAccMag-mean()

Reports the mean Fast Fourier Transform of the test subject's linear acceleration magnitude

Units: frequency

##StDev\_FourierTransform\_of\_BodyAccelerationMagnitude
Raw Data Name: fBodyAccMag-std()

Reports the standard deviation of the Fast Fourier Transform of the test subject's linear acceleration magnitude

Units: frequency

##Mean\_FourierTransform\_of\_BodyJerkMagnitude
Raw Data Name: fBodyBodyAccJerkMag-mean()

Reports the mean Fast Fourier Transform of the test subject's linear acceleration rate-of-change magnitude

Units: frequency

##StDev\_FourierTransform\_of\_BodyJerkMagnitude
Raw Data Name: fBodyBodyAccJerkMag-std()

Reports the standard deviation of the  Fast Fourier Transform of the test subject's linear acceleration rate-of-change magnitude

Units: frequency

##Mean\_FourierTransform\_of\_BodyAngularVelocityMagnitude
Raw Data Name: fBodyBodyGyroMag-mean()

Reports the mean Fast Fourier Transform of the test subject's angular velocity magnitude

Units: frequency

##StDev\_FourierTransform\_of\_BodyAngularVelocityMagnitude
Raw Data Name: fBodyBodyGyroMag-std()

Reports the standard deviation of the Fast Fourier Transform of the test subject's angular velocity magnitude

Units: frequency

##Mean\_FourierTransform\_of\_BodyAngularJerkMagnitude
Raw Data Name: fBodyBodyGyroJerkMag-mean()

Reports the mean Fast Fourier Transform of the test subject's angular velocity rate-of-change magnitude

Units: frequency

##StDev\_FourierTransform\_of\_BodyAngularJerkMagnitude
Raw Data Name: fBodyBodyGyroJerkMag-std() 

Reports the standard deviation of the Fast Fourier Transform of the test subject's angular velocity rate-of-change magnitude

Units: frequency
