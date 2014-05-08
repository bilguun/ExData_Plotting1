# READ DATA
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                    "household_power_consumption.txt",
                    nrow = 1, header = TRUE, sep=";")))

# Adding DateTime Column
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

#CREATING PLOT
with(hpc,  plot(c(DateTime, DateTime, DateTime),c(Sub_metering_1,Sub_metering_2,Sub_metering_3), type="l", xlab="", ylab="Energy sub metering"))
with(hpc, points(DateTime, Sub_metering_2, col="red", type="l"))
with(hpc, points(DateTime, Sub_metering_3, col="blue", type="l"))
legend("topright", pch="-", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#SAVING PLOT
dev.copy(png, "figure/plot3.png")
dev.off()