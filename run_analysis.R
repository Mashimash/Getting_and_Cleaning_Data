library(dplyr)
library(data.table)
library(reshape2)

####################################################################################
# DOWNLOAD FILES
####################################################################################

# download zip file & unzip it:
zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file <- "UCI HAR Dataset.zip"

if (!file.exists(zip_file)) {
  download.file(zip_url, zip_file, mode = "wb")
}

file_path <- "UCI HAR Dataset"
if (!file.exists(file_path)) {
  unzip(zip_file)
}

####################################################################################
# READ DATA
####################################################################################

# read training data
subject_train <- read.table(file.path(file_path, "train", "subject_train.txt"), header = FALSE)
training_set <- read.table(file.path(file_path, "train", "X_train.txt"), header = FALSE)
training_labels <- read.table(file.path(file_path, "train", "y_train.txt"), header = FALSE)

# read test data
subject_test <- read.table(file.path(file_path, "test", "subject_test.txt"), header = FALSE)
test_set <- read.table(file.path(file_path, "test", "X_test.txt"), header = FALSE)
test_labels <- read.table(file.path(file_path, "test", "y_test.txt"), header = FALSE)

# read metadata
list_of_all_features <- read.table(file.path(file_path, "features.txt"), header = FALSE)
activity_labels <- read.table(file.path(file_path, "activity_labels.txt"), header = FALSE)

####################################################################################
# STEP 1 - MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET
####################################################################################

# concatenate individual data tables to make single data table
subject <- rbind(subject_train, subject_test)
activity <- rbind(training_labels, test_labels)
features <- rbind(training_set, test_set)

# name columns
colnames(features) <- t(list_of_all_features[2])

# merge the data

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
merged_data <- cbind(features,activity,subject)

####################################################################################
# 2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND THE STD DEV
####################################################################################

mean_std_columns <- grep(".*Mean.*|.*Std.*", names(merged_data), ignore.case=TRUE)
requiredColumns <- c(mean_std_columns, 562, 563)
extract_data <- merged_data[,requiredColumns]



####################################################################################
# STEP 3 - USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET
####################################################################################

extract_data$Activity <- as.character(extract_data$Activity)
for (i in 1:6){
  extract_data$Activity[extract_data$Activity == i] <- as.character(activity_labels[i,2])
}

extract_data$Activity <- as.factor(extract_data$Activity)

names(extract_data)

###################################################################################
# STEP 4 - APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.
###################################################################################

# correct labels 
names(extract_data)<-gsub("Acc", "Accelerometer", names(extract_data))
names(extract_data)<-gsub("Gyro", "Gyroscope", names(extract_data))
names(extract_data)<-gsub("BodyBody", "Body", names(extract_data))
names(extract_data)<-gsub("Mag", "Magnitude", names(extract_data))
names(extract_data)<-gsub("^t", "Time", names(extract_data))
names(extract_data)<-gsub("^f", "Frequency", names(extract_data))
names(extract_data)<-gsub("tBody", "TimeBody", names(extract_data))
names(extract_data)<-gsub("-mean()", "Mean", names(extract_data), ignore.case = TRUE)
names(extract_data)<-gsub("-std()", "STD", names(extract_data), ignore.case = TRUE)
names(extract_data)<-gsub("-freq()", "Frequency", names(extract_data), ignore.case = TRUE)
names(extract_data)<-gsub("angle", "Angle", names(extract_data))
names(extract_data)<-gsub("gravity", "Gravity", names(extract_data))

# remove special characters
names(extract_data) <- gsub("[\\(\\)-]", "", names(extract_data))

names(extract_data)

###################################################################################
# STEP 5 - FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT. 
###################################################################################

extract_data$Subject <- as.factor(extract_data$Subject)
extract_data <- data.table(extract_data)

# output to file "TidyData.txt" and "TidyData.csv"
tidy_data <- aggregate(. ~Subject + Activity, extract_data, mean)
tidy_data <- tidy_data[order(tidy_data$Subject,tidy_data$Activity),]
write.table(tidy_data, file = "TidyData.txt", row.names = FALSE)
write.csv(tidy_data, file = "TidyData.csv", row.names = FALSE)
