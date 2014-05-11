## Download and unzip the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
setInternet2(TRUE)
download.file(url, destfile="energy.zip")

## Read the data from the dates 2007-02-01 and 2007-02-02
cnames <- colnames(read.table("household_power_consumption.txt",
                              nrow = 10, 
                              header = TRUE, 
                              sep=";"))

hpc <- read.table("household_power_consumption.txt",
                  skip = 66637, 
                  nrows = 2880, 
                  sep = ";", 
                  col.names = cnames)

## Set correct date class
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Open png device and create the file
png(file="plot1.png", width = 480, height = 480)

## Create histogram
hist(hpc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     col="red", 
     main = "Global Active Power")

##Close the png file device
dev.off()