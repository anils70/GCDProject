---
title: "ReadME"
author: "Anil Sharma"
date: "December 27, 2015"
output: html_document
---

#GCD Project Work

Getting and Cleaning Data Project work


## Script layout
1. Unzip the input dataset in project working directory
2. Read Activity Lables from given text file into table
3. Read Features Lables from given text file into table. Make features names user friendly
4. Read test data into table and label the activity & features
5. Read training data into a table and label it 
6. Merge test and training data
7. Grep the columns which contain mean and standard deviation data
8. Combine the data with SubjectID and Activity
9. Find averages for each subject's activity 
10.Add SubjectID as first column
11.Write data to output file

###Run the script
From the working directory, run the run_analysis.R script which is in this github repository


projectFinalData.txt is created which contains the tidy data set.


##Code Book

Code book provides the detail of the tidy dataset


##Input data set

Input dataset can be downloaded into working directory from [here] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

