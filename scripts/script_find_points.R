### script find coordinates and plot ###

# Mauricio Humberto Vancine - mauricio.vancine@gmail.com
# 25/07/2017

###---------------------------------------------------------------------------###

## memory
rm(list = ls())
gc()
memory.limit(size = 1.75e13) 

## packages
pacman::p_load(ggmap, leaflet)

# find coordinates
geocode("UNESP Rio Claro Brasil")

# plot
m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-47.54421, lat=-22.39073, popup="The birthplace of R")
m  # Print the map
