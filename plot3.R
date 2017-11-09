# VARIABLES
pngFile="plot3.png"

plot3 = function(df){
        with(df,plot(datetime,Sub_metering_1,type="l",xlab="",
                     ylab = "Energy sub metering"))
        with(df,points(datetime,Sub_metering_2,type="l",col="red"))
        with(df,points(datetime,Sub_metering_3,type="l",col="blue"))
        legend("topright", lty=1, col = c("black","blue", "red"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

plot3png = function(df){
        png(file= pngFile,width = 480,height = 480)
        par(mfrow=c(1,1))
        plot3(df)
        dev.off()
}

source("downloadFile.R")
download()
df = readFile()
plot3png(df)