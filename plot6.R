# read in data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load packages
library(tidyverse)

# convert to proper class
SCC$SCC <- as.character(SCC$SCC)
SCC$EI.Sector <- as.character(SCC$EI.Sector)
NEI$type <- as.factor(NEI$type)

# use regex to index observations related to motor vehicle sources
ind <- grep(pattern = "Vehicle", x = SCC$EI.Sector)
newSCC <- SCC[ind,]

# get vector of related SCC's
vSCC <- newSCC$SCC

# filter data for emissions from motor vehicle sources in 
# Baltimore City, MD and Los Angeles County, CA
my_df <- NEI %>%
  filter(SCC %in% vSCC & (fips == "24510" | fips == "06037")) %>%
  mutate(county = if_else(fips == "24510", "Baltimore City", "Los Angeles")) %>%
  group_by(year, county) %>%
  summarize(total = sum(Emissions))

# create PNG file
png('plot6.png')

# plot
ggplot(my_df, aes(year, total)) +
  geom_point(shape = 20, size = 3, alpha = 0.5) + 
  geom_smooth(aes(color = county)) + 
  theme_bw() +
  labs(title = "Emissions from Motor Vehicles",
       subtitle = "Baltimore City vs Los Angeles",
       x = "Year", y = "PM2.5 Emissions (by tons)")

dev.off()