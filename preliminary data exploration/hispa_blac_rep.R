library(tidyverse)
library(ggtext)

theme_set(theme_minimal())
theme_update(text = element_text(family = "Raleway", color = "black", size = 12))
theme_update(plot.title = element_text(hjust = 0.5, size = 14))
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 12))
theme_update(plot.caption = element_text(hjust = 0.5, size = 10, color = "grey40"))

two_year_south <- filter(two_year, 
                      fips_ipeds=="South Carolina" | fips_ipeds== "Alabama"| 
                      fips_ipeds== "Georgia" | fips_ipeds=="Louisiana" | 
                      fips_ipeds=="Mississippi" | 
                      fips_ipeds=="Texas" | 
                      fips_ipeds=="Florida")
four_year_south <- filter(four_year,                       
                      fips_ipeds=="South Carolina" | fips_ipeds== "Alabama"| 
                      fips_ipeds== "Georgia" | fips_ipeds=="Louisiana" | 
                      fips_ipeds=="Mississippi" | 
                      fips_ipeds=="Texas" | 
                      fips_ipeds=="Florida")

two_year_south_2017 <- filter(two_year_south, year=="2017")
four_year_south_2017 <- filter(four_year_south, year=="2017")
four_year_south_2017 <- four_year_south_2017 %>%
                        filter(more_selective == 1)
view(four_year_south_2017)

ggplot(four_year_south_2017, aes(x= fips_ipeds, y= dif_black, fill=inst_name))+
  geom_bar(stat = "identity", position = "dodge", width=0.5)+
  scale_fill_hue(c = 40) +
  labs(title="<b>Black Representation in Deep South 2017 <br>(More Selective Institutions)</b>",
       y = "College Representation of Black Population\n(College Percent minus Market Percent)",
       x = " ",
       caption = "<i><b><span style='color: black'>Every bar represents a More Selective College Institution in that state.</span></b> </i> <br>
       <br><b><i>Deep South</i></b> defined as what is generally considered to be the most <b> southern </b> and <b> eastern </b>part of the U.S.")+
  theme(plot.title = element_markdown(),
        plot.caption =  element_markdown()) +
  theme(legend.position = "none") 


ggplot(four_year_south_2017, aes(x= fips_ipeds, y= dif_hispa, fill=inst_name))+
  geom_bar(stat = "identity", position = "dodge", width=0.5)+
  scale_fill_hue(c = 40) +
  labs(title="<b>Hispanic Representation in Deep South 2017 <br>(More Selective Institutions)</b>",
       y = "College Representation of Hispanic Population\n(College Percent minus Market Percent)",
       x = " ",
       caption = "<i><b><span style='color: black'>Every bar represents a More Selective College Institution in that state.</span></b> </i> <br>
       <br><b><i>Deep South</i></b> defined as what is generally considered to be the most <b> southern </b> and <b> eastern </b>part of the U.S.")+
  theme(plot.title = element_markdown(),
        plot.caption =  element_markdown()) +
  theme(legend.position = "none") 


