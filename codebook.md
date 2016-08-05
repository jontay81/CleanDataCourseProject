##Codebook

###Getting and Cleaning Data Course Project

#Dataset

The dataset is composed of data collected from the accelerometers from the Galaxy S5 smartphone.

A full description of the data is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is a direct link to the data set:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Usage
	1. Extract the dataset into a directory containing run_analysis.R
	2. Execute the run_analysis function from run_analysis.R
	3. run_analysis() will:
		i. combine the training and test data 
		ii. select only the mean and standard deviation for each measurement
		iii. appropriately label the data set and subject  activities with descriptive names
		iv. output the combined dataset to tidydata.txt
		v. output the mean value of each measurement for every subject and activity to meandata.txt

#Required R Packages
	data.table and reshape2 are required to execute run_analysis.R

#Variables
	
	New Variables:

	Subject - subject id of the subject performing the activity
	Activity - activity the subject is performing

	Variables maintained from the original dataset:
	
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
