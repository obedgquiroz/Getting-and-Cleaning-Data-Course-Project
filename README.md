# Getting-and-Cleaning-Data-Course-Project
## SCRIPT Functional Description
This script manipulates data collected from the accelerometers of the Samsung Galaxy S smartphone, in order to prepare ordered data that can be used for further analysis.
The steps that were carried out for the treatment of these data are the following:

1) The data of the training data set and the test data set are obtained with the read.table function, opening with this the following files: subject_train.txt, X_train.txt, y_train.txt, X_test.txt , subject_test.txt, and_test.txt, provided in the ZIP file, given in the project description.

2) Create the data frame for the training data set and for the test data set, using the function data.frame and the files that were loaded in the previous step.

3) With the cbind function, the data frames of the training and test sets, created in the previous step, are merged into a data frame called data_subset.

4) Only the columns that have the standard and mean deviation measurements for each measurement are extracted from the data frame data_subset, and the columns of the data frame are labeled appropriately

5) The activity_labels column of the data frame, labeled in the previous step, is appropriately named, changing (as appropriate) each of the values between 1 and 6 that this variable has, for the following activities: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING", this is done by converting the activity_labels column to factor, with the function as.factor, and then with the levels function, reassign the values of the levels and at the same time reassign the values of this column.

6) The average is calculated, by activity, for each subject, of each of the following variables: mean_x, mean_y, mean_z, std_x, std_y, std_z, this is done by dividing the data frame data_subset, by activity, with the function split , and then using a for loop, it iterates over the list of data frames created by the split function, and in each iteration, a data frame called df_per_activity is created, which contains the corresponding data (depending on the iteration in which it is this) to one of the six activities mentioned in the previous step, then that data frame is divided by subject with the split function and for each subject the average of each of the variables is calculated, using the sapply function, later they are stored the averages, autofilling the data frame df_mean_per_activity_and_subject, and it is autofilling the data frame df_final, adding the previous data frame and a column that identifies to which variable the average was performed.

7) Finally, the data frame df_final, created in the previous step, is organized, which contains the set of data to be displayed, for this the rows and columns are renamed in such a way that they are understandable, using functions such as as.vector, mapply , rep, c, cbind, paste0 and names.
