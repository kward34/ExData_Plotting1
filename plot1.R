setwd("~/Documents/Documents/Important Files/Hopkins/Data Science/Exploratory Data Analysis")


dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "electric_power_consumption.zip")
unzip("electric_power_consumption.zip", exdir = "electric_power_consumption")
setwd("~/Documents/Documents/Important Files/Hopkins/Data Science/Exploratory Data Analysis/electric_power_consumption")

#Reading, naming and subsetting power consumption data

power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")

# Save file
attach(power)
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(power)