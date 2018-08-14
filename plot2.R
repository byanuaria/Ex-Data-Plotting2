# reading in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load packages
library(tidyverse)

# create PNG file
png('plot2.png')

# filtering for Baltimore City, Maryland data
mdEmissions <- NEI %>%
  select(fips, Emissions, year) %>%       
  filter(fips == "24510") %>%
  group_by(year, fips) %>%
  summarize(totalEmi = sum(Emissions))

# plotting
ggplot(mdEmissions, aes(x = year, y = totalEmi)) +    
  geom_point(shape = 1, size = 3) +                               # adding points
  geom_smooth(mapping = aes(linetype = "MD"), color = "purple") + # adding line
  labs(title = "Total Emissions: Baltimore City, MD",             # labelling
       x = "Year", y = "Emissions") + 
  theme_bw()                                                      # specifying theme


dev.off()
