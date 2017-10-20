##To download & unzip the data##
if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file <- unzip(temp)
    unlink(temp)
  }
##This helps in plotting a histogram for Global Active Power##
new<-read.table("household_power_consumption.txt",header=T,sep=";")
new$Date<-as.Date(new$Date,"%d/%m/%Y")
newfile<-new[(new$Date=="2007-02-02") | (new$Date =="2007-02-01"),]
newfile$Global_active_power<-as.numeric(as.character(newfile$Global_active_power))
hist(newfile$Global_active_power,main="Global Active Power",xlab="Gobal Active Power (kilowatts)",col="Red")
plot1<-function(){hist(newfile$Global_active_power,main="Global Active Power",xlab="Gobal Active Power (kilowatts)",col="Red")
                  dev.copy(png,file="plot1.png",width=480,height=480)
                  dev.off()
                  cat("plot1.png has been saved in",getwd())
}
plot1()