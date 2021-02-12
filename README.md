# Getting and Cleaning Data - Coursera

This repo contains the code for the assignment of week 4 of the Getting and Cleaning Data course on Coursera

## The data

The UCI dataset, which is a Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

## The Question

create a R script, which

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the data set in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How to run

Clone this repository using:

```
$ git clone https://github.com/firekind/coursera-getting-and-cleaning-data-assignment
```

first, download the dataset. This can be done by using the `download-dataset.R` file, by running:

```
$ Rscript download-dataset.R
```

and to create the tidied dataset, make sure you have the `dplyr` package installed, and then run:

```
$ Rscript run_analysis.R
```
