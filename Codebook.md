# Getting_And_Cleaning_Data CodeBook

## Data source

This data is a record of the human activity using smartphone features. A full description of the data is is available :
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data was sourced from the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
Then the data was unzipped in the working folder.

Once extracted from Zip file, we have the following folders:

1. UCI HAR Dataset
2. UCI HAR Dataset/test
3. UCI HAR Dataset/train

The following files are loaded on to the R program:
- UCI HAR Dataset/features.txt
- UCI HAR Dataset/activity_labels.txt
- UCI HAR Dataset/test/X_test.txt
- UCI HAR Dataset/test/y_test.txt
- UCI HAR Dataset/test/subject_test.txt
- UCI HAR Dataset/train/X_test.txt
- UCI HAR Dataset/train/y_test.txt
- UCI HAR Dataset/train/subject_test.txt


## Study Design
Refer to the README.txt and features_info.txt files in the 'UCI HAR Dataset' folder to understand how the data was collected and what measurements are present in the files loaded in R. The details of the variables (column names) and the data are mentioned in these files.

The set of variables that were estimated for this assignment are:

 - Mean value
 - Standard deviation

Other estimates have been removed for the purpose of this exercise.

## Data Transformations

As per assignment requirement: 
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Steps used to produce the final output
**Note** : For this code to run, install packages - plyr and dplyr  
Once we upload all the data into R, we substitute the column names to each X file of test and train data set.  
Then we combine them with the labels and subject info(y file and subject file).  
The 2 files of test and train data are combined as a master data set.  
We select only those columns from master data which contain the characters - "mean()" or "std()".  
Activity labels are substituted for the label values.  
Name changes are effected on the column names to make it concise.  
The data is finally grouped by activity and subject and the average of the variables are calculated for each group.  
Final output is written to the working folder as "tidy_data.txt".  

## Final Output
The final output of the code - 'run_analysis.R' is the 'tidy_data.txt' file which contains the transformed data.  
The final output is an aggregate of the variables selected for the assignment purpose with classifications by activity and subject.
