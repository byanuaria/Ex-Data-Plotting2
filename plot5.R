# reading in data
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
new <- SCC[ind,]

# get vvector of related SCC
mySCCs <- new$SCC

# filter data from NEI table
my_df <- NEI %>%
  filter(SCC %in% mySCCs & fips == "24510") %>%
  group_by(year) %>%
  summarize(total_emi = sum(Emissions))

# create PNG file
png('plot5.png')

# plot
ggplot(my_df, aes(year, total_emi)) +
  geom_point(alpha = 0.7, size = 2) +
  geom_smooth() +
  labs(title = "Emissions from Motor Vehicles",
       x = "Year",
       y = "PM2.5 Emissions (in tons)",
       caption = "Source: PM2.5 Emissions Data") +
  theme_bw()


dev.off()
