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
newfile$Global_reactive_power<-as.numeric(as.character(newfile$Global_reactive_power))
newfile$Voltage<-as.numeric(as.character(newfile$Voltage))
newfile$Global_intensity<-as.numeric(as.character(newfile$Global_intensity))
newfile$Sub_metering_1<-as.numeric(as.character(newfile$Sub_metering_1))
newfile$Sub_metering_2<-as.numeric(as.character(newfile$Sub_metering_2))
newfile$Sub_metering_3<-as.numeric(as.character(newfile$Sub_metering_3))

plot4<-function(){
  par(mfrow=c(2,2))
  
  ##plot1##
  plot(newfile$timestamp,newfile$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  ##plot2##
  plot(newfile$timestamp,newfile$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  ##plot3##
  plot(x,y,type="n",ylab="Energy sub metering")
  lines(x,y,ylab="Energy sub metering",col="black")
  lines(x,y1,ylab="Energy sub metering",col="red")
  lines(x,y2,ylab="Energy sub metering",col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:2,cex=0.8)
  
  ##plot4##
  plot(newfile$timestamp,newfile$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  dev.copy(png,file="plot4.png",width=480,height=480)
  dev.off()
  cat("plot4.png has been saved in",getwd())
  }
plot4()
