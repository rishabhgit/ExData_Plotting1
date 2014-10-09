plot1 <- function() {
    
    
    febreading <- powerGraph()
    png(filename="plot1.png", width=480, height=480)
    hist(febreading$Global_active_power, col="red", main="Global Active Power",
         xlab="Global Active Power (kilowatts)")
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