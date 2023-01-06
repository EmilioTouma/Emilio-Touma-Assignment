####################
##Preliminaries##
#################

# Before proceeding please download the zip archive provided in the project assignment
# from the course and extract it in your working directory. 

# This R script was done with Windows software. So the code could change if you are a Mac or Linux user.

#############
##Packages##
############
packages <- c("dplyr","expss","reshape2")
install.packages(setdiff(packages, rownames(installed.packages()))) #This will install a package only if you haven´t done it before.

library(dplyr)
library(expss)
library(reshape2)

###################
##Upload the data##
###################
# We begin by uploading the data. We will only use "X_train.txt", "y_train.txt", "subject_train", "X_test.txt", 
#"y_test.txt", and "subject_test".As mentioned by the mentor, the data in "Inertial Signs" will be irrelevant.

#For training data:
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt") #Data containing the mean and standard deviations for training data.
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") #Variable describing the activity associated with each observation of X_train.
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") #Variable describing the subject associated with each observation of X_train.

#For testing data:
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt") #Data containing the mean and standard deviations for test data.
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") #Variable describing the activity associated with each observation of X_test.
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") #Variable describing the subject associated with each observation of X_test.

#####################
##Merging the data##
####################
#In order to merge the data effectively, first we will change some variable names:
y_train <- rename(y_train, activity = V1) #Variable describing the activity associated with each observation of X_train.
subject_train <- rename(subject_train, subject = V1) #Variable describing the subject associated with each observation of X_train.
y_test = rename(y_test,activity = V1) #Variable describing the activity associated with each observation of X_test.
subject_test <- rename(subject_test, subject = V1) #Variable describing the subject associated with each observation of X_test.


X_train_merged <- cbind(X_train,y_train) #Add the activity column to X_train.
X_train_merged <- cbind(X_train_merged,subject_train) #Add the subject column to X_train.

X_test_merged <- cbind(X_test,y_test) #Add the activity column to X_test.
X_test_merged <- cbind(X_test_merged,subject_test) #Add the subject column to X_test.

mergeddata <- rbind(X_train_merged,X_test_merged)  #Add the observations of the train sample to the test sample.

##################
##Variable names##
##################
#We will change the name of the variables following the logic described in the file "features_info". I will not lower case
#the variable names or eliminate the characters like "_", because I wan´t to maintain the format described in that file.

#Rename the variables which are means or standard deviations:
mergeddata <-  rename(mergeddata,
                      "tBodyAcc-mean()-X" = "V1",
                      "tBodyAcc-mean()-Y" = "V2",
                      "tBodyAcc-mean()-Z" = "V3",
                      "tBodyAcc-std()-X" = "V4",
                      "tBodyAcc-std()-Y" = "V5",
                      "tBodyAcc-std()-Z" = "V6",
                      "tGravityAcc-mean()-X" = "V41",
                      "tGravityAcc-mean()-Y" = "V42",
                      "tGravityAcc-mean()-Z" = "V43",
                      "tGravityAcc-std()-X" = "V44",
                      "tGravityAcc-std()-Y" = "V45",
                      "tGravityAcc-std()-Z" = "V46",
                      "tBodyAccJerk-mean()-X" = "V81",
                      "tBodyAccJerk-mean()-Y" = "V82",
                      "tBodyAccJerk-mean()-Z" = "V83",
                      "tBodyAccJerk-std()-X" = "V84",
                      "tBodyAccJerk-std()-Y" = "V85",
                      "tBodyAccJerk-std()-Z" = "V86",
                      "tBodyGyro-mean()-X" = "V121",
                      "tBodyGyro-mean()-Y" = "V122",
                      "tBodyGyro-mean()-Z" = "V123",
                      "tBodyGyro-std()-X" = "V124",
                      "tBodyGyro-std()-Y" = "V125",
                      "tBodyGyro-std()-Z" = "V126",
                      "tBodyGyroJerk-mean()-X" = "V161",
                      "tBodyGyroJerk-mean()-Y" = "V162",
                      "tBodyGyroJerk-mean()-Z" = "V163",
                      "tBodyGyroJerk-std()-X" = "V164",
                      "tBodyGyroJerk-std()-Y" = "V165",
                      "tBodyGyroJerk-std()-Z" = "V166",
                      "tBodyAccMag-mean()" = "V201",
                      "tBodyAccMag-std()" = "V202",
                      "tGravityAccMag-mean()" = "V214",
                      "tGravityAccMag-std()" = "V215",
                      "tBodyAccJerkMag-mean()" = "V227",
                      "tBodyAccJerkMag-std()" = "V228",
                      "tBodyGyroMag-mean()" = "V240",
                      "tBodyGyroMag-std()" = "V241",
                      "tBodyGyroJerkMag-mean()" = "V253",
                      "tBodyGyroJerkMag-std()" = "V254",
                      "fBodyAcc-mean()-X" = "V266",
                      "fBodyAcc-mean()-Y" = "V267",
                      "fBodyAcc-mean()-Z" = "V268",
                      "fBodyAcc-std()-X" = "V269",
                      "fBodyAcc-std()-Y" = "V270",
                      "fBodyAcc-std()-Z" = "V271",
                      "fBodyAcc-meanFreq()-X" = "V294",
                      "fBodyAcc-meanFreq()-Y" = "V295",
                      "fBodyAcc-meanFreq()-Z" = "V296",
                      "fBodyAccJerk-mean()-X" = "V345",
                      "fBodyAccJerk-mean()-Y" = "V346",
                      "fBodyAccJerk-mean()-Z" = "V347",
                      "fBodyAccJerk-std()-X" = "V348",
                      "fBodyAccJerk-std()-Y" = "V349",
                      "fBodyAccJerk-std()-Z" = "V350",
                      "fBodyAccJerk-meanFreq()-X" = "V373",
                      "fBodyAccJerk-meanFreq()-Y" = "V374",
                      "fBodyAccJerk-meanFreq()-Z" = "V375",
                      "fBodyGyro-mean()-X" = "V424",
                      "fBodyGyro-mean()-Y" = "V425",
                      "fBodyGyro-mean()-Z" = "V426",
                      "fBodyGyro-std()-X" = "V427",
                      "fBodyGyro-std()-Y" = "V428",
                      "fBodyGyro-std()-Z" = "V429",
                      "fBodyGyro-meanFreq()-X" = "V452",
                      "fBodyGyro-meanFreq()-Y" = "V453",
                      "fBodyGyro-meanFreq()-Z" = "V454",
                      "fBodyAccMag-mean()" = "V503",
                      "fBodyAccMag-std()" = "V504",
                      "fBodyAccMag-meanFreq()" = "V513",
                      "fBodyBodyAccJerkMag-mean()" = "V516",
                      "fBodyBodyAccJerkMag-std()" = "V517",
                      "fBodyBodyAccJerkMag-meanFreq()" = "V526",
                      "fBodyBodyGyroMag-mean()" = "V529",
                      "fBodyBodyGyroMag-std()" = "V530",
                      "fBodyBodyGyroMag-meanFreq()" = "V539",
                      "fBodyBodyGyroJerkMag-mean()" = "V542",
                      "fBodyBodyGyroJerkMag-std()" = "V543",
                      "fBodyBodyGyroJerkMag-meanFreq())" = "V552")

#Eliminate all columns that don´t represent a mean or standard deviation:
mergeddata <- mergeddata[, -grep("^[V]", colnames(mergeddata))]

####################
##Tidy data format##
####################
colSums(is.na(mergeddata)) #As you see, there are not missing values.
mergeddata[order(mergeddata$subject),] #Order the data frame with respect to subject. I'will not create a new variable
#for each subject or activity, because it will increase excessively the number of columns.

#Change the values of activity by their categorizes
mergeddata$activity[mergeddata$activity == 1] <- "WALKING" 
mergeddata$activity[mergeddata$activity == 2] <- "WALKING_UPSTAIRS" 
mergeddata$activity[mergeddata$activity == 3] <- "WALKING_DOWNSTAIRS" 
mergeddata$activity[mergeddata$activity == 4] <- "SITTING" 
mergeddata$activity[mergeddata$activity == 5] <- "STANDING" 
mergeddata$activity[mergeddata$activity == 6] <- "LAYING" 

#########
##Mean##
########
#We will make a table that describe the mean of the variables for each combination of activity and subject:
mergeddatamelt<-melt(mergeddata,id=c("activity","subject"),measure.vars=c(1:79)) #We determine what variables are id´s and what variables are measure variables.
tidydata<-dcast(mergeddatamelt,activity+subject~variable,mean) 

write.table(tidydata, file="tidydata.txt",row.names = FALSE) #Save the tidy data.
