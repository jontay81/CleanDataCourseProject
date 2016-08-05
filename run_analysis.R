run_analysis <- function(){
   
    #import data.table and reshape2 libraries
    library(data.table)
    library(reshape2)
    
    #import data from text files
    activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    features <- read.table("./UCI HAR Dataset/features.txt")
    xTest  <- read.table("./UCI HAR Dataset/test/X_test.txt")
    yTest  <- read.table("./UCI HAR Dataset/test/y_test.txt")
    xTrain  <- read.table("./UCI HAR Dataset/train/X_train.txt")
    yTrain  <- read.table("./UCI HAR Dataset/train/y_train.txt")   
    subjectTest  <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    subjectTrain  <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    #rename xTest and xTrain columns using features data
    names(xTest)  <-  features[,2] #just 2nd column of features
    names(xTrain) <-  features[,2]
    
    #converts yTest and yTrain numbers to activity label names
    yTest[,1] <-  activityLabels[yTest[,1],2]
    yTrain[,1] <-  activityLabels[yTrain[,1],2]
    
    #add column label to yTest and yTrain
    names(yTest) <- "Activity"
    names(yTrain) <- "Activity"
    
    #add column label to subjectTest and subjectTrain
    names(subjectTest) <- "Subject"
    names(subjectTrain) <- "Subject"
    
    #creates logical vector of desired mean and std dev features
    summaryFeatures <- grepl("mean|std", features[,2])
    
    #subsets xTest and xTrain tables to only have the desired features
    xTest <- xTest[,summaryFeatures]
    xTrain <- xTrain[,summaryFeatures]
    
    #converts subject data.frame to data.table
    subjectTest <- as.data.table(subjectTest)
    subjectTrain <- as.data.table(subjectTrain)
    
    #binds subject, activity, and accelerometer data columns
    testData <- cbind(subjectTest, yTest, xTest)
    trainData <- cbind(subjectTrain, yTrain, xTrain)
    
    #binds test data and training data to make one data table
    fullData <- rbind(testData, trainData)
    
    #reshapes data table to be tidy and writes it to tidydata.txt
    tidyData  <- melt(fullData, id.var=1:2, measure.vars=3:81, 
                      variable.name="Measurement", value.name = "Value")
    
    write.table(tidyData, file = "./tidydata.txt")
    
    #converts data to show the mean of the values for each subject and activity
    #using dcast and writes it to meandata.txt
    meanData <- dcast(tidyData, Subject + Activity ~ Measurement, 
                      fun.aggregate=mean, value.var='Value')
    
    write.table(meanData, file = "./meandata.txt")
    }