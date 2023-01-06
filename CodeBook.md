Origin of the data
--------------------
The data comes from an experiment performed to 30 volunteers. They were asked to perform some activities wearing a smartphone on their waist. 
I´ve only use the mean and standar deviations calculations from "X_train.txt", "y_train.txt", "subject_train", "X_test.txt", "y_test.txt", "subject_test" 
in order to create the merged data frame "mergeddata". The variables from these data set will be described next.

Variables
--------------------
I´ve used the same logic that is explained in the "features.txt" in order to name the variables. To understand the meaning of the variable you need to be aware of the following:
(a) For the first character, "t" will denote time and "f" will denote a frequency domain signal obtained from a Fast Fourier Transform.
(b) "Acc" and "Gyro" are the signals from the accelerometer and gyroscope, respectively.
(c) The character "Body" or "Gravity" will mean the body or gravity signal, respectively, obtanined from a 3rd order low pass Butterworth filter.
(d) The character Jerk refers to the Jerk signal.
(e) The character "Mag" is the magnitude calculated using the Euclidean norm.
(f) XYZ ito denote 3-axial signals in the X, Y and Z directions.
(g) Finally, "mean()" and "std()" will denote the mean and the standard deviation from the variable.

To ilustrate, consider the variable "tBodyAccMag-mean()". This variable will denote the mean ("mean()") of the Euclidean norm ("Mag") of the body acceleration signal ("BodyAcc")
for the X direction. Additional to these variables we have also included the variables "activity" and "subject".

This is the list of variables:

 tBodyAcc-mean()-X
 tBodyAcc-mean()-Y
 tBodyAcc-mean()-Z
 tBodyAcc-std()-X
 tBodyAcc-std()-Y
 tBodyAcc-std()-Z
 tGravityAcc-mean()-X
 tGravityAcc-mean()-Y
 tGravityAcc-mean()-Z
 tGravityAcc-std()-X
 tGravityAcc-std()-Y
 tGravityAcc-std()-Z
 tBodyAccJerk-mean()-X
 tBodyAccJerk-mean()-Y
 tBodyAccJerk-mean()-Z
 tBodyAccJerk-std()-X
 tBodyAccJerk-std()-Y
 tBodyAccJerk-std()-Z
 tBodyGyro-mean()-X
 tBodyGyro-mean()-Y
 tBodyGyro-mean()-Z
 tBodyGyro-std()-X
 tBodyGyro-std()-Y
 tBodyGyro-std()-Z
 tBodyGyroJerk-mean()-X
 tBodyGyroJerk-mean()-Y
 tBodyGyroJerk-mean()-Z
 tBodyGyroJerk-std()-X
 tBodyGyroJerk-std()-Y
 tBodyGyroJerk-std()-Z
 tBodyAccMag-mean()
 tBodyAccMag-std()
 tGravityAccMag-mean()
 tGravityAccMag-std()
 tBodyAccJerkMag-mean()
 tBodyAccJerkMag-std()
 tBodyGyroMag-mean()
 tBodyGyroMag-std()
 tBodyGyroJerkMag-mean()
 tBodyGyroJerkMag-std()
 fBodyAcc-mean()-X
 fBodyAcc-mean()-Y
 fBodyAcc-mean()-Z
 fBodyAcc-std()-X
 fBodyAcc-std()-Y
 fBodyAcc-std()-Z
 fBodyAcc-meanFreq()-X
 fBodyAcc-meanFreq()-Y
 fBodyAcc-meanFreq()-Z
 fBodyAccJerk-mean()-X
 fBodyAccJerk-mean()-Y
 fBodyAccJerk-mean()-Z
 fBodyAccJerk-std()-X
 fBodyAccJerk-std()-Y
 fBodyAccJerk-std()-Z
 fBodyAccJerk-meanFreq()-X
 fBodyAccJerk-meanFreq()-Y
 fBodyAccJerk-meanFreq()-Z
 fBodyGyro-mean()-X
 fBodyGyro-mean()-Y
 fBodyGyro-mean()-Z
 fBodyGyro-std()-X
 fBodyGyro-std()-Y
 fBodyGyro-std()-Z
 fBodyGyro-meanFreq()-X
 fBodyGyro-meanFreq()-Y
 fBodyGyro-meanFreq()-Z
 fBodyAccMag-mean()
 fBodyAccMag-std()
 fBodyAccMag-meanFreq()
 fBodyBodyAccJerkMag-mean()
 fBodyBodyAccJerkMag-std()
 fBodyBodyAccJerkMag-meanFreq()
 fBodyBodyGyroMag-mean()
 fBodyBodyGyroMag-std()
 fBodyBodyGyroMag-meanFreq()
 fBodyBodyGyroJerkMag-mean()
 fBodyBodyGyroJerkMag-std()
 fBodyBodyGyroJerkMag-meanFreq()
 activity > 1 =WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6 = LAYING
 subject > Number of the person who perform the activity.

Tidy data
--------------------
With these variables I calculated the mean for each combination of activity and subject.
