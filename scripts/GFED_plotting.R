years <- c("1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007",
           "2008", "2009", "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018",
           "2019", "2020", "2021")




months <- c("01", "02", "03", "04", "05", "06", "07" ,"08" ,"09" ,"10" ,"11" ,"12")

lat <- as.matrix(seq(from = 89.875, to = -89.875, by = -0.25))
lon <- seq(from = -179.875, to = 179.875, by = 0.25)



emission <- h5read(paste0("./data/global_emission/GFED4.1s_",years[i],"_beta.hdf5"),
                   paste0("emissions/",months[g],"/C"))

hdf_out_1997 <- list()

for (g in 1:length(months)){

      emission <- h5read(paste0("./data/global_emission/GFED4.1s_1997.hdf5"),
                         paste0("emissions/",months[g],"/C"))

    emission <- as.data.frame(emission)
    names(emission) <- lat

    new_emission <- cbind(lon, emission) %>%
      melt(., id.vars = "lon") %>%
      rename(lat = variable) %>%
      mutate(lat = as.numeric(as.character(lat)),
             year = "1997",
             month = months[g]) %>%
      st_as_sf(coords = c("lon", "lat"), crs = 4326)

    hdf_out_1997[[g]] <- new_emission
  }

hdf_out_1997_df <- unlist(hdf_out_1997)




# world <- map_data("world")
#
# all <- ggplot() +
#   geom_sf(data = new_fid, aes(color = value))+
#   scale_color_gradient(low="white", high="darkblue")+
#   geom_map(data = world, map = world,
#            aes(long, lat, map_id = region),
#            color = "black", fill = NA, size = 0.05)
#
# all
