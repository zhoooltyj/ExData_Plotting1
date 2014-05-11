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
hpc$Datetime<-paste(hpc$Date,hpc$Time)
hpc$Datetime<-strptime(hpc$Datetime, "%d/%m/%Y %H:%M:%S")

## Open png device and create the file
png(file="plot3.png", width = 480, height = 480, bg = "transparent")

## Create plot
Sys.setlocale(locale = "C") 
with(hpc, plot(Datetime, Sub_metering_1, type="l", ann=FALSE))
lines(x=hpc$Datetime,y=hpc$Sub_metering_2, col="red")
lines(x=hpc$Datetime,y=hpc$Sub_metering_3, col="blue")
legend("topright",
       lty=1,
       col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

title(ylab="Energy sub metering")

##Close the png file device
dev.off()
