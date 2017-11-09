# VARIABLES
pngFile="plot1.png"

globalActivePowerHist = function(df){
        hist(df$Global_active_power,col="red",
             xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power")
}

plot1png = function(df){
        png(file= pngFile)
        par(mfrow=c(1,1))
        globalActivePowerHist(df)
        dev.off()
}

source("downloadFile.R")
download()
df = readFile()
plot1png(df)