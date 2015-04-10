## DATA SCIENCE - COURSERA - T DELALOY
## we will be using the "Individual household electric power consumption Data Set"
## first time
library(data.table) 


#define working directory
setwd("C:/Users/I051921/Desktop/Prediction (KXEN)/Coursera")

## Open File
file <- "EXPLORING/household_power_consumption.txt"
data <- fread(file) 

## transform data
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

## select data between 2 dates
data <- data[data$Date=="2007-02-01" | data$Date=="2007-02-02"] 


## Convert data to a data frame 
data <- data.frame(data) 

## Convert columns 3 to 9 to numeric 
for(i in c(3:9)) {
  class(data[,i])
  data[,i] <- as.numeric(as.character(data[,i]))
} 

## Create Date_Time variable 
data$DateTime <- paste(data$Date, data$Time) 

## Convert Date_Time variable to proper format 
data$DateTime <- strptime(data$DateTime, format="%Y-%m-%d %H:%M:%S") 

## create Plot 2

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white") 
plot(data$DateTime, data$Global_active_power, xaxt=NULL, xlab = "", ylab = "Global Active Power (kilowatts)", type="n") 
lines(data$DateTime, data$Global_active_power, type="S") 
dev.off() 

