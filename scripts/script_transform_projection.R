library(raster)
library(rgdal)

setwd("C:/Users/leec/Dropbox/__Limites da Mata Atlântica/SHAPES")

ma <- shapefile("merge_limites_MA_buffer20km_ajustado.shp")

ma
plot(ma, axes = T, col = "gray")

ma.geo  <- spTransform(ma, CRS("+init=epsg:4326"))
ma.geo
plot(ma.geo, axes = T, col = "gray")
