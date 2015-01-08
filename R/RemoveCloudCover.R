# Team Name:               Team Members:               Date:
# Flying Monkeys           Robbert-Jan Joling          08-01-2015
#                          Damiano Luzzi

# Import packages
library(raster)

RemoveCloudCover <- function(raster, cloud.mask) {
# This function removes cloud coverage from the input raster
#
# Args:
# raster = input raster
# cloud.mask = input cloud mask raster
#
# Returns: raster with cloud cover values changed to NA (non available)

# Change non-zero values cloud cover
  raster[cloud.mask != 0] <- NA
  return(raster)
}