# font
# https://gis.stackexchange.com/questions/110117/counting-number-of-points-in-polygon-using-r

# Load libraries ----------------------------------------------------------
if(!require(pacman)) install.packages("pacman")
pacman::p_load(raster, sf, dplyr)

# Get sample data ---------------------------------------------------------

# Get polygon
polygon <- getData('GADM', country='URY', level = 1)[,1] # Download polygon of country admin level 1 
polygon <- st_as_sf(polygon) # convert to sf object
colnames(polygon) <- c("id_polygons", "geometry") # change colnames
polygon$id_polygons <- paste0("poly_", LETTERS[1:19]) #  change polygon ID

# Get sample random poins from polygon bbox
set.seed(4)
bbox <- st_as_sfc(st_bbox(polygon))
points <- st_sample(x = bbox, size = 100, type = "random")
points <- st_as_sf(data.frame(id_points = as.character(1:100)), points) # add points ID

# Plot data ---------------------------------------------------------------

# Plot polygon + points
plot(polygon, graticule = st_crs(4326), key.pos = 1)
plot(points, pch = 19, col = "black", add = TRUE)

# Intersection between polygon and points ---------------------------------

intersection <- st_intersection(x = polygon, y = points)

# Plot intersection
plot(polygon, graticule = st_crs(4326), key.pos = 1)
plot(intersection[1], col = "black", pch = 19, add = TRUE)

# View result
table(intersection$id_polygons) # using table

# using dplyr
int_result <- intersection %>% 
  group_by(id_polygons) %>% 
  count()

as.data.frame(int_result)[,-3]
