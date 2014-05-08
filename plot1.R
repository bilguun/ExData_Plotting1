#READING DATA
hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, nrow = 2880, sep = ";", 
                  col.names = colnames(read.table(
                  "household_power_consumption.txt",
                  nrow = 1, header = TRUE, sep=";")))

# Adding DateTime Column
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")

par(mfrow=c(1,1))

#HISTORGRAM
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#SAVING PLOT
dev.copy(png, "figure/plot1.png")
dev.off()