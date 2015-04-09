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
png(filename = "plot1.png", width = 480, height = 480)
hist(z$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()

