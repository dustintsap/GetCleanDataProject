# This is the project for Getting and Cleaning Data Course.
# run_analysis.R
# This was created in a Microsoft Windows 8.1 Environment, with RStudio and the processor is i7.


# The following is the R script that obtains data collected from accelerometers from the Galaxy S smartphone, and produce a tidy data set.
# Load the dplyr and Hmisc library
library(dplyr)
library(Hmisc)

# Check if dataset exists, if not, download the dataset
if(!file.exists("./UCIHARdata")){dir.create("./UCIHARdata")}
setwd("UCIHARdata")
if(!file.exists("dataset.zip")){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="dataset.zip")
    unzip("dataset.zip")
  }

# 1. Merges the training and the test sets to create one data set.

# Read in data from all the required txt data files
# First, read in from the overall unzipped folder
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
# Extract column name element
features_col.names <- features$V2
# Read in the test data and attach respective column names that was extracted from features txt file
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
# Read in the training data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

# Merge the test and training data sets into one combined data frame
x_all.df <- rbind(X_test, X_train)
y_all.df <- rbind(y_test, y_train)
subject_all.df <- rbind(subject_test, subject_train)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# Search for Mean and standard deviations using grep pattern, and extract those elements
features_MeanStdev <- grep('mean|std', features_col.names, ignore.case = TRUE)
x_MeanStdev.df <- x_all.df[,features_MeanStdev]

# 3. Uses descriptive activity names to name the activities in the data set

# Assign column names for activities and subjects
activity_all <- y_all.df
colnames(activity_all) <- "Activity"
colnames(subject_all.df) <- "Subject"
# Clean activity labels by taking out the underscore, and convert letters to lowercase except capitalizing the first letter
activity_labels[,2] <- gsub("_","",activity_labels[,2])
activity_labels[,2] <- tolower(as.character(activity_labels[,2]))
activity_labels[,2] <- capitalize(activity_labels[,2])
#Assign activity label to activity column of dataset (created from combining y data earlier)
activity_all[,1] = activity_labels[activity_all[,1],2]

# 4. Appropriately labels the data set with descriptive variable names. 
# Assign variable names to data set
names(x_MeanStdev.df) <- features[features_MeanStdev,2]
# Use gsub to take out unnecessary components in variable name formatting
names(x_MeanStdev.df) <- gsub("\\(\\)","", names(x_MeanStdev.df))
names(x_MeanStdev.df) <- gsub("-","_", names(x_MeanStdev.df))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# We have not reordered the data in previous steps,  so we can just add the subject and activity data/column to the overall data in x_MeanStdev
x_MeanStdev.df$subject <- as.factor(subject_all.df$Subject)
x_MeanStdev.df$activity <- as.factor(activity_all$Activity)
# We will then reorder the columns so subject and activity is at the front of the dataset
tidy_data <- cbind(x_MeanStdev.df[,87:88], x_MeanStdev.df[,-(87:88)])
# Arranged by activity, then by subject, see detailed explanation in codebook
## If want to arrange by subject, then by activity, we can flip the code to 'activity+subject'
tidy_data <- aggregate(.~ subject+activity,data=tidy_data, FUN=mean)
write.table(tidy_data,"tidy_data.txt",row.names=FALSE)
