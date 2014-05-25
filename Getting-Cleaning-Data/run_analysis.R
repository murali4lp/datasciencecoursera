## This function downloads the data from the website & unzips the zip file
## to the working directory


downloadDataset <- function() {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile = "UCIHARDataset.zip")
        dateDownloaded <- date()
        unzip("UCIHARDataset.zip")
}

## This function reads the different datasets into different data frames, 
## merges the data frames, subsets the mean and std values
## It then creates a second data set with the average of 
## each variable for each activity and each subject

processDatasets <- function() {
        ## read activity IDs and description
        activityLookup <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activityid", "activitydesc"),
                                    colClasses = c("numeric", "character"), header = FALSE, sep = "",stringsAsFactors = FALSE, quote = "")
        ## read Feature IDs and names
        featureNames <- read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = "",
                                    col.names = c("featureid", "featurename"), stringsAsFactors = FALSE, quote = "")
        ## extract the mean and standard deviation features from the dataset
        meanfeatures <- grep("mean()", featureNames$featurename, value = FALSE, fixed = TRUE)
        stdfeatures <- grep("std()", featureNames$featurename, value = FALSE, fixed = TRUE)
        ## rename the mean and standard deviation variable names in the dataset
        featureNames$featurename <- gsub("-", "", featureNames$featurename)
        featureNames$featurename <- gsub("()", "", featureNames$featurename)
        featureNames$featurename <- gsub("BodyBody", "Body", featureNames$featurename)
        featureNames$featurename <- tolower(featureNames$featurename)
        
        ## read the training dataset
        subjectTrainData <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "",
                                    col.names = c("subjectid"), stringsAsFactors = FALSE, quote = "")
        xTrainData <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "",
                                    col.names = featureNames$featurename, stringsAsFactors = FALSE, quote = "")
        yTrainData <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "",
                                    col.names = c("activityid"), stringsAsFactors = FALSE, quote = "")
       
        ## merge and process the training dataset
        mergedTrainData <- merge(yTrainData, activityLookup)
        trainData <- data.frame(subjectTrainData, mergedTrainData, 
                                xTrainData[, c(meanfeatures, stdfeatures)])
        
        
        ## read the test dataset
        subjectTestData <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "",
                                       col.names = c("subjectid"), stringsAsFactors = FALSE, quote = "")
        xTestData <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "",
                                 col.names = featureNames$featurename, stringsAsFactors = FALSE, quote = "")
        yTestData <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "",
                                 col.names = c("activityid"), stringsAsFactors = FALSE, quote = "")
        
        ## merge and process the test dataset 
        mergedTestData <- merge(yTestData, activityLookup)
        testData <- data.frame(subjectTestData, mergedTestData, 
                               xTestData[, c(meanfeatures, stdfeatures)])
        
        ## combine the training and test dataset 
        combinedData <- rbind(trainData, testData)
     
        ## aggregate the variables and calculate their average based on subject and activity IDS        
        aggData <- aggregate(combinedData, by = list(Group.subjectid = combinedData$subjectid, 
                                                       Group.activityid = combinedData$activityid), FUN = mean, na.rm = TRUE)
        ## Drop extra columns
        tempData <- aggData[, c(3:71)]
        tempData[, 3] <- NULL
        finalData <- merge(activityLookup, tempData)        
        
        ## Output tidy dataset to a text file   
        write.table(finalData, file = "run_analysis.txt", quote = FALSE, sep = " ", row.names = FALSE)
        
}