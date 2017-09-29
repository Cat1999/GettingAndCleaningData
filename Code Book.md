This code book includes some variables and steps for getting the clean data.

The whole group includes 30 people. In general, there are two parts of results: test part and train part. 

# There are 6 activities conducted:
1 Walking
2 Walking upstairs
3 Walking upstairs
4 Sitting
5 Standing
6 Laying

# Different signals are measured and recorded in the X, Y and Z directions:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

# The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

# The following steps are applied to obtained the clean dataset:
1. Download the datasets from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Read the dataset description.
3. Set the proper working directory. I have put all files in the same folder for convinience.
4. Read the data from corresponding files for later use, which include:

subject_test<- read.table("subject_test.txt")
subject_train <- read.table("subject_train.txt")
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
y_train <- read.table("y_train.txt")
X_train <- read.table("X_train.txt")
features <- read.table("features.txt")
activity <- read.table("activity_labels.txt")

5. Bind the X_test and X_train together to obtain the dataset for measured values. 

6. Obtain the indices of Mean and Std columns using grep() function and then output the corresponding mean and standard deviation subset.

7. First we lowercase the names of the subset. Then, we should transform the activity number in the second column to real activity that have been performed. Name this column to be "activity".

8. Several changes have been made to label the variable names using gsub() function. First we removed () and captalize mean and std for the first letter. We also remove the - character. 

9. Bind the subject, activity and measured values datasets together to a whole dataset. Output the results to "Whole clean data.txt". 

10. Finally, we can generate a second tidy dataset for each activity and each subject. There are 30 participants with 6 activities. So we can define a matrix then convert it to a data frame. The row is 30*6 and columm is 66, which is the same as column number of whole dataset. Two loops are used to calculate the average values for each activity and each subject.

11. Output the results to "Tidy dataset for mean.txt".
