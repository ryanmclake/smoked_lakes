chla <- vroom::vroom("./data/lake_chla/DATA_dailymean_chlatemp_sub_v2.csv")
shp_hylakes <- read_sf(paste0("./data/hydroLAKES/HydroLAKES_points_v10_shp/HydroLAKES_points_v10.shp"))
lakes_chla <- left_join(shp_hylakes, chla, by = "Hylak_id")
lakes_chla <- na.omit(lakes_chla)

lakes_chla_aggregate <- lakes_chla %>%
  mutate(year = lubridate::year(date),
         month = lubridate::month(date)) %>%
  mutate(year = as.character(year),
         month = as.character(month)) %>%
  group_by(Hylak_id, Lake_name, Country, Continent, Poly_src, month, year) %>%
  summarize_all(funs(mean))







joined_sf_1997<- lakes_chla_1997 %>%
  cbind(hdf_bind_1997[st_nearest_feature(lakes_chla_1997, hdf_bind_1997),])
joined_sf_1997 <- joined_sf_1997 %>% mutate(dist = st_distance(geometry, geometry.1, by_element = T))
joined_sf_1997$dist <- drop_units(joined_sf_1997$dist)

