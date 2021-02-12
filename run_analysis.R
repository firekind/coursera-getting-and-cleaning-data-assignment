library(dplyr)

# defining variables
dataset_path <- file.path("data", "uci-har-dataset", "UCI HAR Dataset")

# loading data from dataset
## loading meta
features <- read.table(file.path(dataset_path, "features.txt"), col.names = c("n", "functions"))
activity_labels <- read.table(file.path(dataset_path, "activity_labels.txt"), col.names = c("code", "activity"))

## loading test
subject_test <- read.table(file.path(dataset_path, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(dataset_path, "test", "X_test.txt"), col.names = features$functions)
y_test <- read.table(file.path(dataset_path, "test", "y_test.txt"), col.names = "code")

## loading train
subject_train <- read.table(file.path(dataset_path, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(dataset_path, "train", "X_train.txt"), col.names = features$functions)
y_train <- read.table(file.path(dataset_path, "train", "y_train.txt"), col.names = "code")


# Merging train and test sets to create one dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged <- cbind(subject, X, Y)

# Extracting only measurements on mean and std for each measurement
tidy <- merged %>% select(subject, code, contains("mean"), contains("std"))

# Using descriptive activity names to name the activies in the dataset
tidy$code <- activity_labels[tidy$code, 2]

# Labelling the dataset with descriptive names
names(tidy)[2] = "activity"
names(tidy)<-gsub("Mag", "Magnitude", names(tidy))
names(tidy)<-gsub("-std()", "STD", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("Acc", "Accelerometer", names(tidy))
names(tidy)<-gsub("^t", "Time", names(tidy))
names(tidy)<-gsub("^f", "Frequency", names(tidy))
names(tidy)<-gsub("Gyro", "Gyroscope", names(tidy))
names(tidy)<-gsub("angle", "Angle", names(tidy))
names(tidy)<-gsub("gravity", "Gravity", names(tidy))
names(tidy)<-gsub("-mean()", "Mean", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("BodyBody", "Body", names(tidy))
names(tidy)<-gsub("-freq()", "Frequency", names(tidy), ignore.case = TRUE)
names(tidy)<-gsub("tBody", "TimeBody", names(tidy))

# creating tidied dataset, and storing it in tidy.txt
write.table(
    tidy %>% group_by(subject, activity) %>% summarize_all(funs(mean)), 
    "tidy.txt",
    row.name=FALSE
)
