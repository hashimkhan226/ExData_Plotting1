library(lubridate)

#Read in only dates from 2007-02-01 to 2007-02-02
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", skip = 66636, nrows = 2880, na.strings = "?")

#Name the columns
names(df) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#Convert date column to character and then to Date class
df[,1] <- as.character(df[,1])
df[,2] <- as.character(df[,2])
df[,1] <- paste(df[,1], df[,2])
df <- df[,-2]
Date_Time <- strptime(df[,1], "%d/%m/%Y %H:%M:%S")
df <- cbind(Date_Time,df)
df <- df[,-2]

#Create plot of Energy sub metering 
plot(df[,1],df[,6], ylab = "Energy sub metering" ,xlab = "", type = "n")
#Sub metering 1 is black
lines(df[,1],df[,6], col = "black")
#Sub metering 1 is red
lines(df[,1],df[,7], col = "red")
#Sub metering 1 is blue
lines(df[,1],df[,8], col = "blue")
#Add a legend
legend(df$Date_Time[1500], 30, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black", "red", "blue"), lty = 1:3)
#Copy plot to png file
dev.copy(png, file = "plot3.png")
#Turn off graphics device
dev.off()
