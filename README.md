# GettingAndCleaningData
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The following files are included: 1) a tidy data set as described below, 2) a link to a Github repository for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that have been performed to clean up the data called CodeBook.md. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps to produce the clean datasets:
1. Unzip and put all data files in the working directory.
2. Run the run_analysis.R in the RStudio.
3. Two files will be generated: 
   1. The whole dataset, which is stored in "Whole clean data.txt"; 
   2. The second tidy dataset for the average for each activity and each subject, which is stored in "Tidy dataset for mean.txt".
