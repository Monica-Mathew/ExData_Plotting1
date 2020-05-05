datatable<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(datatable)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- datatable[datatable$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
voltage <- as.numeric(subdata$Voltage)
globalActivePower <- as.numeric(subdata$Global_active_power)
globalReactivePower <- as.numeric(subdata$Global_reactive_power)
submeter1 <- as.numeric(subdata$Sub_metering_1)
submeter2 <- as.numeric(subdata$Sub_metering_2)
submeter3 <- as.numeric(subdata$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()#dev. off shuts down the specified (by default the current) device