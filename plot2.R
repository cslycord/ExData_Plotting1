# VARIABLES
pngFile="plot2.png"

plot2 = function(df){
        with(df,plot(datetime,Global_active_power,type="l",xlab="",
                     ylab = "Global Active Power (kilowatts)"))
}

plot2png = function(df){
        png(file= pngFile)
        par(mfrow=c(1,1))
        plot2(df)
        dev.off()
}

source("downloadFile.R")
download()
df = readFile()
plot2png(df)