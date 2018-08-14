# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999-2008?

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load packages
library(tidyverse)

# convert to proper classes
SCC$SCC <- as.character(SCC$SCC)
NEI$year <- as.character(NEI$year)
NEI$type <- as.factor(NEI$type)

# use regex to index observations related to coal combustion
ind <- grep(pattern = "Coal", x = SCC$EI.Sector)
new <- SCC[ind,]

# get vector of related Source Classification Code (SCC)
mySCCs <- new$SCC

# filter data from NEI table
myDF <- NEI %>%
  select(SCC, type, year, Emissions) %>%
  filter(SCC %in% mySCCs)

# create PNG file
png('plot4.png')

# plot
ggplot(myDF, aes(year, Emissions)) +
  geom_jitter(aes(color = type), alpha = .6) +
  labs(title = "Emissions from Coal Combustion Sources",
       x = "Year", y = "Emissions") +
  theme_minimal()

dev.off()
