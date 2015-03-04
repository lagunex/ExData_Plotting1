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
# this functions is called in all plotX.R
read_data <- function() {
    FILE_NAME <- "household_power_consumption"
    TXT_NAME <- paste(FILE_NAME, ".txt", sep = "")

    data_header <- read.csv(TXT_NAME, header = F, sep=";", nrow = 1, stringsAsFactors = F)

    # only read entries for the specified period
    # skip and nrow values were computed using standard UNIX tools (nl, grep, wc, etc.)
    data <- read.csv(TXT_NAME, header = F, sep = ";", skip = 66637, nrow = 2880)

    names(data) <- data_header
    data$Date <- strptime(data$Date, "%d/%m/%Y")
    data
}
