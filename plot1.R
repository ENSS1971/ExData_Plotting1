##Created a histogram plot1

#Reading data
consumo <- read.table("./data/household_power_consumption.txt",
                      sep = ";", header = TRUE,
                      stringsAsFactors = FALSE)

#General dataset summary
summary(consumo)

#Subset the data from the dates 2007-02-01 and 2007-02-02.
subsetconsumo <- consumo[consumo$Date %in% c("1/2/2007", "2/2/2007"),]

#Visualizing the first five rows of the dataset
head(subsetconsumo)
tail(subsetconsumo)

#Converting data from the Global_active_power column and
#storing it in the Global_Active_Power variable
Date <- as.Date(subsetconsumo$Date)
Global_Active_Power <- as.numeric(subsetconsumo$Global_active_power)

#Created a histogram plot1.png
hist(Global_Active_Power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#Exporting the histogram
dev.copy(png, file = "./figure/plot1.png", height=480, width=480)
dev.off()


