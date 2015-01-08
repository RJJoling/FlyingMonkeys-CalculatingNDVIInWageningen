# Team Name:               Team Members:               Date:
# Flying Monkeys           Robbert-Jan Joling          08-01-2015
#                          Damiano Luzzi

# Import packages
library(raster)

MatchExtent <- function(raster1, raster2) {
# This function creates a list of two rasters that have been modified
# to have the same extent
#
# Args:
# raster1 = first input raster
# raster12 = second input raster
#
# Returns: list of two rasters with identical extent

# Create extent classes of the input rasters
  extent1 <- extent(raster1)
  extent2 <- extent(raster2)

# Create common extent from both original extents
  common.extent <- intersect(extent1, extent2)

# Crop input rasters to new extent
  crop.raster1 <- crop(x = raster1, y = common.extent)
  crop.raster2 <- crop(x = raster2, y = common.extent)

  return(c(crop.raster1, crop.raster2))

}