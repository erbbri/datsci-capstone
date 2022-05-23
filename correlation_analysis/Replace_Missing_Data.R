#Load essential packages
library(dplyr)
library(tidyr)

#Write code to be able to replace partial missing racial data in four year dataframe with the mean of that racial percentage considering all other present years.
four_year <- read_csv("CollegeData_4-year.csv")
replace_missing <- CollegeData_4_year %>%
  mutate_at(vars(col_white, mkt_white, dif_white,
                 col_hispa, mkt_hispa, dif_hispa,
                 col_black, mkt_black, dif_black,
                 col_asian, mkt_asian, dif_asian,
                 col_amind, mkt_amind, dif_amind,
                 col_pacis, mkt_pacis, dif_pacis,
                 col_twora, mkt_twora, dif_twora), 
            ~replace_na(.,mean(., na.rm = TRUE)))
