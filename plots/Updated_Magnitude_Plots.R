library(tidyverse)
library(openintro)
library(ggplot2)
library(dplyr)
library(ggtext)

two_year <- Data_2.year_v5
four_year <- Data_4.year_v5

four_year_clean <- four_year %>%
  select(year, inst_name, dif_white, dif_amind, dif_asian, dif_black,
         dif_pacis, dif_twora, dif_hispa)
two_year_clean <- two_year %>%
  select(year, inst_name, dif_white, dif_amind, dif_asian, dif_black,
         dif_pacis, dif_twora, dif_hispa)

four_year_md_smsd <- four_year_clean %>%
  rowwise () %>%
  mutate(mag_diff = sum(abs(dif_white), abs(dif_hispa), abs(dif_black),
                        abs(dif_asian), abs(dif_amind), abs(dif_pacis),
                        abs(dif_twora), na.rm = T)) %>%
  mutate(se = sum((dif_white)^2, (dif_hispa)^2, (dif_black)^2, 
                  (dif_asian)^2, (dif_amind)^2, (dif_pacis)^2,
                  (dif_twora)^2, na.rm = T)) %>%
  mutate(smsd = sqrt(1/7*se)) %>%
  mutate(missing_racial_data = is.na(dif_white) + is.na(abs(dif_hispa)) 
         + is.na(abs(dif_black)) + is.na(abs(dif_asian)) 
         + is.na(abs(dif_amind)) + is.na(abs(dif_pacis))
         + is.na(abs(dif_twora))) %>%
  mutate(missing_racial_data = as.character(missing_racial_data))

two_year_md_smsd <- two_year_clean %>%
  rowwise () %>%
  mutate(mag_diff = sum(abs(dif_white), abs(dif_hispa), abs(dif_black),
                        abs(dif_asian), abs(dif_amind), abs(dif_pacis),
                        abs(dif_twora), na.rm = T)) %>%
  mutate(se = sum((dif_white)^2, (dif_hispa)^2, (dif_black)^2, 
                  (dif_asian)^2, (dif_amind)^2, (dif_pacis)^2,
                  (dif_twora)^2, na.rm = T)) %>%
  mutate(smsd = sqrt(1/7*se)) %>%
  mutate(missing_racial_data = is.na(dif_white) + is.na(abs(dif_hispa)) 
         + is.na(abs(dif_black)) + is.na(abs(dif_asian)) 
         + is.na(abs(dif_amind)) + is.na(abs(dif_pacis))
         + is.na(abs(dif_twora))) %>%
  mutate(missing_racial_data = as.character(missing_racial_data))

UW_mag_diff <- four_year_md_smsd %>%
  filter(inst_name == "University of Washington-Seattle Campus")
##Make individual plots for any given school's data

theme_set(theme_minimal())
theme_update(text = element_text(family = "Arial", color = "black", size = 12))
theme_update(plot.title = element_text(family = "Trade Gothic LT Std Bold No. 2", hjust = 0.5, size = 14))
theme_update(plot.caption = element_text(hjust = 0.5, size = 10, color = "grey40"))
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 13, color = '#651D32'))


ggplot(data = SPU_mag_diff) +
  geom_point(mapping=aes(x=year, y=mag_diff)) +
  geom_smooth(mapping=aes(x=year, y=mag_diff), color = "#651D32", fill = "#C7AF7F",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences<b>",
    subtitle = "<b>Seattle Pacific University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

ggplot(data = SPU_smsd) +
  geom_point(mapping=aes(x=year, y=smsd)) +
  geom_smooth(mapping=aes(x=year, y=smsd), color = "#651D32", fill = "#C7AF7F",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences (Sqrt-Mean) <b>",
    subtitle = "<b>Seattle Pacific University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

#University of Washinton
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 13, color = '#4b2e83'))

ggplot(data = UW_mag_diff) +
  geom_point(mapping=aes(x=year, y=mag_diff)) +
  geom_smooth(mapping=aes(x=year, y=mag_diff), color = "#4b2e83", fill = "#b7a57a",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences<b>",
    subtitle = "<b>University of Washington</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

UW_smsd <- four_year_md_smsd %>%
  filter(inst_name == "University of Washington-Seattle Campus")

ggplot(data = UW_smsd) +
  geom_point(mapping=aes(x=year, y=smsd)) +
  geom_smooth(mapping=aes(x=year, y=smsd), color = "#4b2e83", fill = "#b7a57a",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences (Sqrt-Mean) <b>",
    subtitle = "<b>University of Washington</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

#Harvard University
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 13, color = '#A41034'))
Harv_mag_diff <- four_year_md_smsd %>%
  filter(inst_name == "Harvard University")
Harv_smsd <- four_year_md_smsd %>%
  filter(inst_name == "Harvard University")

ggplot(data = Harv_mag_diff) +
  geom_point(mapping=aes(x=year, y=mag_diff)) +
  geom_smooth(mapping=aes(x=year, y=mag_diff), color = "#A41034", fill = "#B6B6B6",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences<b>",
    subtitle = "<b>Harvard University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

ggplot(data = Harv_smsd) +
  geom_point(mapping=aes(x=year, y=smsd)) +
  geom_smooth(mapping=aes(x=year, y=smsd), color = "#A41034", fill = "#B6B6B6",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences (Sqrt-Mean) <b>",
    subtitle = "<b>Havard University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

#Yale
theme_update(plot.subtitle = element_text(hjust = 0.5, size = 13, color = '#01356A'))
Yale_mag_diff <- four_year_md_smsd %>%
  filter(inst_name == "Yale University")
Yale_smsd <- four_year_md_smsd %>%
  filter(inst_name == "Yale University")

ggplot(data = Yale_mag_diff) +
  geom_point(mapping=aes(x=year, y=mag_diff)) +
  geom_smooth(mapping=aes(x=year, y=mag_diff), color = "#01356A", fill = "#DDDDDD",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences<b>",
    subtitle = "<b>Yale University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())

ggplot(data = Yale_smsd) +
  geom_point(mapping=aes(x=year, y=smsd)) +
  geom_smooth(mapping=aes(x=year, y=smsd), color = "#01356A", fill = "#DDDDDD",method = 'lm') +
  labs(
    title = "<b>Total Magnitudes of Racial Representative Differences (Sqrt-Mean) <b>",
    subtitle = "<b>Yale University</b>",
    caption = "<i>Total Magnitude measured by taking sum of all absolute values of <br>
    differences <b>(College Percent - Market Percent) </b>of racial and ethnic groupings<br> 
    in the data.</i>",
    x = "<b>Years</b>", 
    y= "<b>Total Magnitued</b>") +
  scale_x_continuous(breaks=seq(2009,2017,by=1))+
  theme(plot.title = element_markdown(),
        plot.subtitle = element_markdown(),
        plot.caption =  element_markdown(),
        axis.title.y = element_markdown(),
        axis.title.x = element_markdown())



