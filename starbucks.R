library(dplyr)
library(leaflet)

## Writing functions to save the html file
saveas <- function(map, file){
        class(map) <- c("saveas",class(map))
        attr(map,"filesave")=file
        map
}

print.saveas <- function(x, ...){
        class(x) = class(x)[class(x)!="saveas"]
        htmltools::save_html(x, file=attr(x,"filesave"))
}


starbucks = read.csv("All_Starbucks_Locations_in_the_US_-_Map.csv", stringsAsFactors = FALSE)
leaflet() %>% addTiles() %>% setView(-84.3847, 33.7613, zoom = 16) %>%
        addMarkers(data = starbucks, lat = ~ Latitude, lng = ~ Longitude,popup = starbucks$Name) %>%
        saveas("~/Desktop/Starbucks/starbucks.html")
        
