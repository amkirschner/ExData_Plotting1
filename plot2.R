library(data.table)
library(lubridate)
library(dplyr)
temp <- read.table("household_power_consumption.txt", header=TRUE, sep= ";", na.strings = c("?",""))
temp$Date<-dmy(temp$Date)
df<- temp[year(temp$Date)== 2007 & month(temp$Date)==2 & mday(temp$Date) <3,]
rm(temp)
df$datetime <- paste(df$Date,df$Time)
df$Time <- strptime(df$datetime, format = "%Y-%m-%d %H:%M:%S")
df<-tbl_df(df[,1:9])

png(filename="plot2.png",width=480,height=480,units="px")
with(df,plot(Time,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()