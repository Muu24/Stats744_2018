#3.
library(leaflet)
library(knitr)
library(rgdal)
library(ggplot2)
library(tidyverse)
library(forcats)
library(labeling)
library(ggmap)
##
m <- leaflet() %>% 
  addTiles()
m
m %>% addProviderTiles(providers$Stamen.Toner) 
m %>% addProviderTiles(providers$CartoDB.Positron)
m %>% addProviderTiles(providers$Esri.NatGeoWorldMap)
#install.packages("kableExtra")
#devtools::install_github("haozhu233/kableExtra")
library(kableExtra)
library(knitr)
text_tbl <- data.frame(
  BaseMap = c("Default", "Stamen.Tower", "CartoDB.Positron", "Esri.NatGeoWorldMap"),
  Pros = c("Zoomed out - colours are fairly simple", "None?", "Great for added colour as the background colour is mutual", "Shows different landscapes of Earth, i.e. deepness of water & dry/wet regions"),
  Cons = c("Zoom in - gives extra colour", "Any colour added to plot will likely be hard to see", "None?", "Specific uses only")
)
kable(text_tbl, "html") %>%
  kable_styling(full_width = T) 
##
leaflet() %>% addTiles() %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )

leaflet() %>% addProviderTiles(providers$CartoDB.Positron) %>%
  addWMSTiles(
    "http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi",
    layers = "nexrad-n0r-900913",
    options = WMSTileOptions(format = "image/png", transparent = TRUE),
    attribution = "Weather data © 2012 IEM Nexrad"
  )
data(quakes)

leaflet(data = quakes) %>%  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(~long, ~lat, radius = ~sqrt(exp(mag))/2, label = ~as.character(mag), color = "black", fillColor = "red", fillOpacity = 0.1, stroke = FALSE, opacity = 0)

leaflet(data = quakes) %>%  addProviderTiles(providers$CartoDB.Positron) %>%
  addCircleMarkers(~long, ~lat, radius = ~sqrt(exp(mag))/2, label = ~as.character(mag), color = "black", fillColor = "red", fillOpacity = 0.6, stroke = FALSE, opacity = 0)

library(rgdal)
states <- readOGR("~/Desktop/Stats744_2018/cb_2016_us_state_20m.shp",
                  layer = "cb_2016_us_state_20m", GDAL1_integer64_policy = TRUE)

leaflet(states) %>%
  addPolygons(color = "#444444", weight = 2, smoothFactor = 0.5,
              opacity = 0.1, fillOpacity = 0.8,
              fillColor = ~colorQuantile("YlOrRd", ALAND)(ALAND),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))

leaflet(states) %>% addProviderTiles(providers$CartoDB.Positron) %>%
  addPolygons(color = "#444444", weight = 2, smoothFactor = 0.5,
              opacity = 0.1, fillOpacity = 0.8,
              fillColor = ~colorQuantile("YlOrRd", ALAND)(ALAND),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
str(states@data)
###
CHN2 <- readOGR("~/Desktop/Stats744_2018/CHN_adm/CHN_adm2.shp",layer = "CHN_adm2", GDAL1_integer64_policy = TRUE)
leaflet(CHN3) %>% addTiles() %>%
  addPolygons(color = "#444444", weight = 2, smoothFactor = 0.5,
              opacity = 0.1, fillOpacity = 0.8,
              fillColor = ~colorQuantile("YlOrRd", ID_2)(ID_2),
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE))
str(CHN3@data)
leaflet(CHN3)
