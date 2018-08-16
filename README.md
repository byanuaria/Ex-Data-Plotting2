# Exploratory Data Analysis
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008.

***
*1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?*
### Plot 1      
![plot of Plot1](/images/plot1.png)

Based on plot 1, it appears that there is in fact, a decrease in total PM2.5 emissions in the United States from 1999 to 2008.
+ The most obvious decrease is the **non-point** source of emissions. As the years pass, there is a significant decrease in total emissions from over 5 million in 1999, to 2.5 million in 2008.
+ The **point** source follows a sharp decrease from 1999 to 2002, then increases slightly the following few years, eventually petering off in 2005.
+ The **non-road** point shows a slow, but steady decrease from 1999 to 2008.
+ The **on-road** point shows a nearly linear decreasing pattern, albeit very minimal.

___
*2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland from 1999 to 2008?* 
### Plot 2
![plot of Plot2](/images/plot2.png)

+ In 1999, there was over 3,200 tons of PM2.5 being emitted, sharply decreasing to around 2,500 tons in 2002, and increases again back to 3,100 tons in 2005. This increase significantly decreases in 2008, down to an all-time low of around 1,800 tons.


___
*3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?*
### Plot 3
![plot of Plot3](/images/plot3.png)

Of the four types of sources, three have seen decreases and one has seen an increase. 
+ **Non-point** emissions went from ~2,100 tons in 1999 to ~1,350 in 2008, a decrease of 36%.
+ **Non-road** emissions went from 520 tons in 1999 to 55 tons in 2008, a decrease of nearly 90%.
+ Similarly, **on-road** emissions decreased by ~75%.
+ Emissions from **points** is the only source that has seen an increase - about 16%.

___
*4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?*
### Plot 4
![plot of Plot4](/images/plot4.png)

Across all counties in the United States, emissions from coal combustion-related sources went from 572,126 tons in 1999 to 343,342 tons in 2008, just around a 40% decrease. The jitter plot shows that most of the PM2.5 being emitted is from **point** sources, totalling at 1,864,866 tons. On the other hand, emissions from **non-point** sources total only 150,362.

___
*5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?*
### Plot 5
![plot of Plot5](/images/plot5.png)

Emissions from motor vehicle in Baltimore City have seen a significant decline from 1999 to 2008, about a 75% decrease. As someone with no knowledge about emissions or particulate matter, the decrease may be a result of multiple factors. For one, the county of Baltimore City may have implemented some sort of laws that regulate how much PM2.5 is emitted from motor vehicles. Notably from 1999 to 2002, there is a steep decrease, so it owuld be interesting to do more research on what has caused this. 

___
*6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California. Which city has seen greater changes over time in motor vehicle emissions?*
### Plot 6
![plot of Plot6](/images/plot6.png)

Baltimore City has seen a greater decrease in emissions from motor vehicles than Los Angeles County. Los Angeles County actually follows an increasing trend, from ~3,900 tons in 1999, ending at ~4,100 in 2008. I suspect the major differences in PM2.5 emissions between the two counties is due to population. Although Baltimore is a major city, their population is around 600,000. On the other hand, Los Angeles has a population of over 3 million. Generally speaking (and I am only assuming), more people means more vehicles. More vehicles, in turn, will result in more PM2.5 being emitted from motor vehicles.


