#Set of electrical energy consumption datasets for individual homes

library(zip)

#Checking for and creating directories
if(!file.exists("./data")){dir.create("./data")}

#Getting data from the internet download.file()
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- paste("./data",basename(url), sep = "/")
download.file(url = url,
              destfile = destfile,
              mode = "wb")

#Unzipping the file
unzip(zipfile = "./data/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      exdir = "./data", 
      overwrite = T)

#checking the size of a file before loading it into R
file.size("./data/household_power_consumption.txt")

#Reading data
data_full <- read.table("./data/household_power_consumption.txt",
                      sep = ";", header = TRUE,
                      stringsAsFactors = FALSE)

#General dataset summary
summary(data_full)


#Visualizing the first five rows of the dataset
head(data_full)



