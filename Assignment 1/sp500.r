##########################################################################
# sp500.r
##########################################################################
# Load time series and stock data libraries
##########################################################################
# NOTE: Just run the install.packages ONCE! - although they should be
# prompted for installing the first time you refer to them.
############################################
#############################################
library(xts)
library(quantmod)
########################################################################
# Read the space delimited table from file sp500.tab and 
#  convert to a time series object. Note sp500.tab is a "zoo" series, so
#  the function knows about the column for date
########################################################################
sp500 <- as.xts(read.zoo("sp500.tab",header=T))

# Plot a candleChart for the last 3 months of the dataset
#############################################################
chartSeries(last(sp500,"3 months"), theme='white')
###########################################################################