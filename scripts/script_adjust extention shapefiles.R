# adjust extention shapefiles
ex <- matrix(extent(en), 2, 2, byrow = T)
colnames(ex) <- c("min", "max")
row.names(ex) <- c("long", "lat")
ex

po.ra.sh@bbox <- ex

plot(po.ra.sh, axes = T)
