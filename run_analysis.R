#Merges the training and the test sets to create one data set.

#Extracts only the measurements on the mean and standard 
#deviation for each measurement.

#Uses descriptive activity names to name the activities in the data set

#Appropriately labels the data set with descriptive variable names.

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


run_analysis <- function(){
    #Merges training and test set to create one data set
        #import files
        #extract mean and std dev for each measurement
    
    #import data.table and reshape2 libraries
    library(data.table)
    library(reshape2)
    
    #import files
    
    #6x2 activity labels [,1]=number, [,2]=activity
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    
    #2947x561 - test set
    xTest  <- read.table("./UCI HAR Dataset/test/x_test.txt")
    
    #2947x1 - test set labels(rows) - nums to replace with activity labels
    yTest  <- read.table("./UCI HAR Dataset/test/y_test.txt")
    
    #column headers for xTest data - 561x2
    features <- read.table("./UCI HAR Dataset/features.txt")
 
    
    #7352x561 - test set
    xTrain  <- read.table("./UCI HAR Dataset/train/x_train.txt")
    
    #7352x1 - test set labels - nums to replace with activity labels
    yTrain  <- read.table("./UCI HAR Dataset/train/y_train.txt")   
    
    #2947x1 
    subjectTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    subjectTrain  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    
    ##Rename columns
    names(xTest)  <-  features[,2] #just 2nd column of features
    names(xTrain) <-  features[,2]
    
    #converts yTest numbers to activity label names
    yTest[,1] <-  activityLabels[yTest[,1],2]
    yTrain[,1] <-  activityLabels[yTrain[,1],2]
    
    #add column labels to yTest and yTrain
    names(yTest) <- "Activity"
    names(yTrain) <- "Activity"
    
    #add column labels to subjectTest and subjectTrain
    names(subjectTest) <- "Subject"
    names(subjectTrain) <- "Subject"
    
    
    #creates boolean vector of desired mean and std dev features
    summaryFeatures <- grepl("mean|std", features[,2])
    
    #subsets xTest and xTrain tables to only have the desired features
    xTest <- xTest[,summaryFeatures]
    xTrain <- xTrain[,summaryFeatures]
    
    #convert subject data.frame to data.table
    subjectTest <- as.data.table(subjectTest)
    subjectTrain <- as.data.table(subjectTrain)
    
    #bind subject, activity, and sensor data
    testData <- cbind(subjectTest, yTest, xTest)
    trainData <- cbind(subjectTrain, yTrain, xTrain)
    
    #bind test data and training data to make one data table
    fullData <- rbind(testData, trainData)
    
    #reshapes data table to be tidy and writes it to tidydata.txt
    tidyData  <- melt(fullData, id.var=1:2, measure.vars=3:81, variable.name="Measurement", value.name = "Value")
    
    write.table(tidyData, file = "./tidydata.txt")
    
    #converts data to show the mean of the values for each subject and activity
    #using dcast and writes it to meandata.txt
    meanData <- dcast(tidyData, Subject + Activity ~ Measurement, fun.aggregate=mean)
    
    write.table(meanData, file = "./meandata.txt")
    
    }