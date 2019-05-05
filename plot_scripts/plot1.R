#Plot 1 Script

#Set number formatting
options(scipen=8)

#Extract data and subset according to date parameters
rawpower <- data.table::fread("household_power_consumption.txt")
hhpower <- rawpower[rawpower$Date == "1/2/2007" | rawpower$Date == "2/2/2007"]

#Create plot based on requirements
powerhist <- hist(as.numeric(hhpower$Global_active_power), main="Global Active Power", col="red", xlab = "Global Active Power (Kilowatts)")

#Save plot to memory
dev.copy(png, file="plot1coursera.png")

#Turn off graphic device to save memory
dev.off()


