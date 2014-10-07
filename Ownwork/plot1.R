setwd("c:/maca/Rdata/ExData_Plotting1") ## set the working directory to where I extracted the .txt file

hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?") 
# generate a data frame. I searched for a way to pre-select the required dates but to no avail

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") # the Date column should be in the date format
hpc <- subset(hpc, Date == "2007-02-01" | Date =="2007-02-02") # select only the two desired dates
row.names(hpc) <- NULL # I don't want the row names
hpc$Global_active_power <- as.numeric(as.character(hpc$Global_active_power)) # this column should be numeric

png(filename="plot1.png", width = 480, height = 480) # generate the .png file

hist(hpc$Global_active_power, # and generate the histogram
     main = "Global Active Power", # set the main title
     xlab = "Global Active Power (kilowatts)", # name the x-axis
     ylab = "Frequency", # name the y-axis
     col = "red", # the columns should be red
     breaks = 12, # we want 12 bins
     ylim = c(0, 1200)) #, #the y-axis should range from 0 to 1200 
     #axes = TRUE)

dev.off() # write the plot to the file
