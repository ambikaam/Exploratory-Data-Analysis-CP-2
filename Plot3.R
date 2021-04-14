library(ggplot2)

# Read the data from the working directory
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Open a new graphics device in png
png(filename = "plot3.png", width = 640, height = 480, units = "px")

# Subset the data for only the Baltimore City, Maryland
bcity  <- subset(nei, fips=="24510")

# Aggregate the subset data according to year and type and calculate their total sum
bcityTotalAggregated <- aggregate(Emissions ~ year + type, bcity, sum)




g <- ggplot(bcityTotalAggregated, aes(year, Emissions, color = type))
g <- g + geom_line(lwd = 1) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland from 1999 to 2008')
print(g)
# Close the graphic device
dev.off()