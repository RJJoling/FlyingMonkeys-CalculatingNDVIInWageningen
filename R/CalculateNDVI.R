# Team Name:               Team Members:               Date:
# Flying Monkeys           Robbert-Jan Joling          08-01-2015
#                          Damiano Luzzi

# Import packages
library(raster)

CalculateNDVI <- function(red.band, nir.band) {
# This function calculates NDVI values
#
# Args:
# red.band = input red band
# nir.band = input near infrared band
#
# Returns: NDVI values (of input class)

#Calculate NDVI
  NDVI <- (nir.band - red.band) / (nir.band + red.band)
  return(NDVI)
}