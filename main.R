#TTR has technical indicators
library(TTR)

# Use the data  provided by the package
data(ttrc)

# Tidy the data
library(tidyr)
library(dplyr)

# I will:
#   calculate some metrics.
#   check if rows are equal to originak object
#   put the results in a new object
#   I guess these functions coul be use with an apply
#   Inputs are sometimes different (OHLC, HL, HC, etc...)
# Average True Range
myTimeSeries <- ttrc %>% 
  select(Open,High,Low,Close)
ATR <- myTimeSeries %>% ATR(14) %>% as.data.frame() %>% select(atr)
NROW(ATR)

# Donchian Channel
myTimeSeries <- ttrc %>% 
  select(High,Low)
DonchianChannel <- myTimeSeries %>% DonchianChannel(80,include.lag = TRUE) %>% 
  as.data.frame()
NROW(DonchianChannel)

# ADX

myTimeSeries <- ttrc %>% 
  select(High,Low, Close)
ADX <- myTimeSeries %>% ADX() %>% 
  as.data.frame()
NROW(ADX)

# There are many more, but they all respond to these structure on input.

