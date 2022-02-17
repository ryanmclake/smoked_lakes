

d2 <- list.files(path = "/Users/ryanmcclure/Documents/smoked_lakes/data/smoke_data/",
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
         smoky = 35) %>%
  group_by(Year, STATE, UNITS) %>%
  summarize(max_PM25 = max(`Daily Mean PM2.5 Concentration`),
            sd_PM25 = sd(`Daily Mean PM2.5 Concentration`))

ggplot(d2, aes(Year, max_PM25, color = STATE, group = STATE))+
  geom_point(size = 4)+
  geom_smooth(aes(fill = STATE), alpha = 0.3,method="auto", se=TRUE, fullrange=FALSE, level=0.95)


d3 <- list.files(path = "/Users/ryanmcclure/Documents/smoked_lakes/data/smoke_data/",
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
         smoky = 35) %>%
  group_by(Month, Year, STATE, UNITS) %>%
  summarize(max_PM25 = max(`Daily Mean PM2.5 Concentration`),
            sd_PM25 = sd(`Daily Mean PM2.5 Concentration`))

ggplot(d3, aes(Month, max_PM25, group = Year))+
  geom_line(size = 0.5)+
  theme_bw()+
  facet_wrap(~STATE)+
  transition_reveal(Year)

joined_sf <- d %>%
  cbind(shp_fire[st_nearest_feature(d, shp_fire),])
joined_sf <- joined_sf %>% mutate(dist = st_distance(geometry, geometry.1, by_element = T))
joined_sf$dist <- drop_units(joined_sf$dist)

joined_sf_small <- joined_sf %>%
  group_by(Year, STATE)%>%
  summarize(median_acre = median(GIS_ACRES),
            PM25 = mean(max_PM25))

ggplot(joined_sf_small, aes(Year, PM25, group = STATE))+
  geom_line(aes(color = STATE), size = 0.5)+
  theme_bw()
