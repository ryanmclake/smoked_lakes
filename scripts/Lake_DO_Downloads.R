# Package ID: edi.698.3 Cataloging System:https://pasta.edirepository.org.
# Data set title: Long-term lake dissolved oxygen and temperature data, 1941-2018.
# Data set creator:  Jonathan Stetler - Rensselaer Polytechnic Institute
# Data set creator:  Stephen Jane - Rensselaer Polytechnic Institute
# Data set creator:  Joshua Mincer - Rensselaer Polytechnic Institute
# Data set creator:  Maya Sanders - Rensselaer Polytechnic Institute
# Data set creator:  Kevin Rose - Rensselaer Polytechnic Institute
# Contact:  Jonathan Stetler -  Rensselaer Polytechnic Institute  - stetlj@rpi.edu
# Contact:  Kevin Rose -  Rensselaer Polytechnic Institute  - rosek4@rpi.edu
# Stylesheet v2.11 for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@virginia.edu

inUrl1  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/ca7001cba78a64c0ad0193580f478353"
infile1 <- tempfile()
try(download.file(inUrl1,infile1,method="curl"))
if (is.na(file.size(infile1))) download.file(inUrl1,infile1,method="auto")


dt1 <-read.csv(infile1,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "primary_contact",
                 "affiliation",
                 "collaborator",
                 "position",
                 "lake_ids",
                 "lake_names",
                 "link_if_available",
                 "additional_notes"    ), check.names=TRUE)

unlink(infile1)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt1$primary_contact)!="factor") dt1$primary_contact<- as.factor(dt1$primary_contact)
if (class(dt1$affiliation)!="factor") dt1$affiliation<- as.factor(dt1$affiliation)
if (class(dt1$collaborator)!="factor") dt1$collaborator<- as.factor(dt1$collaborator)
if (class(dt1$position)!="factor") dt1$position<- as.factor(dt1$position)
if (class(dt1$lake_ids)!="factor") dt1$lake_ids<- as.factor(dt1$lake_ids)
if (class(dt1$lake_names)!="factor") dt1$lake_names<- as.factor(dt1$lake_names)
if (class(dt1$link_if_available)!="factor") dt1$link_if_available<- as.factor(dt1$link_if_available)
if (class(dt1$additional_notes)!="factor") dt1$additional_notes<- as.factor(dt1$additional_notes)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt1)
attach(dt1)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(primary_contact)
summary(affiliation)
summary(collaborator)
summary(position)
summary(lake_ids)
summary(lake_names)
summary(link_if_available)
summary(additional_notes)
# Get more details on character variables

summary(as.factor(dt1$primary_contact))
summary(as.factor(dt1$affiliation))
summary(as.factor(dt1$collaborator))
summary(as.factor(dt1$position))
summary(as.factor(dt1$lake_ids))
summary(as.factor(dt1$lake_names))
summary(as.factor(dt1$link_if_available))
summary(as.factor(dt1$additional_notes))
detach(dt1)


inUrl2  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/10e773244e7d223bab9ad0989854d6cb"
infile2 <- tempfile()
try(download.file(inUrl2,infile2,method="curl"))
if (is.na(file.size(infile2))) download.file(inUrl2,infile2,method="auto")


dt2 <-read.csv(infile2,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "name",
                 "elevation",
                 "data_source"    ), check.names=TRUE)

unlink(infile2)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt2$row_id)!="factor") dt2$row_id<- as.factor(dt2$row_id)
if (class(dt2$lake_id)!="factor") dt2$lake_id<- as.factor(dt2$lake_id)
if (class(dt2$name)!="factor") dt2$name<- as.factor(dt2$name)
if (class(dt2$elevation)=="factor") dt2$elevation <-as.numeric(levels(dt2$elevation))[as.integer(dt2$elevation) ]
if (class(dt2$elevation)=="character") dt2$elevation <-as.numeric(dt2$elevation)
if (class(dt2$data_source)!="factor") dt2$data_source<- as.factor(dt2$data_source)

# Convert Missing Values to NA for non-dates

dt2$elevation <- ifelse((trimws(as.character(dt2$elevation))==trimws("NA")),NA,dt2$elevation)
suppressWarnings(dt2$elevation <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt2$elevation))==as.character(as.numeric("NA"))),NA,dt2$elevation))


# Here is the structure of the input data frame:
str(dt2)
attach(dt2)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(elevation)
summary(data_source)
# Get more details on character variables

summary(as.factor(dt2$row_id))
summary(as.factor(dt2$lake_id))
summary(as.factor(dt2$name))
summary(as.factor(dt2$data_source))
detach(dt2)


inUrl3  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/04d598c52bf10077a318b44a6bf6357c"
infile3 <- tempfile()
try(download.file(inUrl3,infile3,method="curl"))
if (is.na(file.size(infile3))) download.file(inUrl3,infile3,method="auto")


dt3 <-read.csv(infile3,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "name",
                 "hylak_id",
                 "area_km2",
                 "mean_depth_m",
                 "shore_len_km",
                 "dis_avg_ms3",
                 "res_time_days",
                 "elevation_m",
                 "wshd_area_km2"    ), check.names=TRUE)

unlink(infile3)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt3$row_id)!="factor") dt3$row_id<- as.factor(dt3$row_id)
if (class(dt3$lake_id)!="factor") dt3$lake_id<- as.factor(dt3$lake_id)
if (class(dt3$name)!="factor") dt3$name<- as.factor(dt3$name)
if (class(dt3$hylak_id)!="factor") dt3$hylak_id<- as.factor(dt3$hylak_id)
if (class(dt3$area_km2)=="factor") dt3$area_km2 <-as.numeric(levels(dt3$area_km2))[as.integer(dt3$area_km2) ]
if (class(dt3$area_km2)=="character") dt3$area_km2 <-as.numeric(dt3$area_km2)
if (class(dt3$mean_depth_m)=="factor") dt3$mean_depth_m <-as.numeric(levels(dt3$mean_depth_m))[as.integer(dt3$mean_depth_m) ]
if (class(dt3$mean_depth_m)=="character") dt3$mean_depth_m <-as.numeric(dt3$mean_depth_m)
if (class(dt3$shore_len_km)=="factor") dt3$shore_len_km <-as.numeric(levels(dt3$shore_len_km))[as.integer(dt3$shore_len_km) ]
if (class(dt3$shore_len_km)=="character") dt3$shore_len_km <-as.numeric(dt3$shore_len_km)
if (class(dt3$dis_avg_ms3)=="factor") dt3$dis_avg_ms3 <-as.numeric(levels(dt3$dis_avg_ms3))[as.integer(dt3$dis_avg_ms3) ]
if (class(dt3$dis_avg_ms3)=="character") dt3$dis_avg_ms3 <-as.numeric(dt3$dis_avg_ms3)
if (class(dt3$res_time_days)=="factor") dt3$res_time_days <-as.numeric(levels(dt3$res_time_days))[as.integer(dt3$res_time_days) ]
if (class(dt3$res_time_days)=="character") dt3$res_time_days <-as.numeric(dt3$res_time_days)
if (class(dt3$elevation_m)=="factor") dt3$elevation_m <-as.numeric(levels(dt3$elevation_m))[as.integer(dt3$elevation_m) ]
if (class(dt3$elevation_m)=="character") dt3$elevation_m <-as.numeric(dt3$elevation_m)
if (class(dt3$wshd_area_km2)=="factor") dt3$wshd_area_km2 <-as.numeric(levels(dt3$wshd_area_km2))[as.integer(dt3$wshd_area_km2) ]
if (class(dt3$wshd_area_km2)=="character") dt3$wshd_area_km2 <-as.numeric(dt3$wshd_area_km2)

# Convert Missing Values to NA for non-dates

dt3$area_km2 <- ifelse((trimws(as.character(dt3$area_km2))==trimws("NA")),NA,dt3$area_km2)
suppressWarnings(dt3$area_km2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$area_km2))==as.character(as.numeric("NA"))),NA,dt3$area_km2))
dt3$mean_depth_m <- ifelse((trimws(as.character(dt3$mean_depth_m))==trimws("NA")),NA,dt3$mean_depth_m)
suppressWarnings(dt3$mean_depth_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$mean_depth_m))==as.character(as.numeric("NA"))),NA,dt3$mean_depth_m))
dt3$shore_len_km <- ifelse((trimws(as.character(dt3$shore_len_km))==trimws("NA")),NA,dt3$shore_len_km)
suppressWarnings(dt3$shore_len_km <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$shore_len_km))==as.character(as.numeric("NA"))),NA,dt3$shore_len_km))
dt3$dis_avg_ms3 <- ifelse((trimws(as.character(dt3$dis_avg_ms3))==trimws("NA")),NA,dt3$dis_avg_ms3)
suppressWarnings(dt3$dis_avg_ms3 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$dis_avg_ms3))==as.character(as.numeric("NA"))),NA,dt3$dis_avg_ms3))
dt3$res_time_days <- ifelse((trimws(as.character(dt3$res_time_days))==trimws("NA")),NA,dt3$res_time_days)
suppressWarnings(dt3$res_time_days <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$res_time_days))==as.character(as.numeric("NA"))),NA,dt3$res_time_days))
dt3$elevation_m <- ifelse((trimws(as.character(dt3$elevation_m))==trimws("NA")),NA,dt3$elevation_m)
suppressWarnings(dt3$elevation_m <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$elevation_m))==as.character(as.numeric("NA"))),NA,dt3$elevation_m))
dt3$wshd_area_km2 <- ifelse((trimws(as.character(dt3$wshd_area_km2))==trimws("NA")),NA,dt3$wshd_area_km2)
suppressWarnings(dt3$wshd_area_km2 <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt3$wshd_area_km2))==as.character(as.numeric("NA"))),NA,dt3$wshd_area_km2))


# Here is the structure of the input data frame:
str(dt3)
attach(dt3)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(hylak_id)
summary(area_km2)
summary(mean_depth_m)
summary(shore_len_km)
summary(dis_avg_ms3)
summary(res_time_days)
summary(elevation_m)
summary(wshd_area_km2)
# Get more details on character variables

summary(as.factor(dt3$row_id))
summary(as.factor(dt3$lake_id))
summary(as.factor(dt3$name))
summary(as.factor(dt3$hylak_id))
detach(dt3)


inUrl4  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/a82be0f551b8708bc08eb33cd9ded0cf"
infile4 <- tempfile()
try(download.file(inUrl4,infile4,method="curl"))
if (is.na(file.size(infile4))) download.file(inUrl4,infile4,method="auto")


dt4 <-read.csv(infile4,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "name",
                 "country",
                 "state_prov",
                 "lat",
                 "long",
                 "max_depth",
                 "surf_area",
                 "type",
                 "troph_status"    ), check.names=TRUE)

unlink(infile4)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt4$row_id)!="factor") dt4$row_id<- as.factor(dt4$row_id)
if (class(dt4$lake_id)!="factor") dt4$lake_id<- as.factor(dt4$lake_id)
if (class(dt4$name)!="factor") dt4$name<- as.factor(dt4$name)
if (class(dt4$country)!="factor") dt4$country<- as.factor(dt4$country)
if (class(dt4$state_prov)!="factor") dt4$state_prov<- as.factor(dt4$state_prov)
if (class(dt4$lat)=="factor") dt4$lat <-as.numeric(levels(dt4$lat))[as.integer(dt4$lat) ]
if (class(dt4$lat)=="character") dt4$lat <-as.numeric(dt4$lat)
if (class(dt4$long)=="factor") dt4$long <-as.numeric(levels(dt4$long))[as.integer(dt4$long) ]
if (class(dt4$long)=="character") dt4$long <-as.numeric(dt4$long)
if (class(dt4$max_depth)=="factor") dt4$max_depth <-as.numeric(levels(dt4$max_depth))[as.integer(dt4$max_depth) ]
if (class(dt4$max_depth)=="character") dt4$max_depth <-as.numeric(dt4$max_depth)
if (class(dt4$surf_area)=="factor") dt4$surf_area <-as.numeric(levels(dt4$surf_area))[as.integer(dt4$surf_area) ]
if (class(dt4$surf_area)=="character") dt4$surf_area <-as.numeric(dt4$surf_area)
if (class(dt4$type)!="factor") dt4$type<- as.factor(dt4$type)
if (class(dt4$troph_status)!="factor") dt4$troph_status<- as.factor(dt4$troph_status)

# Convert Missing Values to NA for non-dates

dt4$lat <- ifelse((trimws(as.character(dt4$lat))==trimws("NA")),NA,dt4$lat)
suppressWarnings(dt4$lat <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$lat))==as.character(as.numeric("NA"))),NA,dt4$lat))
dt4$long <- ifelse((trimws(as.character(dt4$long))==trimws("NA")),NA,dt4$long)
suppressWarnings(dt4$long <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$long))==as.character(as.numeric("NA"))),NA,dt4$long))
dt4$max_depth <- ifelse((trimws(as.character(dt4$max_depth))==trimws("NA")),NA,dt4$max_depth)
suppressWarnings(dt4$max_depth <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$max_depth))==as.character(as.numeric("NA"))),NA,dt4$max_depth))
dt4$surf_area <- ifelse((trimws(as.character(dt4$surf_area))==trimws("NA")),NA,dt4$surf_area)
suppressWarnings(dt4$surf_area <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt4$surf_area))==as.character(as.numeric("NA"))),NA,dt4$surf_area))


# Here is the structure of the input data frame:
str(dt4)
attach(dt4)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(country)
summary(state_prov)
summary(lat)
summary(long)
summary(max_depth)
summary(surf_area)
summary(type)
summary(troph_status)
# Get more details on character variables

summary(as.factor(dt4$row_id))
summary(as.factor(dt4$lake_id))
summary(as.factor(dt4$name))
summary(as.factor(dt4$country))
summary(as.factor(dt4$state_prov))
summary(as.factor(dt4$type))
summary(as.factor(dt4$troph_status))
detach(dt4)


inUrl5  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/a5c03d93f3ed5f1a0605159d4ff2dcab"
infile5 <- tempfile()
try(download.file(inUrl5,infile5,method="curl"))
if (is.na(file.size(infile5))) download.file(inUrl5,infile5,method="auto")


dt5 <-read.csv(infile5,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "date",
                 "depth",
                 "name",
                 "temp",
                 "do_con",
                 "year"    ), check.names=TRUE)

unlink(infile5)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt5$row_id)!="factor") dt5$row_id<- as.factor(dt5$row_id)
if (class(dt5$lake_id)!="factor") dt5$lake_id<- as.factor(dt5$lake_id)
# attempting to convert dt5$date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp5date<-as.Date(dt5$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp5date) == length(tmp5date[!is.na(tmp5date)])){dt5$date <- tmp5date } else {print("Date conversion failed for dt5$date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp5date)
if (class(dt5$depth)=="factor") dt5$depth <-as.numeric(levels(dt5$depth))[as.integer(dt5$depth) ]
if (class(dt5$depth)=="character") dt5$depth <-as.numeric(dt5$depth)
if (class(dt5$name)!="factor") dt5$name<- as.factor(dt5$name)
if (class(dt5$temp)=="factor") dt5$temp <-as.numeric(levels(dt5$temp))[as.integer(dt5$temp) ]
if (class(dt5$temp)=="character") dt5$temp <-as.numeric(dt5$temp)
if (class(dt5$do_con)=="factor") dt5$do_con <-as.numeric(levels(dt5$do_con))[as.integer(dt5$do_con) ]
if (class(dt5$do_con)=="character") dt5$do_con <-as.numeric(dt5$do_con)
if (class(dt5$year)=="factor") dt5$year <-as.numeric(levels(dt5$year))[as.integer(dt5$year) ]
if (class(dt5$year)=="character") dt5$year <-as.numeric(dt5$year)

# Convert Missing Values to NA for non-dates

dt5$depth <- ifelse((trimws(as.character(dt5$depth))==trimws("NA")),NA,dt5$depth)
suppressWarnings(dt5$depth <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$depth))==as.character(as.numeric("NA"))),NA,dt5$depth))
dt5$temp <- ifelse((trimws(as.character(dt5$temp))==trimws("NA")),NA,dt5$temp)
suppressWarnings(dt5$temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$temp))==as.character(as.numeric("NA"))),NA,dt5$temp))
dt5$do_con <- ifelse((trimws(as.character(dt5$do_con))==trimws("NA")),NA,dt5$do_con)
suppressWarnings(dt5$do_con <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$do_con))==as.character(as.numeric("NA"))),NA,dt5$do_con))
dt5$year <- ifelse((trimws(as.character(dt5$year))==trimws("NA")),NA,dt5$year)
suppressWarnings(dt5$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt5$year))==as.character(as.numeric("NA"))),NA,dt5$year))


# Here is the structure of the input data frame:
str(dt5)
attach(dt5)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(date)
summary(depth)
summary(name)
summary(temp)
summary(do_con)
summary(year)
# Get more details on character variables

summary(as.factor(dt5$row_id))
summary(as.factor(dt5$lake_id))
summary(as.factor(dt5$name))
detach(dt5)


inUrl6  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/ce21470ab49d1d1976bc3dc72438c183"
infile6 <- tempfile()
try(download.file(inUrl6,infile6,method="curl"))
if (is.na(file.size(infile6))) download.file(inUrl6,infile6,method="auto")


dt6 <-read.csv(infile6,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "lake_id",
                 "name",
                 "tp_notes",
                 "tp_method_category",
                 "tn_notes",
                 "tn_method_category",
                 "chla_notes",
                 "chla_method_category",
                 "doc_notes",
                 "doc_method_category",
                 "notes",
                 "additional_notes"    ), check.names=TRUE)

unlink(infile6)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt6$lake_id)!="factor") dt6$lake_id<- as.factor(dt6$lake_id)
if (class(dt6$name)!="factor") dt6$name<- as.factor(dt6$name)
if (class(dt6$tp_notes)!="factor") dt6$tp_notes<- as.factor(dt6$tp_notes)
if (class(dt6$tp_method_category)!="factor") dt6$tp_method_category<- as.factor(dt6$tp_method_category)
if (class(dt6$tn_notes)!="factor") dt6$tn_notes<- as.factor(dt6$tn_notes)
if (class(dt6$tn_method_category)!="factor") dt6$tn_method_category<- as.factor(dt6$tn_method_category)
if (class(dt6$chla_notes)!="factor") dt6$chla_notes<- as.factor(dt6$chla_notes)
if (class(dt6$chla_method_category)!="factor") dt6$chla_method_category<- as.factor(dt6$chla_method_category)
if (class(dt6$doc_notes)!="factor") dt6$doc_notes<- as.factor(dt6$doc_notes)
if (class(dt6$doc_method_category)!="factor") dt6$doc_method_category<- as.factor(dt6$doc_method_category)
if (class(dt6$notes)!="factor") dt6$notes<- as.factor(dt6$notes)
if (class(dt6$additional_notes)!="factor") dt6$additional_notes<- as.factor(dt6$additional_notes)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt6)
attach(dt6)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(lake_id)
summary(name)
summary(tp_notes)
summary(tp_method_category)
summary(tn_notes)
summary(tn_method_category)
summary(chla_notes)
summary(chla_method_category)
summary(doc_notes)
summary(doc_method_category)
summary(notes)
summary(additional_notes)
# Get more details on character variables

summary(as.factor(dt6$lake_id))
summary(as.factor(dt6$name))
summary(as.factor(dt6$tp_notes))
summary(as.factor(dt6$tp_method_category))
summary(as.factor(dt6$tn_notes))
summary(as.factor(dt6$tn_method_category))
summary(as.factor(dt6$chla_notes))
summary(as.factor(dt6$chla_method_category))
summary(as.factor(dt6$doc_notes))
summary(as.factor(dt6$doc_method_category))
summary(as.factor(dt6$notes))
summary(as.factor(dt6$additional_notes))
detach(dt6)


inUrl7  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/f8f5c9fece6ac91b3eb3f15042b3548b"
infile7 <- tempfile()
try(download.file(inUrl7,infile7,method="curl"))
if (is.na(file.size(infile7))) download.file(inUrl7,infile7,method="auto")


dt7 <-read.csv(infile7,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "lake_id",
                 "name"    ), check.names=TRUE)

unlink(infile7)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt7$lake_id)!="factor") dt7$lake_id<- as.factor(dt7$lake_id)
if (class(dt7$name)!="factor") dt7$name<- as.factor(dt7$name)

# Convert Missing Values to NA for non-dates



# Here is the structure of the input data frame:
str(dt7)
attach(dt7)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(lake_id)
summary(name)
# Get more details on character variables

summary(as.factor(dt7$lake_id))
summary(as.factor(dt7$name))
detach(dt7)


inUrl8  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/73015ecba0f4f12bb5a49cdd0796137a"
infile8 <- tempfile()
try(download.file(inUrl8,infile8,method="curl"))
if (is.na(file.size(infile8))) download.file(inUrl8,infile8,method="auto")


dt8 <-read.csv(infile8,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "name",
                 "date",
                 "depth",
                 "stratum",
                 "meas_location",
                 "tp_ugl",
                 "tp_flag",
                 "tn_ugl",
                 "tn_flag",
                 "doc_mgl",
                 "doc_flag",
                 "chla_ugl",
                 "chla_flag",
                 "comment",
                 "year"    ), check.names=TRUE)

unlink(infile8)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt8$row_id)!="factor") dt8$row_id<- as.factor(dt8$row_id)
if (class(dt8$lake_id)!="factor") dt8$lake_id<- as.factor(dt8$lake_id)
if (class(dt8$name)!="factor") dt8$name<- as.factor(dt8$name)
# attempting to convert dt8$date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp8date<-as.Date(dt8$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp8date) == length(tmp8date[!is.na(tmp8date)])){dt8$date <- tmp8date } else {print("Date conversion failed for dt8$date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp8date)
if (class(dt8$depth)=="factor") dt8$depth <-as.numeric(levels(dt8$depth))[as.integer(dt8$depth) ]
if (class(dt8$depth)=="character") dt8$depth <-as.numeric(dt8$depth)
if (class(dt8$stratum)!="factor") dt8$stratum<- as.factor(dt8$stratum)
if (class(dt8$meas_location)!="factor") dt8$meas_location<- as.factor(dt8$meas_location)
if (class(dt8$tp_ugl)=="factor") dt8$tp_ugl <-as.numeric(levels(dt8$tp_ugl))[as.integer(dt8$tp_ugl) ]
if (class(dt8$tp_ugl)=="character") dt8$tp_ugl <-as.numeric(dt8$tp_ugl)
if (class(dt8$tp_flag)!="factor") dt8$tp_flag<- as.factor(dt8$tp_flag)
if (class(dt8$tn_ugl)=="factor") dt8$tn_ugl <-as.numeric(levels(dt8$tn_ugl))[as.integer(dt8$tn_ugl) ]
if (class(dt8$tn_ugl)=="character") dt8$tn_ugl <-as.numeric(dt8$tn_ugl)
if (class(dt8$tn_flag)!="factor") dt8$tn_flag<- as.factor(dt8$tn_flag)
if (class(dt8$doc_mgl)=="factor") dt8$doc_mgl <-as.numeric(levels(dt8$doc_mgl))[as.integer(dt8$doc_mgl) ]
if (class(dt8$doc_mgl)=="character") dt8$doc_mgl <-as.numeric(dt8$doc_mgl)
if (class(dt8$doc_flag)!="factor") dt8$doc_flag<- as.factor(dt8$doc_flag)
if (class(dt8$chla_ugl)=="factor") dt8$chla_ugl <-as.numeric(levels(dt8$chla_ugl))[as.integer(dt8$chla_ugl) ]
if (class(dt8$chla_ugl)=="character") dt8$chla_ugl <-as.numeric(dt8$chla_ugl)
if (class(dt8$chla_flag)!="factor") dt8$chla_flag<- as.factor(dt8$chla_flag)
if (class(dt8$comment)!="factor") dt8$comment<- as.factor(dt8$comment)
if (class(dt8$year)=="factor") dt8$year <-as.numeric(levels(dt8$year))[as.integer(dt8$year) ]
if (class(dt8$year)=="character") dt8$year <-as.numeric(dt8$year)

# Convert Missing Values to NA for non-dates

dt8$depth <- ifelse((trimws(as.character(dt8$depth))==trimws("NA")),NA,dt8$depth)
suppressWarnings(dt8$depth <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$depth))==as.character(as.numeric("NA"))),NA,dt8$depth))
dt8$tp_ugl <- ifelse((trimws(as.character(dt8$tp_ugl))==trimws("NA")),NA,dt8$tp_ugl)
suppressWarnings(dt8$tp_ugl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$tp_ugl))==as.character(as.numeric("NA"))),NA,dt8$tp_ugl))
dt8$tn_ugl <- ifelse((trimws(as.character(dt8$tn_ugl))==trimws("NA")),NA,dt8$tn_ugl)
suppressWarnings(dt8$tn_ugl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$tn_ugl))==as.character(as.numeric("NA"))),NA,dt8$tn_ugl))
dt8$doc_mgl <- ifelse((trimws(as.character(dt8$doc_mgl))==trimws("NA")),NA,dt8$doc_mgl)
suppressWarnings(dt8$doc_mgl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$doc_mgl))==as.character(as.numeric("NA"))),NA,dt8$doc_mgl))
dt8$chla_ugl <- ifelse((trimws(as.character(dt8$chla_ugl))==trimws("NA")),NA,dt8$chla_ugl)
suppressWarnings(dt8$chla_ugl <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$chla_ugl))==as.character(as.numeric("NA"))),NA,dt8$chla_ugl))
dt8$year <- ifelse((trimws(as.character(dt8$year))==trimws("NA")),NA,dt8$year)
suppressWarnings(dt8$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt8$year))==as.character(as.numeric("NA"))),NA,dt8$year))


# Here is the structure of the input data frame:
str(dt8)
attach(dt8)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(date)
summary(depth)
summary(stratum)
summary(meas_location)
summary(tp_ugl)
summary(tp_flag)
summary(tn_ugl)
summary(tn_flag)
summary(doc_mgl)
summary(doc_flag)
summary(chla_ugl)
summary(chla_flag)
summary(comment)
summary(year)
# Get more details on character variables

summary(as.factor(dt8$row_id))
summary(as.factor(dt8$lake_id))
summary(as.factor(dt8$name))
summary(as.factor(dt8$stratum))
summary(as.factor(dt8$meas_location))
summary(as.factor(dt8$tp_flag))
summary(as.factor(dt8$tn_flag))
summary(as.factor(dt8$doc_flag))
summary(as.factor(dt8$chla_flag))
summary(as.factor(dt8$comment))
detach(dt8)


inUrl9  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/c0aab240966ee30c6a4248c437b53b0d"
infile9 <- tempfile()
try(download.file(inUrl9,infile9,method="curl"))
if (is.na(file.size(infile9))) download.file(inUrl9,infile9,method="auto")


dt9 <-read.csv(infile9,header=F
               ,skip=1
               ,sep=","
               ,quot='"'
               , col.names=c(
                 "row_id",
                 "lake_id",
                 "name",
                 "date",
                 "time",
                 "depth",
                 "temp",
                 "do_con",
                 "meas_location",
                 "temp_flag",
                 "do_flag",
                 "year"    ), check.names=TRUE)

unlink(infile9)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt9$row_id)!="factor") dt9$row_id<- as.factor(dt9$row_id)
if (class(dt9$lake_id)!="factor") dt9$lake_id<- as.factor(dt9$lake_id)
if (class(dt9$name)!="factor") dt9$name<- as.factor(dt9$name)
# attempting to convert dt9$date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp9date<-as.Date(dt9$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp9date) == length(tmp9date[!is.na(tmp9date)])){dt9$date <- tmp9date } else {print("Date conversion failed for dt9$date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp9date)
if (class(dt9$depth)=="factor") dt9$depth <-as.numeric(levels(dt9$depth))[as.integer(dt9$depth) ]
if (class(dt9$depth)=="character") dt9$depth <-as.numeric(dt9$depth)
if (class(dt9$temp)=="factor") dt9$temp <-as.numeric(levels(dt9$temp))[as.integer(dt9$temp) ]
if (class(dt9$temp)=="character") dt9$temp <-as.numeric(dt9$temp)
if (class(dt9$do_con)=="factor") dt9$do_con <-as.numeric(levels(dt9$do_con))[as.integer(dt9$do_con) ]
if (class(dt9$do_con)=="character") dt9$do_con <-as.numeric(dt9$do_con)
if (class(dt9$meas_location)!="factor") dt9$meas_location<- as.factor(dt9$meas_location)
if (class(dt9$temp_flag)!="factor") dt9$temp_flag<- as.factor(dt9$temp_flag)
if (class(dt9$do_flag)!="factor") dt9$do_flag<- as.factor(dt9$do_flag)
if (class(dt9$year)=="factor") dt9$year <-as.numeric(levels(dt9$year))[as.integer(dt9$year) ]
if (class(dt9$year)=="character") dt9$year <-as.numeric(dt9$year)

# Convert Missing Values to NA for non-dates

dt9$depth <- ifelse((trimws(as.character(dt9$depth))==trimws("NA")),NA,dt9$depth)
suppressWarnings(dt9$depth <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$depth))==as.character(as.numeric("NA"))),NA,dt9$depth))
dt9$temp <- ifelse((trimws(as.character(dt9$temp))==trimws("NA")),NA,dt9$temp)
suppressWarnings(dt9$temp <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$temp))==as.character(as.numeric("NA"))),NA,dt9$temp))
dt9$do_con <- ifelse((trimws(as.character(dt9$do_con))==trimws("NA")),NA,dt9$do_con)
suppressWarnings(dt9$do_con <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$do_con))==as.character(as.numeric("NA"))),NA,dt9$do_con))
dt9$year <- ifelse((trimws(as.character(dt9$year))==trimws("NA")),NA,dt9$year)
suppressWarnings(dt9$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt9$year))==as.character(as.numeric("NA"))),NA,dt9$year))


# Here is the structure of the input data frame:
str(dt9)
attach(dt9)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(date)
summary(time)
summary(depth)
summary(temp)
summary(do_con)
summary(meas_location)
summary(temp_flag)
summary(do_flag)
summary(year)
# Get more details on character variables

summary(as.factor(dt9$row_id))
summary(as.factor(dt9$lake_id))
summary(as.factor(dt9$name))
summary(as.factor(dt9$meas_location))
summary(as.factor(dt9$temp_flag))
summary(as.factor(dt9$do_flag))
detach(dt9)


inUrl10  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/ee920ba4930520e609b0ac88ff42690e"
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl"))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


dt10 <-read.csv(infile10,header=F
                ,skip=1
                ,sep=","
                ,quot='"'
                , col.names=c(
                  "row_id",
                  "lake_id",
                  "name",
                  "date",
                  "secchi",
                  "meas_location",
                  "sec_flag",
                  "year"    ), check.names=TRUE)

unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt10$row_id)!="factor") dt10$row_id<- as.factor(dt10$row_id)
if (class(dt10$lake_id)!="factor") dt10$lake_id<- as.factor(dt10$lake_id)
if (class(dt10$name)!="factor") dt10$name<- as.factor(dt10$name)
# attempting to convert dt10$date dateTime string to R date structure (date or POSIXct)
tmpDateFormat<-"%Y-%m-%d"
tmp10date<-as.Date(dt10$date,format=tmpDateFormat)
# Keep the new dates only if they all converted correctly
if(length(tmp10date) == length(tmp10date[!is.na(tmp10date)])){dt10$date <- tmp10date } else {print("Date conversion failed for dt10$date. Please inspect the data and do the date conversion yourself.")}
rm(tmpDateFormat,tmp10date)
if (class(dt10$secchi)=="factor") dt10$secchi <-as.numeric(levels(dt10$secchi))[as.integer(dt10$secchi) ]
if (class(dt10$secchi)=="character") dt10$secchi <-as.numeric(dt10$secchi)
if (class(dt10$meas_location)!="factor") dt10$meas_location<- as.factor(dt10$meas_location)
if (class(dt10$sec_flag)!="factor") dt10$sec_flag<- as.factor(dt10$sec_flag)
if (class(dt10$year)=="factor") dt10$year <-as.numeric(levels(dt10$year))[as.integer(dt10$year) ]
if (class(dt10$year)=="character") dt10$year <-as.numeric(dt10$year)

# Convert Missing Values to NA for non-dates

dt10$secchi <- ifelse((trimws(as.character(dt10$secchi))==trimws("NA")),NA,dt10$secchi)
suppressWarnings(dt10$secchi <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$secchi))==as.character(as.numeric("NA"))),NA,dt10$secchi))
dt10$year <- ifelse((trimws(as.character(dt10$year))==trimws("NA")),NA,dt10$year)
suppressWarnings(dt10$year <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$year))==as.character(as.numeric("NA"))),NA,dt10$year))


# Here is the structure of the input data frame:
str(dt10)
attach(dt10)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(date)
summary(secchi)
summary(meas_location)
summary(sec_flag)
summary(year)
# Get more details on character variables

summary(as.factor(dt10$row_id))
summary(as.factor(dt10$lake_id))
summary(as.factor(dt10$name))
summary(as.factor(dt10$meas_location))
summary(as.factor(dt10$sec_flag))
detach(dt10)


inUrl11  <- "https://pasta.lternet.edu/package/data/eml/edi/698/3/bfd0fb4d2c199131fb4737fe8ab7647f"
infile11 <- tempfile()
try(download.file(inUrl11,infile11,method="curl"))
if (is.na(file.size(infile11))) download.file(inUrl11,infile11,method="auto")


dt11 <-read.csv(infile11,header=F
                ,skip=1
                ,sep=","
                ,quot='"'
                , col.names=c(
                  "row_id",
                  "lake_id",
                  "name",
                  "perag",
                  "perdev",
                  "perwater",
                  "perfor",
                  "perwet",
                  "pergrass",
                  "pershrub",
                  "comment"    ), check.names=TRUE)

unlink(infile11)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt11$row_id)!="factor") dt11$row_id<- as.factor(dt11$row_id)
if (class(dt11$lake_id)!="factor") dt11$lake_id<- as.factor(dt11$lake_id)
if (class(dt11$name)!="factor") dt11$name<- as.factor(dt11$name)
if (class(dt11$perag)=="factor") dt11$perag <-as.numeric(levels(dt11$perag))[as.integer(dt11$perag) ]
if (class(dt11$perag)=="character") dt11$perag <-as.numeric(dt11$perag)
if (class(dt11$perdev)=="factor") dt11$perdev <-as.numeric(levels(dt11$perdev))[as.integer(dt11$perdev) ]
if (class(dt11$perdev)=="character") dt11$perdev <-as.numeric(dt11$perdev)
if (class(dt11$perwater)=="factor") dt11$perwater <-as.numeric(levels(dt11$perwater))[as.integer(dt11$perwater) ]
if (class(dt11$perwater)=="character") dt11$perwater <-as.numeric(dt11$perwater)
if (class(dt11$perfor)=="factor") dt11$perfor <-as.numeric(levels(dt11$perfor))[as.integer(dt11$perfor) ]
if (class(dt11$perfor)=="character") dt11$perfor <-as.numeric(dt11$perfor)
if (class(dt11$perwet)=="factor") dt11$perwet <-as.numeric(levels(dt11$perwet))[as.integer(dt11$perwet) ]
if (class(dt11$perwet)=="character") dt11$perwet <-as.numeric(dt11$perwet)
if (class(dt11$pergrass)=="factor") dt11$pergrass <-as.numeric(levels(dt11$pergrass))[as.integer(dt11$pergrass) ]
if (class(dt11$pergrass)=="character") dt11$pergrass <-as.numeric(dt11$pergrass)
if (class(dt11$pershrub)=="factor") dt11$pershrub <-as.numeric(levels(dt11$pershrub))[as.integer(dt11$pershrub) ]
if (class(dt11$pershrub)=="character") dt11$pershrub <-as.numeric(dt11$pershrub)
if (class(dt11$comment)!="factor") dt11$comment<- as.factor(dt11$comment)

# Convert Missing Values to NA for non-dates

dt11$perag <- ifelse((trimws(as.character(dt11$perag))==trimws("NA")),NA,dt11$perag)
suppressWarnings(dt11$perag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$perag))==as.character(as.numeric("NA"))),NA,dt11$perag))
dt11$perdev <- ifelse((trimws(as.character(dt11$perdev))==trimws("NA")),NA,dt11$perdev)
suppressWarnings(dt11$perdev <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$perdev))==as.character(as.numeric("NA"))),NA,dt11$perdev))
dt11$perwater <- ifelse((trimws(as.character(dt11$perwater))==trimws("NA")),NA,dt11$perwater)
suppressWarnings(dt11$perwater <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$perwater))==as.character(as.numeric("NA"))),NA,dt11$perwater))
dt11$perfor <- ifelse((trimws(as.character(dt11$perfor))==trimws("NA")),NA,dt11$perfor)
suppressWarnings(dt11$perfor <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$perfor))==as.character(as.numeric("NA"))),NA,dt11$perfor))
dt11$perwet <- ifelse((trimws(as.character(dt11$perwet))==trimws("NA")),NA,dt11$perwet)
suppressWarnings(dt11$perwet <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$perwet))==as.character(as.numeric("NA"))),NA,dt11$perwet))
dt11$pergrass <- ifelse((trimws(as.character(dt11$pergrass))==trimws("NA")),NA,dt11$pergrass)
suppressWarnings(dt11$pergrass <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$pergrass))==as.character(as.numeric("NA"))),NA,dt11$pergrass))
dt11$pershrub <- ifelse((trimws(as.character(dt11$pershrub))==trimws("NA")),NA,dt11$pershrub)
suppressWarnings(dt11$pershrub <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt11$pershrub))==as.character(as.numeric("NA"))),NA,dt11$pershrub))


# Here is the structure of the input data frame:
str(dt11)
attach(dt11)
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.

summary(row_id)
summary(lake_id)
summary(name)
summary(perag)
summary(perdev)
summary(perwater)
summary(perfor)
summary(perwet)
summary(pergrass)
summary(pershrub)
summary(comment)
# Get more details on character variables

summary(as.factor(dt11$row_id))
summary(as.factor(dt11$lake_id))
summary(as.factor(dt11$name))
summary(as.factor(dt11$comment))
detach(dt11)





