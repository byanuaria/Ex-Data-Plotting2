# loading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# loading packages 
library(tidyverse)
require(scales)

#convert type to factor class
NEI$type <- as.factor(NEI$type)

# selecting data I want
my_df <- NEI %>%
  select(Emissions, type, year) %>%
  group_by(year, type) %>%
  summarize(total_E = sum(Emissions))

# create PNG file
png('plot1.png')

# create line plot
l <- ggplot(my_df, aes(year, total_E)) +
  geom_point(aes(color = type), alpha = 0.7, size = 2) + # adds point
  geom_smooth(aes(color = type)) + # adds line
  scale_y_continuous(labels = comma) + # gets rid of default scientific notation
  labs(title = "Emissions Throughout The Years", y = "Total Emissions", x = "Year")

print(l)

dev.off()
