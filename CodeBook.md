# Codebook

## `download-dataset.R`
This script downloads and extracts the dataset, storing the extracted folder into `data/uci-har-dataset`.

## `run_analysis.R`

This script performs the data preparation and then followed by the 5 steps as defined in the assignment constraints. First the data is loaded. The variables used to load the data are:

- `features`
from `features.txt`. The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

- `activity_labels` 
from `activity_labels.txt`. List of activities performed when the corresponding measurements were taken and its labels

- `subject_test`
from `test/subject_test.txt`. Contains subject ids of the 9 volunteers.

- `x_test`
from `test/X_test.txt`. Contains recorded features. test dataset.

- `y_test`
from `test/y_test.txt`. Contains activity codes. test dataset.

- `subject_train`
from `test/subject_train.txt`. Contains subject ids of the 21/30 volunteers being observed.

- `x_train`
from `test/X_train.txt`. Contains recorded features. train dataset.

- `y_train`
from `test/y_train.txt`. Contains activity codes. test dataset.


### Step 1
Merge the train and test dataset into a single dataset.

- variable `X` is created by merging `x_train` and `x_test` using `rbind()`
- variable `Y` is created by merging `y_train` and `y_test` using `rbind()`
- variable `subject` is created by merging `subject_train` and `subject_test` using `rbind()`
- variable `merged` is created by merging `subject`, `Y` and `X` using `cbind()`

### Step 2
Extract only the measurements on the mean and standard deviation for each measurement.

- variable `tidy` is created by subsetting `merged`; selecting only column `subject` and `code` and the measurements on the mean and standard deviation (std) for each measurement.

### Step 3
Use descriptive activity names to name the activities in the data set.

Activity codes in `code` column of `tidy` is replaced with corresponding activity name taken from second column of `activity_labels`


### Step 4
Appropriately labels the data set with descriptive variable names

- *code* column in `tidy` renamed into *activities*
- *Acc* in a column’s name replaced by *Accelerometer*
- *Gyro* in a column’s name replaced by *Gyroscope*
- *BodyBody* in a column’s name replaced by *Body*
- *Mag* in a column’s name replaced by *Magnitude*
- any column whose name starts with character *f* is replaced by *Frequency*
- any column whose name starts with character *t* is replaced by *Time*

### Step 5
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

- file `tidy.txt` created by sumarizing `tidy`; taking the means of each variable for each activity and each subject, after grouping by subject and activity.
