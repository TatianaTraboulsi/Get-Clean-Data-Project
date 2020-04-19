**Study design describing how the data was collected:** 

From the original code book of the study (README.txt file in the zip folder): 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

**Data files used for this assignment:**
* 'features.txt' listing the variables names and 'features_info.txt' describing those variables
* 'activity_labels.txt' which associates a number with each activity

For the training set:
* 'train/subject_train.txt': Each row identifies the subject number
* 'train/y_train.txt': Each row identifies the activity (labeled 1 to 6)
* 'train/X_train.txt': The training set consisting of a 561-feature vector with time and frequency domain variables (the column labels are in the 'features.txt' file)

For the test data set (same description as above):
* 'test/subject_test.txt'
* 'test/y_test.txt'
* 'test/X_test.txt

**Summary of the choices made to clean up the data:**

The data was processed entirely with R version 3.6.3 (2020-02-29) run on a Windows 10 PC.

The zipped folder containing the messy data was downloaded and its files extracted.
The following steps were applied to clean up the data: 
1.	A training dataset was prepared by merging the subject identifier ('train/subject_train.txt') with the activity identifier ('train/y_train.txt') and with the time and frequency domain variables data ('train/X_train.txt'). Similarly, a test dataset was prepared by merging the corresponding files. **The training and test sets were then merged to create one data set.**
2.	The names of the columns (found in the 'features.txt' file) were added to the merged dataset. The column labels containing mean and standard deviation measurements were identified. **The columns containing mean and standard deviation measurements were extracted.**
3.	The name of the activity associated with each activity number was extracted from the 'activity_labels.txt' file. The names were reformatted to be in all lowercase and to remove the underscores. **These descriptive activity names were then used to replace the numbers in the activity column in the merged data set.**
4.	**The column labels were changed to more descriptive variable names**, by using the gsub() function and removing dashes and parentheses.
5.	**The data was grouped in a new tidy dataset by subject and by activity, then the average for each variable measurement was returned.** The dataset was reshaped into a tall and skinny dataset.

**Code book describing the variables in the final tidy dataset:**

**subject**
* A number from 1 to 30 representing one of the thirty volunteers

**activity**
*	laying
*	sitting
*	standing
*	walking
*	walking downstairs
*	walking upstairs

**variable**

From the 'features_info.txt' file:
The time domain signals captured at constant rate of 50 Hz from the accelerometer and gyroscope 3-axial (x, y, z) raw signals. Signals were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The accelerometer signal was then separated into body and gravity signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
The body linear acceleration and angular velocity were derived in time to obtain jerk signals.
The magnitude of these three-dimensional signals was calculated using the Euclidean norm.
A Fast Fourier Transform (FFT) was applied to some of these signals, which are annotated as frequency signals.
The mean values and standard deviations were estimated for these signals.
Time is in seconds and frequency in Hertz.

* time of body accelerometer signal mean of x axis
* time of body accelerometer signal mean of y axis
* time of body accelerometer signal mean of z axis
* time of body accelerometer signal standard deviation of x axis
* time of body accelerometer signal standard deviation of y axis
* time of body accelerometer signal standard deviation of z axis
* time of gravity accelerometer signal mean of x axis
* time of gravity accelerometer signal mean of y axis
* time of gravity accelerometer signal mean of z axis
* time of gravity accelerometer signal standard deviation of x axis
* time of gravity accelerometer signal standard deviation of y axis
* time of gravity accelerometer signal standard deviation of z axis
* time of body accelerometer signal jerk mean of x axis
* time of body accelerometer signal jerk mean of y axis
* time of body accelerometer signal jerk mean of z axis
* time of body accelerometer signal jerk standard deviation of x axis
* time of body accelerometer signal jerk standard deviation of y axis
* time of body accelerometer signal jerk standard deviation of z axis
* time of body gyroscope signal mean of x axis
* time of body gyroscope signal mean of y axis
* time of body gyroscope signal mean of z axis
* time of body gyroscope signal standard deviation of x axis
* time of body gyroscope signal standard deviation of y axis
* time of body gyroscope signal standard deviation of z axis
* time of body gyroscope signal jerk mean of x axis
* time of body gyroscope signal jerk mean of y axis
* time of body gyroscope signal jerk mean of z axis
* time of body gyroscope signal jerk standard deviation of x axis
* time of body gyroscope signal jerk standard deviation of y axis
* time of body gyroscope signal jerk standard deviation of z axis
* time of body accelerometer signal magnitude mean
* time of body accelerometer signal magnitude standard deviation
* time of gravity accelerometer signal magnitude mean
* time of gravity accelerometer signal magnitude standard deviation
* time of body accelerometer signal jerk magnitude mean
* time of body accelerometer signal jerk magnitude standard deviation
* time of body gyroscope signal magnitude mean
* time of body gyroscope signal magnitude standard deviation
* time of body gyroscope signal jerk magnitude mean
* time of body gyroscope signal jerk magnitude standard deviation
* frequency of body accelerometer signal mean of x axis
* frequency of body accelerometer signal mean of y axis
* frequency of body accelerometer signal mean of z axis
* frequency of body accelerometer signal standard deviation of x axis
* frequency of body accelerometer signal standard deviation of y axis
* frequency of body accelerometer signal standard deviation of z axis
* frequency of body accelerometer signal jerk mean of x axis
* frequency of body accelerometer signal jerk mean of y axis
* frequency of body accelerometer signal jerk mean of z axis
* frequency of body accelerometer signal jerk standard deviation of x axis
* frequency of body accelerometer signal jerk standard deviation of y axis
* frequency of body accelerometer signal jerk standard deviation of z axis
* frequency of body gyroscope signal mean of x axis
* frequency of body gyroscope signal mean of y axis
* frequency of body gyroscope signal mean of z axis
* frequency of body gyroscope signal standard deviation of x axis
* frequency of body gyroscope signal standard deviation of y axis
* frequency of body gyroscope signal standard deviation of z axis
* frequency of body accelerometer signal magnitude mean
* frequency of body accelerometer signal magnitude standard deviation
* frequency of body accelerometer signal jerk magnitude mean
* frequency of body accelerometer signal jerk magnitude standard deviation
* frequency of body gyroscope signal magnitude mean
* frequency of body gyroscope signal magnitude standard deviation
* frequency of body gyroscope signal jerk magnitude mean
* frequency of body gyroscope signal jerk magnitude standard deviation

**average**
* average of each variable for each activity and subject
