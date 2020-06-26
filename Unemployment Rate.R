#Step 1:  Loading the required library
library(ggplot2)
library(fpp2)
library(forecast)
library(corrplot)
library(ggcorrplot)

#Step 2: Loading the csv file into R environment

Rawdata = read.csv("Unemployment Rate.csv", header= TRUE)

#Step 3: Converting dataframe into ts() object

Rate <- data[,"URate"] # This creates Rate vector from Rawdata dataframe
tsRate = ts(Rate,start=2000, frequency = 12) # This convert Rate vector to ts() object 
class(tsRate) 	# tsRate is of class "ts"
str(tsRate)	# to see the structure of the tsRate
>> Time-Series [1:245] from 2000 to 2020: 1.6 1.6 1.7 1.2 1 1.6 2.3 2.2 2.1 1.6..


#Step 4: Creating Time Plot

autoplot(tsRate) +
  xlab("Time") + ylab("Unemployment Rate") +
  ggtitle("Unemployment Rate - College Graduates - Master's Degree, 25 years and over")



#Step 5: Creating Seasonal Plot
ggseasonplot(tsRate, col=rainbow(21),year.labels = TRUE,year.labels.left = TRUE) +
  ylab("Rate of Unemployment") +
  ggtitle("Seasonal Plot : Unemployment Rate - College Graduates - Master's   Degree, 25 years and over")

#For creating Polar Seasonal Plot

ggseasonplot(tsRate, col=rainbow(21),polar= TRUE) +
  ylab("Rate of Unemployment") +
  ggtitle("Polar seasonal plot: Unemployment Rate - College Graduates - Master's Degree, 25 years and over")

# For creating sub series plot
ggsubseriesplot(tsRate) +
  ylab("Rate of Unemployment") +
  ggtitle("Unemployment Rate - College Graduates - Master's Degree, 25 years and over")

#Step 6:  Creating Lag Plot & checking White Noice

window <- ts(tsRate,start=2008)
gglagplot(window)
ggAcf(window)

