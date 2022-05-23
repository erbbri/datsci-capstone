library(tidyverse)
library(dplyr)
library(ggtext)

#Read in data on Pricenton University detailing enrollment by states and total. 
princeton <- read.csv("~/Downloads/princeton_in_state - Princeton.csv")

#Adjust aesthetics of plots themes.
theme_set(theme_minimal())
theme_update(text = element_text(family = "Raleway", color = "black", size = 12))
theme_update(plot.title = element_text(hjust = 0.5, size = 14))
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 12))
theme_update(plot.caption = element_text(hjust = 0.5, size = 12, color = "grey40"))

#Clean up Princeton data to be in the form needed for further plotting. This includes summarizing in state and out of state enrollment totals. 
recruit <- princeton %>%
        filter(type_of_freshman == "Total")
recruit %>%
  pivot_wider(
    names_from = in_state,
    values_from = enrollment_fall
  )
recruitment_sum <- recruit %>%
  group_by(in_state) %>%
  summarise(num_rec = sum(enrollment_fall))

#Create barchart to show the total number freshman (Fall 2017) who were enrolled in state, and the total enrolled from out of state. 
ggplot(recruitment_sum) +
  geom_bar(aes(x=in_state,y=num_rec, fill = in_state),stat="identity", width = 0.6) +
  scale_fill_manual(values = c("#F58025", "black")) +
  theme(legend.position="none") +
  labs(
    y = "Recruitment Count",
    title = "<b>Princeton's Freshman Recruitment - 2017 </b>",
    caption = "<br>Number of Freshman recruited <b><span style='color: #F58025'>Out-of-State</span></b> vs. 
    <b><span style='color: black'>In-State</span> </b>"
  )+
  theme(plot.title = element_markdown(),
        plot.caption =  element_markdown()) +
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())




