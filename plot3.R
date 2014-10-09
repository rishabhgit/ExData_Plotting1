plot3 <- function() {
    
    
    febreading <- powerGraph()
    png(filename="plot3.png", width=480, height=480)
    with (febreading, {
        plot(Time, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
        par(new=TRUE)
        plot(Time, Sub_metering_2, type="l", col="red", ylim=c(0,30), yaxt='n', ann=FALSE)
        par(new=TRUE)
        plot(Time, Sub_metering_3, type="l", col="blue", ylim=c(0,30), yaxt='n', ann=FALSE)
    })
    legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lwd=1, col=c("black","red", "blue"))
    
    dev.off()
    
    
    
}

powerGraph <- function(){
    
    powreading <- read.table("household_power_consumption.txt", sep=";",
                             header=TRUE, stringsAsFactors=FALSE, na.strings="?")
    
    powreading$Time <- strptime(paste(powreading$Date, powreading$Time),
                                format="%d/%m/%Y%H:%M:%S")
    powreading$Date <- as.Date(powreading$Date, format="%d/%m/%Y")
    febreading <- powreading[powreading$Date >= "2007-02-01" & 
                                 powreading$Date <= "2007-02-02", ]
    return(febreading) 
    
    
}










