data_folder <- "data"
zip_file <- file.path(data_folder, "dataset.zip")
dataset_folder <- file.path(data_folder, "uci-har-dataset")

# checking if the dataset folder exists
if (! file.exists(dataset_folder)) {
    # create the data folder if it doesnt exist
    dir.create(data_folder, showWarnings = FALSE)

    # checking if the dataset zip file already exists
    if (! file.exists(zip_file)) {
        download.file(
            "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
            zip_file,
            method="curl"
        );
    }

    # unziping zip file
    unzip(zip_file, exdir = dataset_folder)
}
