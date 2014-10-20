---
title: "Getting and Cleaning Data - Course Project"
output: html_document
---

Repository for the course project for Johns Hopkins (Coursera): Getting and Cleaning Data. 


###Project Description

This project shows how to produce a tidy data set that can be used for further analysis. A complete description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) The source data for this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

###Running the R script

Download the data and the run_analysis.R files. Unzip the data into your working directory. Unzipping the data will create a folder by name "UCI HAR Dataset". This folder will include further sub-folders below it. Please do not change the structure. run_analysis.R should be placed directly in your working directory. 

###Summary

The run_analysis.R does the following: <br>
1. Merges the training and the test sets to create one data set. <br>
2. Extracts only the measurements on the mean and standard deviation for each measurement. <br>
3. Uses descriptive activity names to name the activities in the data set. <br>
4. Appropriately labels the data set with descriptive variable names. <br>
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. <br>

Additional information about the variables and data transformations are in the CodeBook.md file.