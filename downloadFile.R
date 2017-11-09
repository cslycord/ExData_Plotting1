# VARIABLES
fileUrl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile="household_power_consumption.zip"
textFile="household_power_consumption.txt"

download = function(){
        # Download the file if it doesn't exist
        if(!file.exists(zipFile)){
                download.file(fileUrl,destfile = zipFile)
        }
        
        # Extract the zip if the text file doesn't exist
        if(!file.exists(textFile)){
                unzip(zipFile)
        }
}

readFile = function(){
        
        # The dates of 2007-02-01 and 2007-02-02 start on row 66637
        # And there are 2880 of them.
        # So, we skip the first 21997 rows and read 2880 rows
        skipRows=66637
        numRows=2880
        
        # Read the rows into a dataframe and change all "?" to NA
        data = read.table(textFile,skip=skipRows ,nrows=numRows,
                          sep=";",na.strings = "?",stringsAsFactors = FALSE)
        
        #Read the first row of the file since it has the category names
        dataNames = unlist(strsplit(readLines(textFile, n=1),split =";"))
        names(data) = dataNames
        
        # Add a column for date/time combined
        data$datetime <- strptime(paste(data$Date, data$Time),
                                  format = "%d/%m/%Y %H:%M:%S")
        data
}