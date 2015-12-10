## Download and unzip data
if(!file.exists("./data")){dir.create("./data")}
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile="./data/household_power_consumption.zip", method = "curl")
unzip("./data/household_power_consumption.zip", exdir = "./data/")
        
## Load data into R
col_names <- read.table("./data/household_power_consumption.txt", sep = ";", 
                        nrows = 1, stringsAsFactors = FALSE)
hpc_data <- read.table("./data/household_power_consumption.txt", header = FALSE, 
                       stringsAsFactors = FALSE, col.names = col_names, sep = ";", 
                       na.strings = "?", skip = 66637, nrows = 2880)

## Convert dates and times to Date objects
hpc_data$datetime <- strptime(paste(hpc_data$Date,hpc_data$Time), format = "%d/%m/%Y %H:%M:%S")

## Open PNG device: create "plot3.png" of 480 pixels times 480 pixels (default values)
#  in working directory
png(filename = "plot2.png")

## Create histogram
with(hpc_data, plot(datetime, Global_active_power, type = "l", 
                    xlab = "", ylab = "Global Active Power (kilowatts)"))

## Close the PNG file device
dev.off()