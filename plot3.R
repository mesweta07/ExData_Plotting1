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
newfile$Sub_metering_1<-as.numeric(as.character(newfile$Sub_metering_1))
newfile$Sub_metering_2<-as.numeric(as.character(newfile$Sub_metering_2))
newfile$Sub_metering_3<-as.numeric(as.character(newfile$Sub_metering_3))
x<-newfile$timestamp
y<-newfile$Sub_metering_1
y1<-newfile$Sub_metering_2
y2<-newfile$Sub_metering_3
plot3<-function(){
  plot(x,y,type="n",xlab="",ylab="Energy sub metering")
  lines(x,y,col="black")
  lines(x,y1,col="red")
  lines(x,y2,col="blue")
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1:2,cex=0.8)
  dev.copy(png,file="plot3.png",width=480,height=480)
  dev.off()
  cat("plot3.png has been saved in",getwd())
  }
plot3()