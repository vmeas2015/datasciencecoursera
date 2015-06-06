mydata <- read.csv("household_power_consumption.txt", header = T, sep=";", na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

#Subsetting
Data <- subset(mydata,Date >= "2007-02-01" & Date <= "2007-02-02")
datetime <- paste(Data$Date, Data$Time)
Data$Time <- as.POSIXct(datetime)

#################PLOT1
#Creating hist plot
hist(Data$Global_active_power, main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#Saving files in png
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()
