# VARIABLES
pngFile="plot4.png"

plot4_1 = function(df){
        with(df,plot(datetime,Global_active_power,type="l",
                     xlab="",ylab = "Global Active Power"))
}

plot4_2 = function(df){
        with(df,plot(datetime,Voltage,type="l",xlab="datetime",
                     ylab = "Voltage"))
}

plot4_3 = function(df){
        with(df,plot(datetime,Sub_metering_1,type="l",xlab="",
                     ylab = "Energy sub metering"))
        with(df,points(datetime,Sub_metering_2,type="l",col="red"))
        with(df,points(datetime,Sub_metering_3,type="l",col="blue"))
        legend("topright", lty=1, col = c("black","blue", "red"),
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

plot4_4 = function(df){
        with(df,plot(datetime,Global_reactive_power,type="l",xlab="datetime",
                     ylab = "Global_reactive_power"))
}

plot4png = function(df){
        png(file= pngFile,width = 480,height = 480)
        par(mfrow = c(2, 2))
        plot4_1(df)
        plot4_2(df)
        plot4_3(df)
        plot4_4(df)
        dev.off()
}

source("downloadFile.R")
download()
df = readFile()
plot4png(df)