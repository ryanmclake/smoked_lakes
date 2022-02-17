
if (!require("OpenStreetMap")) install.packages("OpenStreetMap")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(tidyverse,ggmap,ggplot2,rgdal,rgeos,maptools,tmap,sf,
               rworldmap, elevatr,units,maps, gganimate)

shp_fire_2000_2009 <- read_sf(paste0("./data/fire_data/WFDSSHistoricFirePerimeters_2000_2009.shp"))%>%
  st_transform(., crs = 4326)
shp_fire_2010_2019 <- read_sf(paste0("./data/fire_data/WFDSSHistoricFirePerimeters_2010_2019.shp"))%>%
  st_transform(., crs = 4326)
shp_fire_2020 <- read_sf(paste0("./data/fire_data/WFDSSHistoricFirePerimeters_2020.shp"))%>%
  st_transform(., crs = 4326)


shp_fire <- bind_rows(shp_fire_2000_2009, shp_fire_2010_2019, shp_fire_2020) %>%
  mutate(Date = lubridate::ymd(DATE_CUR),
         YEAR = lubridate:: year(Date),
         Month = lubridate::month(Date)) %>%
  filter(grepl('CA|OR|WA', UNIT_ID))%>%
  filter(!grepl('AZ|NM|WY|AL|FL|ID|IL|NV|LA|NC|CO', UNIT_ID))%>%
  mutate(STATE = ifelse(grepl("CA", UNIT_ID),"California",UNIT_ID),
         STATE = ifelse(grepl("OR", STATE),"Oregon",STATE),
         STATE = ifelse(grepl("WA", STATE),"Washington",STATE))

shp_fire <- st_make_valid(shp_fire)


usa = st_as_sf(map('usa', plot = FALSE, fill = TRUE))
laea = st_crs("+proj=laea +lat_0=30 +lon_0=-95")
usa <- st_transform(usa, laea)

us_geo <- tigris::states(class = "sf", cb = TRUE)%>%
  filter(STUSPS %in% c("CA","OR","WA"))

terrain_map <- openmap(upperLeft = c(50, -125),
                       lowerRight = c(23, -113),
                       type = 'nps', zoom=7)

#Concentration of PM2.5 higher than 20 μg*m−3 in fire prone areas is associated
#with wildfire smoke plumes, while concentrations 35 μg*m−3 or higher reflect
#dense smoke conditions --> Scordo et al., 2021

d <- list.files(path = "/Users/ryanmcclure/Documents/smoked_lakes/data/smoke_data/",
                pattern = "*.csv", full.names = TRUE) %>%
  lapply(read_csv) %>%
  do.call(rbind.data.frame, .) %>%
  mutate(Date = lubridate::mdy(Date),
         Year = lubridate::year(Date),
         Month = lubridate::month(Date),
         Day = lubridate::day(Date),
         `Site ID` = as.numeric(`Site ID`),
         SITE_LATITUDE = as.numeric(SITE_LATITUDE),
         SITE_LONGITUDE = as.numeric(SITE_LONGITUDE),
         smoky = 35)%>%
  group_by(Month, Year, `Site ID`, SITE_LATITUDE, SITE_LONGITUDE, smoky, UNITS) %>%
  summarize(max_PM25 = max(`Daily Mean PM2.5 Concentration`),
            sd_PM25 = sd(`Daily Mean PM2.5 Concentration`)) %>%
  mutate(smoky_site = ifelse(max_PM25 > smoky, 1, 0)) %>%
  filter(smoky_site == 1)%>%
  st_as_sf(coords = c("SITE_LONGITUDE", "SITE_LATITUDE"), crs = 4326)%>%
  filter(Year > 1999)

years <- c(2000, 2001, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012,
           2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020)

months <- c(1,2,3,4,5,6,7,8,9,10,11,12)

for(i in 1:length(years)){
  for(s in 1:length(months)){

    map <- d %>%
    filter(Year == years[i])%>%
      filter(Month == months[s])

    fire <- shp_fire %>%
      filter(FIRE_YEAR_ == years[i])%>%
      filter(Month == months[s])

OSM_map <- OpenStreetMap::autoplot.OpenStreetMap(terrain_map) +
    geom_sf(data = st_transform(x = us_geo, crs = 3857),
            aes(geometry = geometry, alpha = 0.3),  inherit.aes = F)+
    geom_sf(data = fire, aes(geometry = geometry), cex = 0.2, color = "darkorange", inherit.aes = F) +
    geom_sf(data = map, aes(geometry = geometry, bg = Year, size = max_PM25), alpha = 0.4, pch = 21, inherit.aes = F) +
    labs(caption = "\U00a9 OpenStreetMap contributors") +
    xlab("Longitude") +
    ylab("Latitude") +
    labs(title = paste0("Year: ",years[i],"Month: ",months[s]," mean PM2.5 exceeding 20 ug/m3 "))+
    theme_bw() +
    theme(legend.position = "none",
          title = element_text(size = 6))

ggsave(paste0("./figures/PM25_space_time_gif/",years[i],"_",months[s],"_PM25_Map.jpg"),
           width = 4, height = 7, units = "in", dpi = 150)

  }
}





