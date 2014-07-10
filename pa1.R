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

# Plot 1
png(file = "figure/plot1.png", width = 480, height = 480)
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red")
dev.off()

# Plot 2
png(file = "figure/plot2.png", width = 480, height = 480)
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

# Plot 3
png(file = "figure/plot3.png", width = 480, height = 480)
plot(data$datetime, data$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, 
      col = "red")
lines(data$datetime, data$Sub_metering_3, 
      col = "blue")
legend("topright", 
       lty = c(1,1), 
       col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

# Plot 4
png(file = "figure/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$datetime, data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

plot(data$datetime, data$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

plot(data$datetime, data$Sub_metering_1, 
     type = "n", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1)
lines(data$datetime, data$Sub_metering_2, 
      col = "red")
lines(data$datetime, data$Sub_metering_3, 
      col = "blue")
legend("topright", 
       bty = "n", 
       lty = c(1,1), 
       col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$datetime, data$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()