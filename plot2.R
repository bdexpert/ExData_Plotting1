dataset <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2879)
colnames(dataset) <- colClasses <- c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
DateTime <- strptime(paste(dataset[,"Date"], dataset[,"Time"]), "%d/%m/%Y %H:%M:%S")
dataset <- cbind(dataset,DateTime)
with(dataset, 
{
  png(filename = "plot2.png",
      width = 480, height = 480, units = "px", pointsize = 12,
      bg = "white",  res = NA)
  plot(dataset[,"DateTime"], dataset[,"Global_active_power"], type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") 
  dev.off()
}
)