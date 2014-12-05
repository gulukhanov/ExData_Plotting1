# Create subset
setwd("D:/DS/Plotting/ExData_Plotting1")
#load data
filename<-"./data/household_power_consumption.txt"
ds<-read.table (filename, header=T, sep=";", na.strings="?")
#subset of dataset
ss<-ds[ds$Date==c("1/2/2007","2/2/2007"),]
#convert factors to Time and Date format
ss$Time <- strptime(paste(ss$Date, ss$Time), "%d/%m/%Y %H:%M:%S")
ss$Date <- as.Date(ss$Date, "%d/%m/%Y")

# Create plot4
png("plot4.png", width=400, height=400)

par(mfrow=c(2,2))
# 1
plot(ss$Time, ss$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")
# 2
plot(ss$Time, ss$Voltage, type="l", xlab="datetime", ylab="Voltage")
# 3
plot(ss$Time, ss$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(ss$Time, ss$Sub_metering_2, col="red")
lines(ss$Time, ss$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2, col=c("black", "red", "blue"), bty="n")
# 4
plot(ss$Time, ss$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()