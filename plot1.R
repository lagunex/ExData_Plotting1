source("read_data.R")

##
# Plot a histogram in a PNG file called plot1.png
#
# data - dataframe used for plotting
plot1 <- function(data = NULL) {
    data <- if (is.null(data)) { read_data() } else { data }
    png(filename = "plot1.png", width = 480, height = 480)
    hist(data$Global_active_power,
         col="red",
         main ="Global Active Power",
         xlab="Global Active Power (kilowatts)"
        )
    dev.off()
}
