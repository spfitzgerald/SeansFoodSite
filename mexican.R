library(tidyverse)
library(leaflet)

Mexican <- read_csv("Mexican.csv")

Taco_icon <- makeIcon("Taco_image.png",25, 25)

leaflet(data = Mexican) %>% 
  addTiles() %>% 
  addMarkers(~X, ~Y, popup = ~as.character(description), label = ~as.character(Name), icon = Taco_icon)
