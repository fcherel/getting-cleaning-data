# getting-cleaning-data
coursera assignent

The run_analysis.R script supposes you downloaded and extracted the raw data in your working directory, so that, in your working directory, you have a directory named "UCI HAR Dataset", containing the original hiarchy ("test", "train", ...).
For example, this file path should exist: "[your working directory]/UCI HAR Dataset/test/X_test.txt".

The run_analysis.R scrip requires the package reshape2 to be installed.

The run_analysis.R scrip does the following:
1. it reads the data into R
2. it renames the variables
3. it replaces the activity codes by their desriptive names
4. it merges all the data together in the alldata fata frame (adding subject and activity columns to all measurements, and combining train and test data)
5. it selects only the subject, activity and mean and standard deviation of each measurement to make the selected_data
6. it takes the average of each variable of the selected data for each activity and each subject, using the reshape2 package, to make the avg_selected data frame
7. it writes this final data frame into a file
