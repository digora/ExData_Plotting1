#Plot 3 Script

#Set number formatting
options(scipen=8)

#Extract data and subset according to date parameters
rawpower <- data.table::fread("household_power_consumption.txt")
hhpower <- rawpower[rawpower$Date == "1/2/2007" | rawpower$Date == "2/2/2007"]

#Get correct time parameter for plot
timepower <- strptime(paste(hhpower$Date, hhpower$Time), "%d/%m/%Y %H:%M:%S")

#Create plot based on requirement
meterpower <- plot(timepower, as.numeric(hhpower$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering", main="")
with(hhpower, lines(timepower, as.numeric(hhpower$Sub_metering_2), col="red"))
with(hhpower, lines(timepower, as.numeric(hhpower$Sub_metering_3), col="blue"))

#Create legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, cex=0.75)

#Save plot to memory
dev.copy(png, file="plot3coursera.png")

#TUrn of graphics device to save memory
dev.off()

