# Download the messy data in your working directory. Data will be stored in a folder called "CleanData.zip"
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "CleanData.zip", method = "curl")
# Extract the files from the zip folder
unzip("CleanData.zip")

# Read the relevant files for the training set
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
# Merge the training set to have subject and activity information with the data
train_set <- cbind(train_subjects,train_activities,train_data)

# Repeat the same steps as above to merge the test set
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_set <- cbind(test_subjects,test_activities,test_data)

# Merge the training and test sets to create one data set
all_data <- rbind(train_set, test_set)

# Get the names of the variables from the features.txt file and put them in a character vector
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)
feature_names <- as.character(features$V2)
# Add the labels for subject and activity to the labels of the variables
col_names <- c("subject","activity", feature_names)
# Add the names of the columns to the merged dataset
names(all_data) <- col_names

# Identify the indices of the columns of interest: subject, activity, columns reporting mean and standard deviation (std)
tokeep <- grep("subject|activity|(.*)mean[^Freq](.*)|(.*)std(.*)",col_names)
# Extract the columns of interest
data_meanstd <- all_data[,tokeep]

# Get the names of the activities associated with each number from the activity_labels.txt file and put them in a character vector
activities <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
activity_names <- as.character(activities$V2)
# Reformat the activity names to lowercase and remove the underscores
activity_names <- tolower(activity_names)
activity_names <- sub("_"," ", activity_names)

# Replace the numbers in the activity column of the data_meanstd dataset by the name of the activity
library(dplyr)
data_meanstd <- mutate(data_meanstd, activity = activity_names[activity])

# Get a character vector of the variable names of the data_meanstd dataset
var_names <- col_names[tokeep]
# Change the labels to more descriptive variable names
var_names <- gsub("^t", "time of ", var_names)
var_names <- gsub("^f", "frequency of ", var_names)
var_names <- gsub("BodyBody", "body", var_names)
var_names <- gsub("Acc", " accelerometer signal", var_names)
var_names <- gsub("Gyro", " gyroscope signal", var_names)
var_names <- gsub("Jerk", " jerk", var_names)
var_names <- gsub("Mag", " magnitude", var_names)
var_names <- gsub("X$", "of X axis", var_names)
var_names <- gsub("Y$", "of Y axis", var_names)
var_names <- gsub("Z$", "of Z axis", var_names)
var_names <- gsub("std", "standard deviation", var_names)
var_names <- gsub("-", " ", var_names)
var_names <- gsub("\\()", "", var_names)
var_names <- tolower(var_names)

# Change the names of the columns of the dataset to descriptive variable labels
colnames(data_meanstd) <- var_names

# Create a new tidy data set with the average of each variable for each activity and each subject
tidydata <- data_meanstd %>% group_by(subject, activity) %>% summarize_all(mean)

# Reshape the dataset into a tall and skinny dataset, where all the measurement variables are in a "variable" column and the means are in an "average" column
library(reshape2)
tidydata <- melt(tidydata, id=c("subject","activity"), measure.vars = var_names[-(1:2)], value.name="average")

# Save the tidy dataset into a .txt file in your working directory 
write.table(tidydata, file="tidy data.txt", row.names=FALSE)