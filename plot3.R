##Create a plot for sub metering

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

#Objects
subMetering1 <- as.numeric(subsetconsumo$Sub_metering_1)
subMetering2 <- as.numeric(subsetconsumo$Sub_metering_2)
subMetering3 <- as.numeric(subsetconsumo$Sub_metering_3)

#Generate the plot

plot(datetime, subMetering1, type = "l", ylab = "Energy Submetring", xlab = "")
lines(datetime, subMetering2,type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                     lty = 1,
                     lwd = 2.5,
                     col = c("black", "red", "blue"))


#Exporting the plot
dev.copy(png, file = "./figure/plot3.png", height=480, width=480)
dev.off()