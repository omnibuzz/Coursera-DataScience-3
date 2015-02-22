## This program assumes that the root folder of the data "UCI HAR Dataset" is in the working directory
## This program requires dplyr to be installed

library(dplyr)

############# Merge the training and the test sets to create one data set 

# First load the metadata about the data file
featureColumns <- read.table("UCI HAR Dataset/features.txt",header=FALSE)
requiredMeanAndStdCols <- featureColumns$V2[grepl("mean\\(\\)|std\\(\\)",featureColumns$V2)]

# Load the test data as tables
testObservations <- read.table("UCI HAR Dataset/test/X_test.txt",header=FALSE,col.names = featureColumns$V2)

#Filter out columns that you don't need
requiredTestObservations <- testObservations[,requiredMeanAndStdCols]

testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt",header=FALSE,col.names = c("ActivityCode"))
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt",header=FALSE,col.names = c("SubjectId"))

# Combine all the induvidual test tables to 1
testData <- cbind(testActivities,testSubjects,requiredTestObservations)

# Load the train data as tables and do the same operations that we did for test data
trainObservations <- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE,col.names = featureColumns$V2)

#Filter out columns that you don't need
requiredTrainObservations <- trainObservations[,requiredMeanAndStdCols]

trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt",header=FALSE,col.names = c("ActivityCode"))
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE,col.names = c("SubjectId"))

# Combine all the induvidual test tables to 1
trainData <- cbind(trainActivities,trainSubjects,requiredTrainObservations)

# Combine the test and train data
allData <- rbind(testData,trainData)

# Update the activity labels 
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names = c("ActivityCode","ActivityName"))
allDataWithActivityLabels <- merge(allData,activityLabels,by.x="ActivityCode",by.y="ActivityCode")

#############  Group and Mean of all columns. 
outFile <- allDataWithActivityLabels %>% group_by(SubjectId,ActivityCode,ActivityName) %>% summarise_each(funs(mean))

# Write to File
write.table(outFile,"AssignmentOutput.txt",row.names=FALSE)