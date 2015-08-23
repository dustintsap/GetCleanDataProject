# Codebook for the Getting and Cleaning Data Course Project

## *** Please make sure you use install.packages("Hmisc") and install.packages("dplyr") before proceeding to run the run_analysis.R script

This is a project that uses the Human Activity Recognition data from UC Irvine to generate a tidy data set for analysis. The source data uses the Samsung Galaxy S II on 30 subjects, completing 6 different activities (Walking, Walking upstairs, Walking downstairs, Sitting, Standing, Laying). 

### The R Script for this project (run_analysis.R), merge the data set by UC Irvine and completes the following 5 steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Tidy Data output - Grouping
As the project instructions aims to "creates a second, independent tidy data set with the average of each variable for each activity and each subject.", there has been multiple ways to approach this output. 
A detailed discussion can be found on the class discussion forum: https://class.coursera.org/getdata-031/forum/thread?thread_id=113
I have decided, based on the comments, to group the data first by activity, then by the subjects. That way, you can see all different subjects perfrom for the same activity, which I believe is the better influencer, and aligns with the objective of the study, which gathers the data based on activities, assuming the goal is to analyze designs of smartphones/applications based on activity types. 

## The Following are sample structures and summary of the tidy data set, and a list of all the output variables.

### Sample Structure of the Tidy Data Set
> str(tidy_data)
'data.frame':  180 obs. of  88 variables:
 $ subject                             : Factor w/ 30 levels "1","2","3","4",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ activity                            : Factor w/ 6 levels "Laying","Sitting",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ tBodyAcc_mean_X                     : num  0.222 0.281 0.276 0.264 0.278 ...
 $ tBodyAcc_mean_Y                     : num  -0.0405 -0.0182 -0.019 -0.015 -0.0183 ...
 $ tBodyAcc_mean_Z                     : num  -0.113 -0.107 -0.101 -0.111 -0.108 ...
 $ tBodyAcc_std_X                      : num  -0.928 -0.974 -0.983 -0.954 -0.966 ...
 $ tBodyAcc_std_Y                      : num  -0.837 -0.98 -0.962 -0.942 -0.969 ...
 $ tBodyAcc_std_Z                      : num  -0.826 -0.984 -0.964 -0.963 -0.969 ...
 $ tGravityAcc_mean_X                  : num  -0.249 -0.51 -0.242 -0.421 -0.483 ...
 $ tGravityAcc_mean_Y                  : num  0.706 0.753 0.837 0.915 0.955 ...
 $ tGravityAcc_mean_Z                  : num  0.446 0.647 0.489 0.342 0.264 ...
 $ tGravityAcc_std_X                   : num  -0.897 -0.959 -0.983 -0.921 -0.946 ...
 $ tGravityAcc_std_Y                   : num  -0.908 -0.988 -0.981 -0.97 -0.986 ...
 $ tGravityAcc_std_Z                   : num  -0.852 -0.984 -0.965 -0.976 -0.977 ...


### Sample Summary of the data set
> summary(tidy_data)
    subject                 activity  tBodyAcc_mean_X  tBodyAcc_mean_Y     tBodyAcc_mean_Z    tBodyAcc_std_X    tBodyAcc_std_Y    
 1      :  6   Laying           :30   Min.   :0.2216   Min.   :-0.040514   Min.   :-0.15251   Min.   :-0.9961   Min.   :-0.99024  
 2      :  6   Sitting          :30   1st Qu.:0.2712   1st Qu.:-0.020022   1st Qu.:-0.11207   1st Qu.:-0.9799   1st Qu.:-0.94205  
 3      :  6   Standing         :30   Median :0.2770   Median :-0.017262   Median :-0.10819   Median :-0.7526   Median :-0.50897  
 4      :  6   Walking          :30   Mean   :0.2743   Mean   :-0.017876   Mean   :-0.10916   Mean   :-0.5577   Mean   :-0.46046  
 5      :  6   Walkingdownstairs:30   3rd Qu.:0.2800   3rd Qu.:-0.014936   3rd Qu.:-0.10443   3rd Qu.:-0.1984   3rd Qu.:-0.03077  
 6      :  6   Walkingupstairs  :30   Max.   :0.3015   Max.   :-0.001308   Max.   :-0.07538   Max.   : 0.6269   Max.   : 0.61694  
 (Other):144                                                                                                                      
 tBodyAcc_std_Z    tGravityAcc_mean_X tGravityAcc_mean_Y tGravityAcc_mean_Z tGravityAcc_std_X tGravityAcc_std_Y tGravityAcc_std_Z
 Min.   :-0.9877   Min.   :-0.6800    Min.   :-0.47989   Min.   :-0.49509   Min.   :-0.9968   Min.   :-0.9942   Min.   :-0.9910  
 1st Qu.:-0.9498   1st Qu.: 0.8376    1st Qu.:-0.23319   1st Qu.:-0.11726   1st Qu.:-0.9825   1st Qu.:-0.9711   1st Qu.:-0.9605  
 Median :-0.6518   Median : 0.9208    Median :-0.12782   Median : 0.02384   Median :-0.9695   Median :-0.9590   Median :-0.9450  
 Mean   :-0.5756   Mean   : 0.6975    Mean   :-0.01621   Mean   : 0.07413   Mean   :-0.9638   Mean   :-0.9524   Mean   :-0.9364  
 3rd Qu.:-0.2306   3rd Qu.: 0.9425    3rd Qu.: 0.08773   3rd Qu.: 0.14946   3rd Qu.:-0.9509   3rd Qu.:-0.9370   3rd Qu.:-0.9180  
 Max.   : 0.6090   Max.   : 0.9745    Max.   : 0.95659   Max.   : 0.95787   Max.   :-0.8296   Max.   :-0.6436   Max.   :-0.6102  

### List of output variables for the tidy data set
 > colnames(tidy_data)
 [1] "subject"                              "activity"                             "tBodyAcc_mean_X"                     
 [4] "tBodyAcc_mean_Y"                      "tBodyAcc_mean_Z"                      "tBodyAcc_std_X"                      
 [7] "tBodyAcc_std_Y"                       "tBodyAcc_std_Z"                       "tGravityAcc_mean_X"                  
[10] "tGravityAcc_mean_Y"                   "tGravityAcc_mean_Z"                   "tGravityAcc_std_X"                   
[13] "tGravityAcc_std_Y"                    "tGravityAcc_std_Z"                    "tBodyAccJerk_mean_X"                 
[16] "tBodyAccJerk_mean_Y"                  "tBodyAccJerk_mean_Z"                  "tBodyAccJerk_std_X"                  
[19] "tBodyAccJerk_std_Y"                   "tBodyAccJerk_std_Z"                   "tBodyGyro_mean_X"                    
[22] "tBodyGyro_mean_Y"                     "tBodyGyro_mean_Z"                     "tBodyGyro_std_X"                     
[25] "tBodyGyro_std_Y"                      "tBodyGyro_std_Z"                      "tBodyGyroJerk_mean_X"                
[28] "tBodyGyroJerk_mean_Y"                 "tBodyGyroJerk_mean_Z"                 "tBodyGyroJerk_std_X"                 
[31] "tBodyGyroJerk_std_Y"                  "tBodyGyroJerk_std_Z"                  "tBodyAccMag_mean"                    
[34] "tBodyAccMag_std"                      "tGravityAccMag_mean"                  "tGravityAccMag_std"                  
[37] "tBodyAccJerkMag_mean"                 "tBodyAccJerkMag_std"                  "tBodyGyroMag_mean"                   
[40] "tBodyGyroMag_std"                     "tBodyGyroJerkMag_mean"                "tBodyGyroJerkMag_std"                
[43] "fBodyAcc_mean_X"                      "fBodyAcc_mean_Y"                      "fBodyAcc_mean_Z"                     
[46] "fBodyAcc_std_X"                       "fBodyAcc_std_Y"                       "fBodyAcc_std_Z"                      
[49] "fBodyAcc_meanFreq_X"                  "fBodyAcc_meanFreq_Y"                  "fBodyAcc_meanFreq_Z"                 
[52] "fBodyAccJerk_mean_X"                  "fBodyAccJerk_mean_Y"                  "fBodyAccJerk_mean_Z"                 
[55] "fBodyAccJerk_std_X"                   "fBodyAccJerk_std_Y"                   "fBodyAccJerk_std_Z"                  
[58] "fBodyAccJerk_meanFreq_X"              "fBodyAccJerk_meanFreq_Y"              "fBodyAccJerk_meanFreq_Z"             
[61] "fBodyGyro_mean_X"                     "fBodyGyro_mean_Y"                     "fBodyGyro_mean_Z"                    
[64] "fBodyGyro_std_X"                      "fBodyGyro_std_Y"                      "fBodyGyro_std_Z"                     
[67] "fBodyGyro_meanFreq_X"                 "fBodyGyro_meanFreq_Y"                 "fBodyGyro_meanFreq_Z"                
[70] "fBodyAccMag_mean"                     "fBodyAccMag_std"                      "fBodyAccMag_meanFreq"                
[73] "fBodyBodyAccJerkMag_mean"             "fBodyBodyAccJerkMag_std"              "fBodyBodyAccJerkMag_meanFreq"        
[76] "fBodyBodyGyroMag_mean"                "fBodyBodyGyroMag_std"                 "fBodyBodyGyroMag_meanFreq"           
[79] "fBodyBodyGyroJerkMag_mean"            "fBodyBodyGyroJerkMag_std"             "fBodyBodyGyroJerkMag_meanFreq"       
[82] "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)" "angle(tBodyGyroMean,gravityMean)"    
[85] "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                 "angle(Y,gravityMean)"                
[88] "angle(Z,gravityMean)"     