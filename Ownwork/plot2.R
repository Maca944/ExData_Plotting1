setwd("c:/maca/Rdata/ExData_Plotting1") ## set the working directory to where I extracted the .txt file

Sys.setlocale("LC_TIME", "C") # change timesettings to English, otherwise the names of the days appeared in Dutch

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
# generate a data frame. I searched for a way to pre-select the required dates but to no avail

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") # the Date column should be in the date format
hpc <- subset(hpc, Date == "2007-02-01" | Date =="2007-02-02") # select only the two desired dates
row.names(hpc) <- NULL # I don't want the row names
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power)) # this column should be numeric

hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename="plot2.png", width = 480, height = 480) # generate the .png file

plot(hpc$DateTime, hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)") # name the y-axis

dev.off() # write the plot to the file