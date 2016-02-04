packages=c("data.table","plyr","dplyr","sqldf","lubridate")
sapply(packages, require, character.only=TRUE, quietly=TRUE)

## Our overall goal here is simply to examine how household energy usage varies over 
##a 2-day period in February, 2007. Your task is to reconstruct the following 
##plots below, all of which were constructed using the base plotting system.
##First you will need to fork and clone the following GitHub repository: 
##https://github.com/rdpeng/ExData_Plotting1
##For each plot you should
##Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
##Name each of the plot files as plot1.png, plot2.png, etc.
##Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
##Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

setwd("C://Users/Mark/Desktop/datascience/Exploratory Data/Week1")        
## first load the data
temp<-"exdata-data-household_power_consumption.zip"

##load the  data into data tables
temp.data<- read.table("household_power_consumption.txt",sep=";",na.strings="?",header=TRUE)
temp.data$Date<-dmy(temp.data$Date)
temp.data$Date<-as.Date(temp.data$Date)
GAP.data <- filter(temp.data, Date == "2007-02-01"| Date == "2007-02-02")
hist(GAP.data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red",
     xlim=c(0,6),ylim=c(0,1200))
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
dev.off()