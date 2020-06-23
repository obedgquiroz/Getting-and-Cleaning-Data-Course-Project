##Getting the data from the training dataset
identifier_subject_train <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/train/subject_train.txt")
data_train <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/train/X_train.txt")
activity_labels_train <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/train/y_train.txt")

##Getting the data from the test dataset
identifier_subject_test <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/test/subject_test.txt")
data_test <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/test/X_test.txt")
activity_labels_test <- read.table("C:/Users/OBED GARCIA/Documents/UCI HAR Dataset/test/y_test.txt")

#Creating the data frame for training dataset
data_frame_train <- data.frame(activity_labels_train, identifier_subject_train, data_train)

##Creating the data frame for test dataset
data_frame_test <- data.frame(activity_labels_test, identifier_subject_test, data_test)

##Merging the data frame the training sets and test set
data_merging <- rbind(data_frame_train, data_frame_test)

##Extracting only the mean and standard deviation measurements for each measurement and labeling the data set appropriately
data_subset <- data_merging[,1:8]
names(data_subset) <- c("activity_labels", "identifier_subject", "mean_x", "mean_y", "mean_z", "std_x", "std_y", "std_z")

##Naming activities in the dataset appropriately
data_subset$activity_labels <- as.factor(data_subset$activity_labels)
levels(data_subset$activity_labels) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

## Obtaining the average of each variable for each activity and each subject
df_mean_per_activity_and_subject <- data.frame()
df_final <- data.frame()
list_data_subset_per_activity <- split(data_subset,data_subset$activity_labels)
for (i in list_data_subset_per_activity){
  df_per_activity <- as.data.frame(i)
  list_data_subset_per_subject <- split(df_per_activity[,3:8],df_per_activity$identifier_subject)
  set_of_averages_subject <- sapply(list_data_subset_per_subject, colMeans)
  df_mean_per_activity_and_subject <- rbind(df_mean_per_activity_and_subject, set_of_averages_subject)
  df_final <- cbind(variable = names(df_per_activity[,3:8]), df_mean_per_activity_and_subject)
}

## Organizing the dataset to be displayed, naming the rows and columns so that they are understandable
activity_labels <- as.vector(mapply(rep, c("LAYING", "SITTING","STANDING", "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS"), 6))
df_final <- cbind(activity_labels, df_final)
library(stringr)
names(df_final) <- c("activity_labels","variable",mapply(paste0, "Subject_", names(df_final[,3:32])))
print(df_final)

