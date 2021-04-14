library(ggplot2)

# Read the data from the working directory
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

# Merge the two datasets
neiscc <- merge(nei, scc, by = "SCC")
neiscc <- transform(neiscc, year = factor(year))

# Fetch all NEIxSCC records with Short.Name (SCC) = Coal
coal  <- grepl("coal", neiscc$Short.Name, ignore.case=TRUE)
neiSccCoal <- neiscc[coal, ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, neiSccCoal, sum)

# Open a new graphics device in png
png("plot4.png", width=640, height=480)

# Plot the required graph
g <- ggplot(aggregatedTotalByYear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", width = 0.5) +
  xlab("year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()