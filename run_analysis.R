# This code is an assignment project for getting and cleaning data
# course of the John Hopkin's Data Science Specialisation.

# The below code combines two data set into one and subsequently
# performs more functions as required by the course project. The 
# functions can be simplified further, but kept simple for 
# everyone to understand. Most of the codes are designed similar
# to steps followed in MS Excel program.

# Define a generic function runanalysis with no defaults.

runanalysis <- function()
{
    ##START##
    
# Libraries defined before the code(Assuming the user has 
# installed the necessary pacakages).
    library(plyr)
    library(dplyr)
# Read all tables from the current working directory, after unziping
# the necessary data.
    labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
    colnames(labels) <- c("labels","activities")
    feas <- read.table("./UCI HAR Dataset/features.txt")
    testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
    testlab <- read.table("./UCI HAR Dataset/test/y_test.txt")
    trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    trainset <- read.table("./UCI HAR Dataset/train/X_train.txt")
    trainlab <- read.table("./UCI HAR Dataset/train/y_train.txt")
# Updating the column names of the two data sets with the names
# provided in the features data
    colnames(trainset) <- feas[,2]
    colnames(testset) <- feas[,2]

    # Activity 1 merge data
    
# As the data is of same column dimensions, we use rbind()
    masterset <- rbind(testset,trainset)
# Binding the labels 
    masterlab <- rbind(testlab,trainlab)
    colnames(masterlab)[1] <- "labels"
# Binding subjects too
    mastersub <- rbind(testsub,trainsub)
    colnames(mastersub)[1] <- "subject"
# Column binding all the three data, as all have same row 
# dimensions
    master <- cbind(masterset,label=masterlab,subject=mastersub)
    
    # Activity 2 extract only mean and std
    
    feasext1 <- feas[grep("mean()",feas[,2],fixed=TRUE),]
    feasext2 <- feas[grep("std()",feas[,2],fixed=TRUE),]
# Creating a vector of the row numbers alone
    feasext <- rbind(feasext1,feasext2)[,1]
    masterext <- master[,c(feasext,562:563)]
    
    # Activity 3 using descriptive activity names
  
    mastername <- join(masterext,labels,by="labels")
# join is used here as it is a simple function to 
# lookup up variables
    
    # Activity 4 Labeling the variables appropriately
    
    tempname <- names(mastername)
# multiple name changes are used to make the headings more clear
    tempname <- gsub("[[:punct:]]","",tempname)
    tempname <- gsub("^t","TIME_",tempname)
    tempname <- gsub("^f","FREQ_",tempname)
    tempname <- gsub("mean","Mean_",tempname)
    tempname <- gsub("std","StanDev_",tempname)
    tempname <- gsub("Acc","Acc_",tempname)
    tempname <- gsub("Gyro","Gyro_",tempname)
    tempname <- gsub("Body","Body_",tempname)
    tempname <- gsub("Gravity","Gravity_",tempname)
    tempname <- gsub("Jerk","Jerk_",tempname)
    tempname <- gsub("Mag","Mag_",tempname)
# few more minor changes    
    tempname <- gsub("Body_Body_","Body_",tempname)
    tempname <- gsub("_$","",tempname)
    
names(mastername) <- tempname     

    #5 grouping by activities and labels
    
# using dplyr to summarise 
    mastername <- select(mastername,-labels)
    mastergrp <- group_by(mastername,activities,subject)
    finalout <- summarise_each(mastergrp,funs(mean))
    write.table(finalout, file = "./tidy_data.txt",row.name = FALSE)
    
    ##END##
    }