# Of the four types of sources indicated by the type variable, which of these four
# sources have seen decreases in emissions from 1999-2008 for Baltimore City?

# read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load packages
library(tidyverse)

# convert as factor
NEI$type <- as.factor(NEI$type)

# filter data
MD_emissions2 <- NEI %>%
  select(fips, Emissions, year, type) %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarize(total = sum(Emissions))

# create PNG file
png('plot3.png')

# plot
ggplot(MD_emissions2, aes(year, total, color = type)) +
  geom_point(size = 2, alpha = 0.5) +
  geom_smooth() +
  labs(title = "Emissions by Source: 1999 - 2008", 
       x = "Year", y = "Emissions (by tons)") +
  theme_bw()

dev.off()

