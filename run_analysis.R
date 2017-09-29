## 1. Merges the training and the test sets to create one data set.

# Read input data files
subject_test<- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
X_train <- read.table("X_train.txt")
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

# Bind the data together, this part is just for measured data!
justdata <-rbind(X_test, X_train)
names(justdata) <- features[,2]

## 2. Extracts only the measurements on the mean and standard deviation 
#for each measurement.

# Obtain the indices of Mean and Std columns
MeanStdCol <- grep("std|mean\\(\\)", features[,2])

# Output the corresponding mean and standard deviation subset
MeanStd <- justdata[, MeanStdCol]

## 3. Uses descriptive activity names to name the activities in the data set.
# Lowercase all activities
activity[,2] <- tolower(activity[,2])

# Obtain a list of transformed activity names
activitycol <- rbind(y_test, y_train)
activity_for_all <- activity[activitycol[,1], 2]   
#this code returns a frame dimension of 10299*1, the corresponding name is related to #activity data frame (i.e., [3,2], [1,2]). The loop is conducted by activitycol[,1]

# Name the activity column
names(activity_for_all) <- c("activity")

## 4. Appropriately labels the data set with descriptive variable names.

# Bind the ID column
IDCol <- rbind(subject_test, subject_train)
names(IDCol) <- c("subject")

# Bind all data together including Human ID and Activity
wholedata <- cbind(IDCol, activity_for_all, justdata)

# Apply appropariate labels with descriptive variable names.
names(wholedata) <- gsub("\\(\\)", "", names(wholedata))
names(wholedata) <- gsub("mean", "Mean", names(wholedata))
names(wholedata) <- gsub("std", "Std", names(wholedata))
names(wholedata) <- gsub("-", "", names(wholedata))

write.table(wholedata, "Whole clean data.txt")

## 5. From the data set in step 4, creates a second, independent tidy data set with the # average of each variable for each activity and each subject.

# The purpose is to see all 30 participants with 6 activities. So we can define a #matrix for # the output data. The row is 30*6 and columm is 66, which is the same as #column number of # whole data.

result <- matrix(data=NA, nrow=180, ncol=66)
result <- as.data.frame(result)

row <- 1  # Initialize the row number
for (i in 1:30) {
    for (j in 1:6) {
        result [row,1] <- sort(unique(IDCol[,1])) [i]     # first column is from 1-30
        result [row,2] <- activity[j,2]                  # second column is from 1-6 
        result [row, 3:66] <- colMeans(wholedata[i==wholedata$subject&activity[j,2]==wholedata$activity, 3:66])   
        row <- row+1
    }
}

write.table(result, "Tidy dataset for mean.txt")


