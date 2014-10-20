#Getting and Cleaning Data - Course Project: CodeBook.md

This document describes the variables and data transformations that are used in the course project for the "Getting and Cleaning Data" (Johns Hopkins Coursera) course. 

#### Source Data
The actual data used in this project can be downloaded from the following website: [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). You can download the source data  from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

#### Features
Human Activity Recognition Using Smartphones Dataset <br>
Version 1.0 <br>
<br>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. <br>
Smartlab - Non Linear Complex Systems Laboratory <br>
DITEN - Università degli Studi di Genova. <br>
Via Opera Pia 11A, I-16145, Genoa, Italy. <br>
activityrecognition@smartlab.ws <br>
www.smartlab.ws <br>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
<br><br>
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
<br>
For each record it is provided:
<br>

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. <br>
- Triaxial Angular velocity from the gyroscope.  <br>
- A 561-feature vector with time and frequency domain variables.  <br>
- Its activity label.  <br>
- An identifier of the subject who carried out the experiment. <br>

#### Attribute Information
For each record in the dataset it is provided:  <br>
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  <br>
- Triaxial Angular velocity from the gyroscope.  <br>
- A 561-feature vector with time and frequency domain variables.  <br>
- Its activity label.  <br>
- An identifier of the subject who carried out the experiment. <br>

#### Part 1. Merge the training and the test sets to create one data set.
Read the data in the following files into tables <br>
- features.txt <br>
- activity_labels.txt <br>
- subject_train.txt <br>
- x_train.txt <br>
- y_train.txt <br>
- subject_test.txt <br>
- x_test.txt <br>
- y_test.txt <br>

Assign column names and merge to create one data set. <br>

#### Part 2. Extract only the measurements on the mean and standard deviation for each measurement. 
Create a logcal vector that contains TRUE values for the column names that either start with "activity" or "subject" (OR) end with "mean()" or "std()". Subset the data to keep only these columns.

#### Part 3. Use descriptive activity names to name the activities in the data set
Merge data from part 2 with the activityType table so that the descriptive activity names are included in the new dataset. 

#### Part 4. Appropriately label the data set with descriptive activity names.
Use "gsub" to find patterns and rename the columns appropriately.

#### Part 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
According to the instructions, we should produce only a data set with the average of each variable for each activity and each subject. Use ddply and numcolwise together to produce this final dataset. Then write the output to a file.