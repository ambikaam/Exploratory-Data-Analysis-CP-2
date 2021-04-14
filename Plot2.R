nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Open a new graphics device in png
png(filename = "plot2.png", width = 640, height = 480, units = "px")

# Subset the data for only the Baltimore City, Maryland
bcity <- subset(nei, fips == "24510")

# Plot the required graph
with(bcity, plot(unique(year),  tapply(Emissions, year, sum), 
                 type = "l", lwd = 2, 
                 xlab = "Year", ylab = expression("Total PM"[2.5]*" Emissions"), 
                 main = "Total Emissions in Baltimore City, Maryland from 1999 to 2008"))

# Close the graphic device
dev.off()