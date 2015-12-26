# Getting_And_Cleaning_Data script

## Course Project requirement

For the project create an R script called run_analysis.R that does the following:
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names. 
 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Steps to do
First download the data source (read Codebook.md in this repo), unzip it and place into your working folder.  
Place run_analysis.R in the working folder and set this folder as your working directory using setwd().  
Source the run_analysis.R code in R program.  
Then type runanalysis() in R, which will generate a new file tiny_data.txt in your working directory.  

Note : You can verify the output using read.table function.