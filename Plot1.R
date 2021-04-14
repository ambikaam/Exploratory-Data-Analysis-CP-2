nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Open a new graphics device in png
png(filename = "plot1.png", width = 640, height = 480, units = "px")

# Plot the required graph
with(nei, plot(unique(year),  tapply(Emissions, year, sum), 
               type = "l", lwd = 2, 
               xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions"), 
               main = "Total Emissions from 1998 to 2008"))

# Close the graphic device
dev.off()