setwd("C:/Users/kwkaufma/Documents/Training/Coursera/Exploratory Data Analysis")

x <- read.table("household_power_consumption.txt", header = TRUE, sep=";", colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character"))

#convert column to date
x$Date = as.Date(x$Date, "%d/%m/%Y")


#subset to just the days of interest
y <- subset(x, Date %in% c(as.Date("2007-02-01"),as.Date("2007-02-02") ) )

#create date time variable
dt_str <- paste(y$Date, y$Time, sep = " ")
DateTime <- strptime(dt_str, "%Y-%m-%d %H:%M:%S")
z <- cbind(y,DateTime)

#set values to numeric
z$Global_active_power <- as.numeric(z$Global_active_power)
z$Global_reactive_power <- as.numeric(z$Global_reactive_power)
z$Voltage <- as.numeric(z$Voltage)
z$Global_intensity <- as.numeric(z$Global_intensity)
z$Sub_metering_1 <- as.numeric(z$Sub_metering_1)
z$Sub_metering_2 <- as.numeric(z$Sub_metering_2)
z$Sub_metering_3 <- as.numeric(z$Sub_metering_3)

#create plot and save to a png file
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(z$DateTime, z$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(z$DateTime, z$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(z$DateTime, z$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
points(z$DateTime, z$Sub_metering_2, type = "l", col = "red")
points(z$DateTime, z$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(z$DateTime, z$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()

