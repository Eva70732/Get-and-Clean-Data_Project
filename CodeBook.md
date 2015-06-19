# Coursera Data Science: Getting and Cleaning Data Course Project

Here you can find all information about data used for this Project: data source, variables, instructions, etc.

## Preconditions

Full description of current Project research can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for analysis can be downloaded here: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

{data.table} and {reshape2} R packages should be downloaded and installed

## Instructions

According to the Coursera Project assignment we should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set:
*   download and read datasets into R using read.table()
*   merge data to the final common dataset using rbind() and cbind()
2. Extracts only the measurements on the mean and standard deviation for each measurement: 
*   find column numbers which contains "mean()" or "std()" using grep()
*   subset final dataset with this column numbers
3. Uses descriptive activity names to name the activities in the data set:
*   using sapply() and switch() replace Activities variable codes with connected activities labels
*   please double-check that your Activity variable is an _atomic_ variable
4. Appropriately labels the data set with descriptive variable names:
*   this step was done in Step 1-3 so just take some break for double-check using names() or head()
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject:
*   using melt() and dcast() functions we receive new data average which is grouped by subject, by activity 
*   use write.table() with argument row.name=FALSE to save this data as .txt file


## The Data

*   X_train --- data from X_train.txt file
*   X_text --- data from X_test.txt file
*   features --- data from features.txt file
*   X_features --- features variable transformed to character vector
*   X_table --- data.frame as a combination of X_train and X_test variables
*   S_train --- data from subject_train.txt file
*   S_test --- data from subject_test.txt file
*   S_table --- data.frame as a combination of S_train and S_test variables
*   y_train --- data from y_train.txt file
*   y_test --- data from y_test.txt file
*   y_table --- data.frame as a combination of y_train and y_test variables
*   mydata --- main dataset where all data from the X..., S..., y... variables is combined
*   meanfilter --- vector of column numbers from mydata which contained mean() data
*   stdfilter --- vector of column numbers from mydata which contained std() data
*   colfilter --- vector of column numbers from mydata which contained mean() OR std() data
*   X_filter --- data.frame X_table subsetted with colfilter
*   y_labels --- data from activity_labels.txt
*   melt_data --- melted mydata dataset
*   tidy_data --- independent dataset with the average of each variable from mydata dataset grouped by subject, by activity 













