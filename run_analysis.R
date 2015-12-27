# GCD  project 
# 
# This script transform data collected from the accelerometers from the Samsung Galaxy S 
# smartphones used by a set of subjects.
# Script labels the data after merging test and training data and find out means and standard deviations.
# The tidy data set is saved as projectFinalData.txt. 
# 
 

# Please set the current working directory where dataset is kept
#input dataset extraction
unzip('getdata_projectfiles_UCI HAR Dataset.zip') 


#Read activity labels from activity-labels.txt 
# 
activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt', col.names=c('id', 'name')) 


# Read feature labels. Removed blank parentheses, replaced other parantheses with underscores and replaced commas with dots 
# 
featureLabels <- read.table('UCI HAR Dataset/features.txt', col.names=c('id', 'name')) 
featureLabels$name <- gsub('\\(\\)', '', featureLabels$name) 
featureLabels$name <- gsub(',', '.', featureLabels$name)
featureLabels$name <- gsub('\\(', '_', featureLabels$name) 
featureLabels$name <- gsub('\\)', '', featureLabels$name) 
 

# Read test data into table and label the activity & features
# 
testLabels <- read.table('UCI HAR Dataset/test/y_test.txt', col.names=c('name'))  
testLabels <- factor(testLabels$name, labels=activityLabels$name) 
testSubjects <- read.table('UCI HAR Dataset/test/subject_test.txt')  
testData <- read.table('UCI HAR Dataset/test/X_test.txt', col.names=featureLabels$name)  
testData <- cbind(testSubjects, testLabels, testData) 
colnames(testData)[1] <- 'SubjectID' 
colnames(testData)[2] <- 'Activity' 

# Read training data into a table and label it 
# 
trainingLabels <- read.table('UCI HAR Dataset/train/y_train.txt', col.names=c('name'))  
trainingLabels <- factor(trainingLabels$name, labels=activityLabels$name) 
trainingTestSubjects <- read.table('UCI HAR Dataset/train/subject_train.txt')  
trainingData <- read.table('UCI HAR Dataset/train/X_train.txt', col.names=featureLabels$name)  
trainingData <- cbind(trainingTestSubjects, trainingLabels, trainingData) 
colnames(trainingData)[1] <- 'SubjectID' 
colnames(trainingData)[2] <- 'Activity' 

# Combine the test data and training data 
# 
combinedData <- rbind(testData, trainingData) 

# 
# Grep the data which contain mean and standard deviation data
relevantColumns <- grep('[Mm]ean|std', colnames(combinedData)) 
 
# Combine the data with SubjectID and Activity
# 
relevantData <- combinedData[,c(1, 2, relevantColumns)] 


# find averages for each subject's activity 
# 
tidyData <- aggregate(relevantData[,c(-1,-2)], by=list(relevantData$Activity, relevantData$SubjectID), FUN=mean, na.rm=TRUE) 

# Present data with the SubjectID in the left-most column 
# 
tidyData <- tidyData[,c(2,1,3:length(names(tidyData)))] 
 
# Label the two left-most columns appropriately (i.e., SubjectID and Activity) 
# 
colnames(tidyData)[1] <- 'SubjectID' 
colnames(tidyData)[2] <- 'Activity' 

# Write to file 
# 
write.table(tidyData, file='projectFinalData.txt', row.name=FALSE) 


