source("read_data.R")

##
# Plot the x-axis with weekdays in the current plot
# this function is also called in plot3.R and plot4.R
#
# data - dataframe to extract the weekdays from
plotDateAxis <- function(data) {
    with(data, {
        Sys.setlocale("LC_TIME", "en_GB") # to assure English names

        # data set has 2880 entries, 1440 on Thu and 1440 on Fri (no Sat)
        at <- c(1, as.integer(length(data$Date)/2)+1, length(Date))

        # add one day (in seconds) to last label
        labels <- strftime(c(Date[at[1:2]], Date[at[3]]+86400), "%a")
        axis(side = 1, at = at, labels = labels)
    })
}

##
# Plots a line plot for Global Active Power through time
#
# data - dataframe for plotting
# toPng - indicates if the results must be saved in a PNG file called plot2.png
# ylab - label for the y-axis in this plot
plot2 <- function(data = NULL,
                  toPng = TRUE,
                  ylab = "Global Active Power (kilowatts)") {
    data <- if (is.null(data)) { read_data() } else { data }

    if (toPng) {
        png(filename = "plot2.png", width = 480, height = 480)
    }

    with(data, {
        plot(seq_along(Date), Global_active_power,
             xlab = "", ylab = ylab,
             type = "l",
             xaxt = 'n' # removes the default x label to later plot weekdays
        )
        plotDateAxis(data)
    })

    if (toPng) {
        dev.off()
    }
}
