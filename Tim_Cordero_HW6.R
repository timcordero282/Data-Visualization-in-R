###############################################
# Course: IST 687
# Assignment: HW 6
# Name: Tim Cordero
# Date: 08/17/2021
# Notes: Rev 1.0
###############################################
# Libraries

#install.packages("ggplot2")
#library(ggplot2)
#install.packages("reshape2")
#library(reshape2)

# Data

# Step 1
# read dataset in
airQ <- airquality

###############################################

# Step 2
# remove N/A's
View(airQ)
airQ_no_NA <- na.omit(airQ)
length(airQ_no_NA$Ozone)
View(airQ_no_NA)

# Step 3
#historgrams for each variabel
# showing using ggplot method and plain R hist function

#Ozone
ggplot(airQ_no_NA, aes(x=Ozone)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Ozone)

#Solar.R
ggplot(airQ_no_NA, aes(x=Solar.R)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Solar.R)

# Wind
ggplot(airQ_no_NA, aes(x=Wind)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Wind)

# Temp
ggplot(airQ_no_NA, aes(x=Temp)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Temp)

# Month
ggplot(airQ_no_NA, aes(x=Month)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Month)

# Day
ggplot(airQ_no_NA, aes(x=Day)) + geom_histogram(bins=6, color="black", fill="white")
hist(airQ_no_NA$Day)


# Boxplot for Ozone
ggplot(airQ_no_NA, aes(x=factor(0),y=Ozone)) + geom_boxplot()

# Boxplot for Wind, round wind
ggplot(airQ_no_NA, aes(x=factor(0),y=round(Wind, digits=0))) + geom_boxplot()

# Step 3 Part 2
# how data changes over time
airQ_no_NA$Date <- paste0("1973","-", airQ_no_NA$Month, "-", airQ_no_NA$Day)
airQ_no_NA$Date <- as.Date(airQ_no_NA$Date)

#Ozone
ggplot(airQ_no_NA, aes(x=Date, y=Ozone, group=1)) + geom_line() + theme(axis.text.x=element_text(angle=90))

#Temp
ggplot(airQ_no_NA, aes(x=Date, y=Temp, group=1)) + geom_line() + theme(axis.text.x=element_text(angle=90))

#Wind
ggplot(airQ_no_NA, aes(x=Date, y=Wind, group=1)) + geom_line() + theme(axis.text.x=element_text(angle=90))

#Solar.R
ggplot(airQ_no_NA, aes(x=Date, y=Solar.R, group=1)) + geom_line() + theme(axis.text.x=element_text(angle=90))


# combine all 4 into one line chart with 4 lines
lines4 <- melt(data=airQ_no_NA, id.vars="Date", measure.vars=c("Ozone","Temp", "Wind", "Solar.R"))
ggplot(lines4, aes(x=Date, y=value, group=variable, color=variable)) + geom_line() + theme(axis.text.x=element_text(angle=90))


# Step 4
#heatmap

# 4 vairbale for heatmap using melt function
airQ_no_NA$Ozone <- as.numeric(airQ_no_NA$Ozone)
airQ_no_NA$Temp <- as.numeric(airQ_no_NA$Temp)
airQ_no_NA$Wind <- as.numeric(airQ_no_NA$Wind)
airQ_no_NA$Solar.R <- as.numeric(airQ_no_NA$Solar.R)

heat4 <- melt(data= airQ_no_NA, id.vars="Day", measure.vars = c("Ozone", "Temp", "Wind", "Solar.R"))

ggplot(heat4,aes(x=Day,y=variable, fill=value)) + geom_tile() 


# Step 5
# scatter chart
ggplot(airQ_no_NA, aes(x=Wind, y=Temp)) + geom_point(aes(size=Ozone, color=Solar.R))

# Step 6
# Final analysis

#Do	you	see	any	patterns	after	exploring	the	data?		
  # I do see some patterns which I would expect to see, such as the
  # summer months having a higher temperature which can been seen in 
  # the temp line chart. 
  # Another pattern I saw in the scatter plot is that as the 
  # temperature rises the less wind there is and there is also 
  # greater amount for the Ozone value. 
  # The third pattern I found in the 4 line chart
  # was that as the Solar.R values rise, the Ozone
  # generally rises as well. Their lines are very similar in 
  # movement within the chart. 

#What	was	the	most useful	visualization
  # The most "useful" visualization really depends on
  # what we want know about our data. However,
  # if I were to say one chart gave me the most insight 
  # and information, I would say the scatter plot.
  # This is because it accounted for all 4 variables
  # we were digging into. The Temp and Wind were 
  # on the axis' and the Ozone and Solar.R
  # were measured in size and color respectively. 

