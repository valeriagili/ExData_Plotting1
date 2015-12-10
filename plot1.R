## Download and unzip data
if(!file.exists("./data")){dir.create("./data")}
if(!file.exists("./data/household_power_consumption.txt")){
        fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(fileURL, destfile="./data/household_power_consumption.zip", method = "curl")
        unzip("./data/household_power_consumption.zip", exdir = "./data/")
}

## Load data into R
col_names <- read.table("./data/household_power_consumption.txt", sep = ";", 
                        nrows = 1, stringsAsFactors = FALSE)
hpc_data <- read.table("./data/household_power_consumption.txt", header = FALSE, 
                       stringsAsFactors = FALSE, col.names = col_names, sep = ";", 
                       na.strings = "?", skip = 66637, nrows = 2880)


## Open PNG device: create "plot1.png" of 480 pixels times 480 pixels (default values)
#  in working directory
png(filename = "plot1.png")

## Create histogram
hist(hpc_data$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

## Close the PNG file device
dev.off()