# Have to take your google map, export to kmz, then convert to csv all outside of R.  Probably a better way to do this but it'll work for now

library(tidyverse)
library(leaflet)

Mexican <- read_csv("MEXICAN.csv")
Thai <- read_csv("THAI.csv")

Taco_icon <- makeIcon("Taco_image.png",25, 25)

Thai_icon <- makeIcon("Thai_image.png",25, 25)


leaflet() %>% 
  addTiles() %>% 
  addMarkers(data = Mexican, ~X, ~Y, popup = ~as.character(description), label = ~as.character(Name), icon = Taco_icon, group = "Mexican") %>% 
  addMarkers(data = Thai, ~X, ~Y, popup = ~as.character(description), label = ~as.character(Name), icon = Thai_icon, group = "Thai") %>% 
  addLayersControl(baseGroups = c("Mexican", "Thai"))
