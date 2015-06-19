## 1.  Merges the training and test sets to create one data set.
##Set Working Directory
setwd('C:/Coursera/UCI HAR Dataset');

##Read in Tables
features <- read.table('./features.txt',header=FALSE);
activity_labels <- read.table('./activity_labels.txt',header=FALSE);
subject_train <- read.table('./train/subject_train.txt',header=FALSE);
x_train <- read.table('./train/x_train.txt',header=FALSE); 
y_train <- read.table('./train/y_train.txt',header=FALSE); 
subject_test <- read.table('./test/subject_test.txt',header=FALSE);
x_test <- read.table('./test/x_test.txt',header=FALSE); 
y_test <- read.table('./test/y_test.txt',header=FALSE);

##Assign Column Names
colnames(activity_labels) <- c('activity_id', 'activity_type');
colnames(subject_train) <- "subject_id";
colnames(x_train) <- features[,2];
colnames(y_train) <- "activity_id";
colnames(subject_test) <- "subject_id";
colnames(x_test) <- features[,2]; 
colnames(y_test) <- "activity_id";

##Merge training & test data
total_training <- cbind(y_train,subject_train,x_train);
total_test <- cbind(y_test, subject_test, x_test);
training_and_test <- rbind(total_training, total_test);

##2. Extracts only the measurements on the mean and standard deviation for each measurement
##Creating Vector with Column Names
column_names <- colnames(training_and_test);

##Getting only mean and std columns
mean_columns <- grep("mean()", column_names, fixed = TRUE);
std_columns <- grep("std()", column_names, fixed = TRUE);
only_relavant_columns <- c(1,2,mean_columns, std_columns);
training_and_test2 <- training_and_test[only_relavant_columns];

##3.  Uses descriptive activity names to name the activities in the data set
##Adding descriptive activity type to final dataset
training_and_test3 <- merge(training_and_test2,activity_labels,
                          by='activity_id',all.x=TRUE)
training_and_test4 <- subset(training_and_test3, select=c(69,2:68))

##4. Appropriately labels the data set with descriptive variable names.
##Renaming column names
names(training_and_test4) <- gsub('\\(|\\)',"",names(training_and_test4), perl = TRUE)
names(training_and_test4) <- make.names(names(training_and_test4))
names(training_and_test4) <- gsub('\\.mean',".Mean",names(training_and_test4))
names(training_and_test4) <- gsub('\\.std',".StandardDeviation",names(training_and_test4))
names(training_and_test4) <- gsub('Acc',"Acceleration",names(training_and_test4))
names(training_and_test4) <- gsub('Mag',"Magnitude",names(training_and_test4))
names(training_and_test4) <- gsub('^t',"Time",names(training_and_test4))
names(training_and_test4) <- gsub('^f',"Frequency",names(training_and_test4))
names(training_and_test4) <- gsub('Freq\\.',"Frequency.",names(training_and_test4))
names(training_and_test4) <- gsub('Freq$',"Frequency",names(training_and_test4))

##5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
##Finding mean of each column by subject and activity
final_output <- aggregate(training_and_test4 [,3:68], training_and_test4 [,1:2], FUN=mean)

#Write the summarized dataset out to a txt file
write.table(final_output, file = "./final.txt", sep=",", row.names=FALSE)
