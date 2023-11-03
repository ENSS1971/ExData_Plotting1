##Create a Time series

#Reading data
consumo <- read.table("./data/household_power_consumption.txt",
                      sep = ";", header = TRUE,
                      stringsAsFactors = FALSE)

#General dataset summary
summary(consumo)


#Visualizing the first five rows of the dataset
head(consumo)

#Subset the data from the dates 2007-02-01 and 2007-02-02.
subsetconsumo <- consumo[consumo$Date %in% c("1/2/2007", "2/2/2007"),]

head(subsetconsumo)
tail(subsetconsumo)

#Converting data from the Global_active_power column and
#storing it in the Global_Active_Power variable
Date <- as.Date(subsetconsumo$Date)
Global_Active_Power <- as.numeric(subsetconsumo$Global_active_power)

#Create a Time series plot2.png
datetime <- strptime(paste(subsetconsumo$Date, subsetconsumo$Time, sep = ""),
                     "%d/%m/%Y %H:%M:%S")
plot(datetime, Global_Active_Power, type = "l", xlab = "Global Active Power (Kilowatts)")

#Exporting the histogram
dev.copy(png, file = "./figure/plot1.png")
dev.off()