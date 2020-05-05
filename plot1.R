datatable<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
names(datatable)<- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- datatable[datatable$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subdata$Global_active_power)
png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off() #dev. off shuts down the specified (by default the current) device