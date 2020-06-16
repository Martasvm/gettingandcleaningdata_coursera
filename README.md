# Getting and Cleaning Data Project

This repository includes all the files requested as part of the project for the Getting and Cleaning Data Course in Coursera Data Science track

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Output expected to be submitted:
1) tidy data set 
2) link to a Github repository with your script for performing the analysis
3) code book called CodeBook.md
4) README.md file

## Overview of the project:

Departing from data collected from the accelerometers from the Samsung Galaxy S smartphone that can be found at this website:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We must:
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement.
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names.
5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Files in this repo and how to use them:

1) run_analysis.R: This is an R script that contains the code to obtain the tidy dataset from the raw data.

Open the run_analysis.R script, change the working directory to the one you are using in your computer and run the code:
It will download the files directly from the website and unzip them. Then, the files will be processed following intructions 1 to 5 in the Overview section above, and a dataset with the name tidy_dataset will be generated and exported in csv format.
The script contains a description of the functioning of each part of the code.

2) tidy_dataset.csv: The tidy dataset required by the project in csv 

3) Codebook: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

4)This README.md file to guide you through all the process.
