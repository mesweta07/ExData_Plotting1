------------To download & unzip the data-----------------------------------------------------
  if(!file.exists("exdata-data-household_power_consumption.zip")) {
    temp <- tempfile()
    download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
    file <- unzip(temp)
    unlink(temp)
  }
new<-read.table("household_power_consumption.txt",header=T,sep=";")
new$Date<-as.Date(new$Date,"%d/%m/%Y")
newfile<-new[(new$Date=="2007-02-02") | (new$Date =="2007-02-01"),]
newfile$Global_active_power<-as.numeric(as.character(newfile$Global_active_power))
newfile <- transform(newfile, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
plot2<-function(){plot(newfile$timestamp,newfile$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
                  dev.copy(png,file="plot2.png",width=480,height=480)
                  dev.off()
                  cat("plot2.png has been saved in",getwd())
}
plot2()
