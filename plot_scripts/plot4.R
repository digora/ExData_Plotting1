#Plot 4 Script

#Set number formatting
options(scipen=8)

#Extract data and subset according to date parameters
rawpower <- data.table::fread("household_power_consumption.txt")
hhpower <- rawpower[rawpower$Date == "1/2/2007" | rawpower$Date == "2/2/2007"]

#Get correct time parameter for plot
timepower <- strptime(paste(hhpower$Date, hhpower$Time), "%d/%m/%Y %H:%M:%S")

#We want to get 2 rows and 2 columns of charts
par(mfcol = c(2,2))
par(mar = c(4,4,1,1))

#Create the first plot based on requirement
linepower <- plot(timepower, as.numeric(hhpower$Global_active_power), type="l", xlab="", ylab="Global Active Power", main="")

#Create the second plot based on requirement
meterpower <- plot(timepower, as.numeric(hhpower$Sub_metering_1), type="l", xlab="", ylab="Energy sub metering", main="")
with(hhpower, lines(timepower, as.numeric(hhpower$Sub_metering_2), col="red"))
with(hhpower, lines(timepower, as.numeric(hhpower$Sub_metering_3), col="blue"))

#Create legend
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n",x.intersp=0.5, y.intersp = 0.5, xjust = 1)

#Create third plot based on requirement
voltpower <- plot(timepower, as.numeric(hhpower$Voltage), type="l", xlab="datetime", ylab="Voltage", main="")

#Create fourth plot based on requirement
reactivepower <- plot(timepower, as.numeric(hhpower$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power", main="")

#Save plot to memory
dev.copy(png, file="plot4coursera.png")

#TUrn of graphics device to save memory
dev.off()
