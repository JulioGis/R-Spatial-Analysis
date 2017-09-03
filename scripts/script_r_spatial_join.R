### script spatial join ###

# Mauricio Humberto Vancine - mauricio.vancine@gmail.com

###---------------------------------------------------------------------###

# memory
rm(list = ls())
gc()
memory.limit(size = 1.75e13)

# packages 
if(!require("pacman")) install.packages("pacman")
pacman::p_load(raster, rgdal, maptools, maps)

# points
po <- shapefile(points.shp)

# lines
li <- shapefile(lines.shp)

# limit br
br <- getData("GADM", country = "BRA", level = 1)
br

plot(br, col = adjustcolor("green", .5), add = T)

# join
po@data$ins <- over(po, as(br, "SpatialPolygons"))
po.in <- subset(po, po@data$ins ==  1)

# export
writeOGR(po.in, "points", "point_inside_br", drive = "ESRI Shapefile")

###---------------------------------------------------------------------###
