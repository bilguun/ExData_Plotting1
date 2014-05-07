hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                  nrow = 1, header = TRUE, sep=";")))

hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
#1
par(mfrow=c(1,1))

hist(hpc$Global_active_power, data=hpc, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, "plot1.png")
dev.off()
#2
with(hpc, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
     )
dev.copy(png, "plot2.png")
dev.off()

#3
with(hpc,  plot(c(DateTime, DateTime, DateTime),c(Sub_metering_1,Sub_metering_2,Sub_metering_3), type="l", xlab="", ylab="Energy sub metering"))
with(hpc, points(DateTime, Sub_metering_2, col="red", type="l"))
with(hpc, points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "plot3.png")
dev.off()

#4
par(mfrow=c(2,2))
with(hpc, {
   plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
   plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
   plot(c(DateTime, DateTime, DateTime),c(Sub_metering_1,Sub_metering_2,Sub_metering_3), type="l", xlab="", ylab="Energy sub metering")
   with(hpc, points(DateTime, Sub_metering_3, col="blue", type="l"))
   with(hpc, points(DateTime, Sub_metering_2, col="red", type="l"))
   legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   plot(DateTime, Global_reactive_power, type="l", xlab="datetime")
   })

dev.copy(png, "plot4.png")
dev.off()