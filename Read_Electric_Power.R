# *** Read file ***
# Here we read the file, considering only a subset of the data to nor overload 
# memory. To do so, we first read the header of the file, used to read only the 
# `Dates` variable. Afterwards, we analyse dates and pick only the needed range.

# The dataset is encapsulated in a zip file
## zip file name
zip_name <- "exdata-data-household_power_consumption.zip"
unzip(zip_name, exdir = "./")

## File name
file_name <- "household_power_consumption.txt"

## First, read the header of the file
header <- read.table(file_name, nrows=1, header=TRUE, sep=";")
## Here we retrieve the class of each column
colClasses <- as.list(apply(header, 2, class))
# Now, we can retrieve only the dates column to find the proper range of rows to read
dates <- read.table(file_name, header=TRUE, 
           colClasses=c(colClasses[[1]], rep("NULL", length(colClasses)-1)), sep=";")

## We register the first row where the date coincides with our lower limit
min_val <- min(which(dates == "1/2/2007"))
# We do something similar happens for the upper limit
max_val <- length(which(dates == "1/2/2007")) + length(which(dates == "2/2/2007"))

## Finally, we read the file:
df <- read.table(file_name, skip = min_val, nrows = max_val, 
           header=FALSE, sep=";", col.names=names(header))

## At last, check whether there are missing values in the data
if (any(df == "?")){
  print("Fix missing values.")
}

## At last, remove data no longer needed in memory
rm(dates, header, colClasses, max_val, min_val, file_name)