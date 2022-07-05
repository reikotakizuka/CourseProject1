## preparation for the plotting
setwd("./")
library(dplyr)

## reading the data from the file
dfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dfile, "epconsump.zip", method="curl")
tdata <- read.table(unzip("epconsump.zip"),sep=";",header=T, na.string="?")

## getting the data that we should use
seq <- c("1/2/2007", "2/2/2007")
udata <- filter(tdata, tdata$Date %in% seq)

## making plot1
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
hist(as.numeric(udata$Global_active_power), main="Global Active Power", 
     xlab="Global Active Power(kilowatts)", col="red")

### saving the plot data to the png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()

