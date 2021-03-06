mydata <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

#Subsetting
Data <- subset(mydata,Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(Data$Date, Data$Time)
Data$Time <- as.POSIXct(datetime)

#####PLOT 4
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0)) 
plot(Data$Global_active_power~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(Data$Voltage~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(Data$Time, Data$Sub_metering_1,type="l",col="black",ylab ="Energy sub metering",xlab="")
lines(Data$Time, Data$Sub_metering_2,col="red")
lines(Data$Time, Data$Sub_metering_3,col="blue")
legend("topright",cex=0.7,bty = "n", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3")) 

plot(Data$Global_reactive_power~Data$Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()