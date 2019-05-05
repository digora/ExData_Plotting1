#Plot 2 Script

#Set number formatting
options(scipen=8)

#Extract data and subset according to date parameters
rawpower <- data.table::fread("household_power_consumption.txt")
hhpower <- rawpower[rawpower$Date == "1/2/2007" | rawpower$Date == "2/2/2007"]

#Get correct time parameter for plot
timepower <- strptime(paste(hhpower$Date, hhpower$Time), "%d/%m/%Y %H:%M:%S")

#Create plot based on requirement
linepower <- plot(timepower, as.numeric(hhpower$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")

#Save plot to memory
dev.copy(png, file="plot2coursera.png")

#TUrn of graphics device to save memory
dev.off()
