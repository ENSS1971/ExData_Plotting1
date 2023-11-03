##4th Plot: Grouping four different graphs

#Reading data
consumo <- read.table("./data/household_power_consumption.txt",
                      sep = ";", header = TRUE,
                      stringsAsFactors = FALSE)

#Subset the data from the dates 2007-02-01 and 2007-02-02.
subsetconsumo <- consumo[consumo$Date %in% c("1/2/2007", "2/2/2007"),]

#Visualizing the first five rows of the dataset
head(subsetconsumo)
tail(subsetconsumo)

#Create a plot for sub metering
datetime <- strptime(paste(subsetconsumo$Date, subsetconsumo$Time, sep = ""),
                     "%d/%m/%Y %H:%M:%S")

head(datetime)


##Objects
globalReactivePower <- as.numeric(subsetconsumo$Global_reactive_power)
voltage <- as.numeric(subsetconsumo$Voltage)
subMetering1 <- as.numeric(subsetconsumo$Sub_metering_1)
subMetering2 <- as.numeric(subsetconsumo$Sub_metering_2)
subMetering3 <- as.numeric(subsetconsumo$Sub_metering_3)

#Grouping four different graphs
par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 2, 0))

#First plot
plot(datetime, globalReactivePower, type = "l", xlab = "",
     ylab = "Global Active Power", cex = 0.2)

#Second plot
plot(datetime, voltage, type = "l", xlab = "Datetime", ylab = "Voltage")

#Third plot
plot(datetime, subMetering1, type = "l", ylab = "Energy Submetering", xlab="")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o", cex = 0.5)

#Fuorth plot
plot(datetime, globalReactivePower, type = "l",
     xlab = "Datetime", ylab = "Global_reactive_power", cex = 0.2)

#Exporting the plot
dev.copy(png, file = "./figure/plot4.png", height=480, width=480)
dev.off()