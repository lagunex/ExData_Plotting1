source("read_data.R")
source("plot2.R")

##
# Plots a multi series line graph for the different Energy sub meterings
#
# data - dataframe for plotting
# toPng - indicates if the plot must be saved in a PNG file called plot3.png
# legendBorder - indicates if the legend must be enclosed in a box
plot3 <- function(data = NULL, toPng = TRUE, legendBorder = TRUE) {
    data <- if (is.null(data)) { read_data() } else { data }

    if (toPng) {
        png(filename = "plot3.png", width = 480, height = 480,
            bg = "transparent")
    }

    with(data, {
        xdata <- seq_along(Date)
        plot(xdata, Sub_metering_1,
             xlab = "", ylab = "Energy sub metering",
             type = "l",
             xaxt = 'n'
        )
        lines(xdata, Sub_metering_2, col = "red")
        lines(xdata, Sub_metering_3, col = "blue")

        bty <- if (legendBorder) { "o" } else { "n" }
        legend("topright",
               lty = 1,
               col = c("black", "red", "blue"),
               bty = bty,
               legend = names(data[7:9]))
        plotDateAxis(data)
    })

    if (toPng) {
        dev.off()
    }
}
