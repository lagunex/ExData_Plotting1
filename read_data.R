##
# utility function to download and unzip the data
download_unzip <- function() {
    URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    FILE_NAME <- "household_power_consumption"
    ZIP_NAME <- paste(FILE_NAME, ".zip", sep = "")
    download.file(URL, destfile = ZIP_NAME , method = "curl")
    unzip(ZIP_NAME)
}

##
# utility function that reads the unzipped data
# for the period [2007-02-01, 2007-02-02]
# this functions is called in all plotX function
# if they don't received data as an input parameter
read_data <- function() {
    FILE_NAME <- "household_power_consumption"
    TXT_NAME <- paste(FILE_NAME, ".txt", sep = "")

    fullData <- read.csv(TXT_NAME,
                     sep = ";",
                     header = TRUE,
                     na.strings = "?",
                     colClasses = c("character", "character", rep("numeric", 7))
    )
    data <- fullData[grep("^[12]/2/2007", fullData$Date),]

    data$Date <- strptime(data$Date, "%d/%m/%Y")
    data
}
