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
png(filename = "plot3.png")

## Create histogram
with(hpc_data, plot(datetime, Sub_metering_1, type = "l",
                    xlab = "", ylab = "Energy sub metering"))
with(hpc_data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(hpc_data, points(datetime, Sub_metering_3, type = "l", col = "blue"))


## Add legend
legend("topright", lty = "solid", col = c("black", "red", "blue"),  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Close the PNG file device
dev.off()