# Team Name:               Team Members:               Date:
# Flying Monkeys           Robbert-Jan Joling          08-01-2015
#                          Damiano Luzzi


# Import packages ---------------------------------------------------------
library(rgdal)

# Source functions --------------------------------------------------------
source('R/SelectBands.R')
source('R/CalculateNDVI.R')
source('R/RemoveCloudCover.R')
source('R/MatchExtent.R')


# Preprocessing data ------------------------------------------------------

# Select red and near infra-red bands from 1990 and 2014
LS5.1990 <- SelectBands(1990, 3, 4)
LS8.2014 <- SelectBands(2014, 4, 5)

# Calculate NDVI for 1990 and 2014
NDVI.1990 <- overlay(x = LS5.1990[[1]], y = LS5.1990[[2]], fun = CalculateNDVI)
NDVI.2014 <- overlay(x = LS8.2014[[1]], y = LS8.2014[[2]], fun = CalculateNDVI)

# Remove cloud cover from NDVI raster
clean.NDVI.1990 <- RemoveCloudCover(NDVI.1990, LS5.1990[[3]])
clean.NDVI.2014 <- RemoveCloudCover(NDVI.2014, LS8.2014[[3]])

# Match extent of both cleaned NDVI rasters
crop.NDVI.1990.2014 <- MatchExtent(clean.NDVI.1990, clean.NDVI.2014)


# Visualise intermediate outputs ------------------------------------------

# Plot NDVI 1990 (original, cleaned, cropped)
plot(NDVI.1990)
plot(clean.NDVI.1990)
plot(crop.NDVI.1990.2014[[1]])

# Plot NDVI 2014 (original, cleaned, cropped)
plot(NDVI.2014)
plot(clean.NDVI.2014)
plot(crop.NDVI.1990.2014[[2]])


# Final output ------------------------------------------------------------

NDVI.change <- crop.NDVI.1990.2014[[2]] - crop.NDVI.1990.2014[[1]]
writeRaster(x = NDVI.change, filename = 'output/Change_NDVI_Wageningen_1990_2014.grd', datatype = 'FLT4S')
plot(NDVI.change)




