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

# Create plot1 
png("plot1.png", width=480, height=480)
hist (ss$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()