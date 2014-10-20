library (plyr)
#1. Merge the training and the test sets to create one data set.
#################

#read the features data
features <- read.table ("./UCI HAR Dataset/features.txt", header = FALSE)

#read the activity labels data
activityLabels <- read.table ("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

#read the training data
subjectTrain <- read.table ("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
xTrain <- read.table ("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
yTrain <- read.table ("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

#assign column names to  the activity data and the training data imported above
colnames (activityLabels) = c("activityID", "activityName")
colnames (subjectTrain) = "subjectID"
colnames (xTrain) = features [, 2]
colnames (yTrain) = "activityID"

#combine the training data into one dataset
trainingObservations <- cbind (yTrain, subjectTrain, xTrain)

#read the test data
subjectTest <- read.table ("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
xTest <- read.table ("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
yTest <- read.table ("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

#assign column names to the test columns
#the column names should match the training dataset column names
colnames (subjectTest) = "subjectID"
colnames (xTest) = features [, 2]
colnames (yTest) = "activityID"

#combine the test data into one dataset
testObservations <- cbind (yTest, subjectTest, xTest)

#merge the training and test dataset
mergedData <- rbind (trainingObservations, testObservations)

#store the column names of the merged dataset in a vector
mergedDataColNames <- colnames (mergedData)

#2. Extract only the measurements on the mean and standard deviation for each measurement. 
#get the columns that either start with "activity", "subject" OR end with "mean()", "std()"
subsetColsLogicalVector <- grepl("mean\\(\\)$", mergedDataColNames) | grepl("std\\(\\)$", mergedDataColNames) | grepl("^activity..", mergedDataColNames) | grepl("^subject..", mergedDataColNames)
subsetCols <- which (subsetColsLogicalVector == TRUE)
mergedDataSubset <- mergedData [, subsetCols]

#3. Use descriptive activity names to name the activities in the data set
#merge using activityID feature in both datasets
finalData <- merge (md, activityLabels, by.x = "activityID", by.y = "activityID")
#always a good idea to store the column names
finalDataColNames <- names (dataWithActivities)

#4. Appropriately label the data set with descriptive activity names. 
#remove ()
finalDataColNames <- gsub ("\\(\\)", "", finalDataColNames)
#replace starting character "t" with "time"
finalDataColNames <- gsub ("^t", "time", finalDataColNames)
#replace starting character "f" with "frequency"
finalDataColNames <- gsub ("^f", "time", finalDataColNames)
#replace "Acc" with "Acceleration", "Mag" with "Magnitude", "-mean" with "Mean", "-std" with "StdDev"
finalDataColNames <- gsub ("(Acc)", "Acceleration", finalDataColNames)
finalDataColNames <- gsub ("(Mag)", "Magnitude", finalDataColNames)
finalDataColNames <- gsub ("(-mean)", "Mean", finalDataColNames)
finalDataColNames <- gsub ("(-std)", "StdDev", finalDataColNames)

colnames (finalData) = finalDataColNames

#5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
finalDataNoActivityName <- finalData [, names(finalData) != "activityName"]
finalDataMeans <- ddply (finalDataNoActivityName, c("activityID", "subjectID"), numcolwise (mean))
finalDataMeans = merge (finalDataMeans, activityLabels, by.x = "activityID", by.y = "activityID")

#write to a file
write.table(finalDataMeans, './tidyData.txt', row.names = FALSE, sep='\t');
