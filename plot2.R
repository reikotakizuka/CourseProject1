## preparation for the plotting
setwd("./")
library(dplyr)

## reading the data from the file
dfile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dfile, "epconsump.zip", method="curl")
tdata <- read.table(unzip("epconsump.zip"),sep=";",header=T, na.string="?")

## getting the data that we would use
seq <- c("1/2/2007", "2/2/2007")
udata <- filter(tdata, tdata$Date %in% seq)
udata$Date <- factor(
        as.POSIXct(paste(strptime(udata$Date, format="%d/%m/%Y", tz=""), 
                         udata$Time, sep=" ")))
n <- nrow(udata)

## making plot2
par(mfrow=c(1,1), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(udata, plot(as.integer(Date), Global_active_power, type="l",
              ylab="Global Active Power(kilowatts)", xlab="", xaxt="n"))
axis(side=1, at=seq(0, n, by=n*0.5), labels = c("Thu","Fri","Sat"))

### saving the plot data to the png file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()