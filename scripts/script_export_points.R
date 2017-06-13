library(raster)
library(rgdal)

po<- read.table("D:/mineracao/_joao/pontos/ocorrencias.txt", h = T)

sp <- unique(po$sp)
sp

for(i in 1:length(sp)){
  po.s <- po[po$sp == sp[i], ]
  coordinates(po.s) <- ~long + lat
  crs(po.s) <- CRS("+proj=longlat +datum=WGS84")
  writeOGR(po.s, "D:/mineracao/_joao/pontos", paste0(sp[i]),
           driver = "ESRI Shapefile")}
