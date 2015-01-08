# Team Name:               Team Members:               Date:
# Flying Monkeys           Robbert-Jan Joling          08-01-2015
#                          Damiano Luzzi

# Import packages
library(raster)

SelectBands <- function(year, band1, band2) {
# This function selects the images of interest and converts these into class RasterLayer
#
# Args:
# year = year of interest
# band1 = number of first band to select
# band2 = number of second band to select
#
# Returns: a list containing the three rasters of the selected bands

# Check input of bands is numeric
  if (!is.numeric(band1)){
    stop("Band 1 class of numeric expected")
    } else { if (!is.numeric(band2)){
    stop("Band 2 class of numeric expected")
    }
  }

# Ensure correct order of bands so that output has the lower band first, followed by the higher band
  if (band1 > band2){
    lowest.band = band2
    highest.band = band1
  } else {
    lowest.band = band1
    highest.band = band2
  }
# Create expression to search in data containing year and band number
  lookup.band1 <- paste('*', year, '*', paste('band', lowest.band, sep = ""), '*.tif', sep = "")
  lookup.band2 <- paste('*', year, '*', paste('band', highest.band, sep = ""), '*.tif', sep = "")
  lookup.cfmask <- paste('*', year,"*cfmask.tif", sep = "")

# Find the bands requested
  first.band <- list.files('data/', pattern = glob2rx(lookup.band1), full.names = TRUE)
  second.band <- list.files('data/', pattern = glob2rx(lookup.band2), full.names = TRUE)

# Find cloud mask
  cloud.mask <- list.files('data/', pattern = glob2rx(lookup.cfmask), full.names = TRUE)

# Convert images into single raster layers
  first.band <- raster(first.band)
  second.band <- raster(second.band)
  cloud.mask <- raster(cloud.mask)

# Create lists of the three raster layers
  return(c(first.band, second.band, cloud.mask))
}
