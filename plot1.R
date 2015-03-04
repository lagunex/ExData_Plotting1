source("read_data.R")

##
# Plot a histogram in a PNG file called plot1.png
plot1 <- function() {
    data <- read_data()
    png(filename = "plot1.png", width = 480, height = 480)
    hist(data$Global_active_power,
         col="red",
         main ="Global Active Power",
         xlab="Global Active Power (kilowatts)"
        )
    dev.off()
}
