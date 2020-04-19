# Get-Clean-Data-Project
"Getting and Cleaning Data" course project (coursera)

This repo contains my submission for the peer-reviewed assignment of week 4 of the “Getting and Cleaning Data” coursera course.

This project uses data collected from the accelerometer and gyroscope of Samsung Galaxy S II smartphones for 30 subjects, each performing 6 activities. A more detailed description of the data set is available here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The “messy” data was obtained from this link from the course website:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The **run_analysis.R** script describes how to download this messy data folder into R and then read the relevant files. The script allows to perform the following steps of the assignment:
  1.	Prepare the data sets of interest before merging them
  2.	Extract the columns of interest for the project
  3.	Rename some of the observations from numbers to text
  4.	Change the column labels to more descriptive variable names
  5.	Generate a new tidy data set summarizing the data

The **CodeBook.md** file describes the study design, the work performed to clean up the data, and the variables.
