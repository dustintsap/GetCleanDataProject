# Getting and Cleaning Data Course Project

This is the course project for the Coursera Getting and Cleaning Data Course, completed by Dustin Tsap.
It utilizes the raw data provided by UC Irvine 
(See Code Book and UC Irvine website for more details)
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Contents

README.md - This file. Provides a high level overview of this repo and the purpose and components of this project.
CodeBook.md - Describes the steps taken by the project's R Script to create a tidy data set from the raw data. 
run_analysis.R - The project R script that completes the steps of transforming the raw data into a tidy data set. 

*The output of the tidy data set has been attached to the Coursera Course project submission site on August 23, 2015.

## run_analysis.R
The script completes the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## CodeBook.md
The code book contains a description of the project and why certain logic and parameters that determine the tidy data set output was selected for the R Script. It also contains a list of output variables from the tidy data set, along with a sample summary and sample structure of the tidy data set. 