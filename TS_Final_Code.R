library(readr)
library(tidyverse)
library(fpp2)
library(forecast)
library(xlsx)
library(rdatamarket)
library(tseries)

# Dataset available at:::
#https://www.ncdc.noaa.gov/societal-impacts/wildfires/ytd/2/data.csv

getwd()
setwd("C:/Users/Alexl/Documents/JWU")

US_fires <- read.csv("USFires.csv", header = TRUE)
US_fires <- as.data.frame(US_fires) # Convert to a Dataframe
View(US_fires)

Disasters <- read.csv("time_series_US_1980_2020.csv", header = TRUE)
View(Disasters)

FireTS <- ts(US_fires)
FireTS %>%
  class()
autoplot(FireTS, facets = TRUE) # Facets true to view all varibles on their own plots
autoplot(diff(FireTS))          # review the differences with variables stacked on each other
# Need to create a univariate Time series
# Most Variance is in Acres Burned
# Create time seris with acres burned and run the rest of the data on the dataset.

ndiffs(FireTS) # ndiffs function shows that the data need 1 differencing.

# convert to univariate time series data for ARIMA
# Acres.Burned will be used
names(US_fires)
Acres_Pre <- US_fires %>% 
  select(-"Number.of.Fires" ,
         -"Acres.Burned.per.Fire")
Acres_TS <- ts(Acres_Pre$Acres.Burned, 
               frequency = 1, 
               start = c(2000,1))

class(Acres_TS)
glimpse(Acres_TS)

Acres_ARIMA <- Arima(Acres_TS, 
                     order = c(0, 1, 0))
checkresiduals(Acres_ARIMA)
# largespike at the first lag, 4th lag is close
# data is not entirely normally distributed

# adjust (p ,d , q) in Arima function
Acres_ARIMA <- Arima(Acres_TS, 
                     order = c(1, 2, 1))
checkresiduals(Acres_ARIMA)

# plot forecast based on the model above
fc_Acres_TS_arima.1.2.1 <- forecast(
  Arima(Acres_TS, 
        order = c(1, 2, 1)),
  h = 10)
autoplot(fc_Acres_TS_arima.1.2.1)

# compare with first model we looked at
fc_Acres_TS_arima.0.1.0 <- forecast(
  Arima(Acres_TS, 
        order =  c(0, 1, 0)),
  h = 10)
autoplot(fc_Acres_TS_arima.0.1.0)

# check/compare with Auto.Arima Function
names(Acres_ARIMA)
fit <- auto.arima(FireTS[, "Acres.Burned" ])
checkresiduals(fit)

fcast <- forecast(fit)
autoplot(fcast) + ylab("Auto.Arima Forcast")


