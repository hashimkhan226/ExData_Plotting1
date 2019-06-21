library(lubridate)

#Read in only dates from 2007-02-01 to 2007-02-02
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880, na.strings = "?")

#Name the columns
names(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Convert date column to character and then to Date class
df[,1] <- as.character(df[,1])
df[,1] <- as.Date(df[,1], format="%d/%m/%Y")

#Create histogram of Global Active Power
hist(df[,3], col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file = "plot1.png")
dev.off()
