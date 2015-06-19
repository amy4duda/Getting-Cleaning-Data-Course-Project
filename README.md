### Getting-Cleaning-Data-Course-Project README File

####Overview
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained

####Assignment Requirements
You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

####Data Location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

####Data Description
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

####Processes in run_analysis.R Script

1. Set Working Directory
2. Read in Tables
3. Assign Column Names
4. Merge Training and Test Data
5. Create Vector with Column Names
6. Keep Only Mean and Standard Deviation Columns
7. Add Descriptive Activity Type to Dataset
8. Rename Column Names to be Descriptive
9. Find Mean of Each Column by Subject and Activity

####Code Book
Describes the variables, the data, and any transformations performed to clean up the data
    

