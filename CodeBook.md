## Libro de códigos
## Descripción de las variables y datos usados en el script.
Below I describe the variables and data used in the script, the explanation of which is in README.md.

Note: The images after each variable are the result of applying the str function on each variable, and show a short description about the variable, but in the case of variables that store large amounts of data, only part of the summary.

1) identifier_subject_train: Single column data frame, containing the subject identifiers of the training data set, this data frame is the one corresponding to the subject_train.txt file, provided in the ZIP file, given in the project description .

![image](https://user-images.githubusercontent.com/65571096/85365723-8e8ad980-b4eb-11ea-8815-df9eca808a32.png)

2) data_train: Data frame, 561 columns, that contains the data of all the variables for the training data set, this data frame is the one corresponding to the file X_train.txt, provided in the ZIP file, given in the description of the project.

![image](https://user-images.githubusercontent.com/65571096/85365739-934f8d80-b4eb-11ea-8adc-f5f48f3f1165.png)

3) activity_labels_train: Data frame, of a single column, that contains the activity identifiers of the training data set, this data frame is the one corresponding to the file y_train.txt, provided in the ZIP file, given in the project description .

![image](https://user-images.githubusercontent.com/65571096/85365748-977bab00-b4eb-11ea-9ff8-9c47bd41ffd7.png)


4) identifier_subject_test: Single column data frame, containing the subject identifiers of the test data set, this data frame corresponds to the subject_train.txt file, provided in the ZIP file, given in the project description .

![image](https://user-images.githubusercontent.com/65571096/85365758-9b0f3200-b4eb-11ea-8024-ae908d9a9905.png)

5) data_test: Data frame, 561 columns, that contains the data of all the variables for the test data set, this data frame is the one corresponding to the X_test.txt file, provided in the ZIP file, given in the description of the project.

![image](https://user-images.githubusercontent.com/65571096/85365786-a4000380-b4eb-11ea-9557-844dc960ee9d.png)

6) activity_labels_test: Data column, of a single column, that contains the activity identifiers of the test data set, this data frame is the one corresponding to the file y_test.txt, provided in the ZIP file, given in the project description .

![image](https://user-images.githubusercontent.com/65571096/85365805-abbfa800-b4eb-11ea-9b70-c5b5f05a5a60.png)

7) data_frame_train: Data frame, 563 columns, which is the union of the identifier_subject_train, data_train and activity_labels_train data frames

![image](https://user-images.githubusercontent.com/65571096/85365811-afebc580-b4eb-11ea-8df6-5a738c4034cc.png)

8) data_frame_test: Data frame, 563 columns, which is the union of the identifier_subject_test, data_test and activity_labels_test data frames

![image](https://user-images.githubusercontent.com/65571096/85365835-bc701e00-b4eb-11ea-8d2c-e534d689588c.png)

9) data_merging: Data frame, 563 columns, which is the union of the data frames, data_frame_train and data_frame_test.

![image](https://user-images.githubusercontent.com/65571096/85365843-c1cd6880-b4eb-11ea-8761-449479abf0df.png)

10) data_subset: Data frame, containing the first 8 columns of the data_merging data frame, whose names are: "activity_labels", "identifier_subject", "mean_x", "mean_y", "mean_z", "std_y" and "std_z".

![image](https://user-images.githubusercontent.com/65571096/85365859-c7c34980-b4eb-11ea-966d-54abe9734d75.png)

11) list_data_subset_per_activity: List of data frames, of 6 elements, that contains the list of data frames that is generated when applying the split function, to the data frame data_subset, and divides this data frame by activities.

![image](https://user-images.githubusercontent.com/65571096/85365873-ceea5780-b4eb-11ea-8555-1575a9a1829c.png)

12) df_per_activity: 8 column data frame, containing a data frame (corresponding to element i of list_data_subset_per_activity) created in the I-th iteration of the for loop.

![image](https://user-images.githubusercontent.com/65571096/85365878-d3af0b80-b4eb-11ea-96fe-5dc9ec798e47.png)

13) list_data_subset_per_subject: I-th List of data frames, of 30 elements, that contains the list of data frames that is generated when applying the split function, to the data frame data_per_activity, and divides this data frame by subjects.

![image](https://user-images.githubusercontent.com/65571096/85365896-d90c5600-b4eb-11ea-9246-d38a517c972e.png)

14) set_of_averages_subject: I-th Data set containing the average of each of the variables, for each of the subjects, which is the result of applying the sapply function, to list_data_subset_per_subject.

![image](https://user-images.githubusercontent.com/65571096/85365917-e1fd2780-b4eb-11ea-819f-3129ff8ffaca.png)


15) df_mean_per_activity_and_subject: Data frame, of 31 columns, which stores the average of each of the variables, for each of the subjects, for each activity, which is the fruit of filling this data frame (which initially, before start the for loop (it is empty) with the insertion of set_of_averages_subject, in each iteration of the for loop, with the rbind function.

![image](https://user-images.githubusercontent.com/65571096/85365928-e7f30880-b4eb-11ea-8823-f7b24ced582b.png)

16) df_final: Data frame, with 32 columns, whose names are respectively: "activity_labels", "variable", "Subject_1", "Subject_1", ............, and "Subject_30", This data frame is the result of organizing the df_mean_per_activity_and_subject data frame, naming the rows and columns so that the data it contains (the average of each of the variables, for each of the subjects, for each activity) is more understandable for later analysis. Also this data frame is the one that will return the script and it is the dataset attached in the file df_mean_per_activity_and_subject.txt.

![image](https://user-images.githubusercontent.com/65571096/85365961-f8a37e80-b4eb-11ea-9935-abcecbce64bc.png)






