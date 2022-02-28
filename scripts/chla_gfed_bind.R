chla <- vroom::vroom("./data/lake_chla/DATA_dailymean_chlatemp_sub_v2.csv")

shp_hylakes <- read_sf(paste0("./data/hydroLAKES/HydroLAKES_points_v10_shp/HydroLAKES_points_v10.shp"))

lakes_chla <- left_join(shp_hylakes, chla, by = "Hylak_id")

lakes_chla <- na.omit(lakes_chla)

years <- c("1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007",
           "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016")

lakes_chla_1997 <- lakes_chla %>%
  mutate(year = lubridate::year(date)) %>%
  filter(year == "1997") %>%
  mutate(year = as.character(year))

joined_sf_1997<- lakes_chla_1997 %>%
  cbind(hdf_bind_1997[st_nearest_feature(lakes_chla_1997, hdf_bind_1997),])
joined_sf_1997 <- joined_sf_1997 %>% mutate(dist = st_distance(geometry, geometry.1, by_element = T))
joined_sf_1997$dist <- drop_units(joined_sf_1997$dist)

