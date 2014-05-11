par(mfrow = c(2, 2))
dataset <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2879)
colnames(dataset) <- colClasses <- c("Date", "Time", "Global_active_power", "Global_reactive_power","Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
DateTime <- strptime(paste(dataset[,"Date"], dataset[,"Time"]), "%d/%m/%Y %H:%M:%S")
dataset <- cbind(dataset,DateTime)

with(dataset,
  {
  plot(dataset[,"DateTime"], dataset[,"Global_active_power"], type = "l", ylab = "Global Active Power", xlab = "") 
  plot(dataset[,"DateTime"], dataset[,"Voltage"], type = "l", ylab = "Voltage", xlab = "datetime") 
  plot(dataset[,"DateTime"], dataset[,"Sub_metering_1"], type = "l", 
                   ylab = "Energy Sub Metering", xlab = "" )
    lines(dataset[,"DateTime"], dataset[,"Sub_metering_2"], col = "Red")
    lines(dataset[,"DateTime"], dataset[,"Sub_metering_3"], col = "Blue")
  plot(dataset[,"DateTime"], dataset[,"Global_reactive_power"], type = "l", ylab = "Global_reactive_power", xlab = "datetime") 
  }
)
dev.copy(png, file = "plot4.png")
dev.off()