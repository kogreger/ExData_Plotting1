setwd("~/Documents/Coursera/Data Science Specialization/Exploratory Data Analysis/ExData_Plotting1")

# load and prepare data
data <- read.csv("household_power_consumption.txt", 
                 header = TRUE, 
                 sep = ";", 
                 na.strings = "?", 
                 colClasses = c("character", "character", "numeric", "numeric", 
                                "numeric", "numeric", "numeric", "numeric", 
                                "numeric"))
format(object.size(data), units = "auto")
data$datetime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S", tz = "GMT")
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Plot 2
png(file = "figure/plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()