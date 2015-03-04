source("read_data.R")
source("plot2.R")
source("plot3.R")

##
# Plot 2 different line graphs given the data
#
# data - dataframe used for plotting
plotOthers <- function(data) {
    with(data, {
        xdata <- seq_along(Date)
        xlab = "datetime"
        plot(xdata, Voltage, type = "l", xlab = xlab, xaxt = "n")
        plotDateAxis(data)

        plot(xdata, Global_reactive_power, type = "l", xlab = xlab, xaxt = "n")
        plotDateAxis(data)
    })
}

##
# Plots 4 different graph in a 2x2 plot matrix
#
# data - dataframe used for plotting
# toPng - indicates if the result must be saved in a file called plot4.png
plot4 <- function(data = NULL, toPng = TRUE) {
    data <- if (is.null(data)) { read_data() } else { data }

    if (toPng) {
        png(filename = "plot4.png", width = 480, height = 480)
    }

    par(mfcol = c(2,2))
    plot2(data, toPng = FALSE, ylab = "Global Active Power")
    plot3(data, toPng = FALSE, legendBorder = FALSE)
    plotOthers(data)

    if (toPng) {
        dev.off()
    }
}
