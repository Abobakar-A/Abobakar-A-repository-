library(readxl)
library(tidyverse)
library(lubridate)
library(here)
library(dplyr)
 covid_death <- read_xlsx(here("CovidDeaths.xlsx"))
covid_vacci <- read_xlsx(here("CovidVaccinations.xlsx"))
covid_death %>% 
  select(location,date,total_cases,total_deaths,population) %>% 
mutate(death_per=(total_deaths/total_cases)*100) %>%
  filter(location=="Africa") %>% 
view()
# show how percent of population go covid---
covid_death %>% 
  select(location,date,total_cases,total_deaths,population) %>% 
  mutate(death_per=(total_deaths/population)*100) %>%
  filter(location=="Africa") %>% 
  view()
#looking at the country with the height est infection rate compare to population-----

covid_death %>% 
  select(location,total_cases,total_deaths,population) %>% 
  mutate(death_per= (total_deaths/total_cases)*100) %>% 
  group_by(total_deaths) %>%
  summarise(sum(total_deaths, na.rm = "TRUE")) %>% 
  arrange(total_deaths) %>% 
  view()
covid_death %>% mutate_all(~na_if(trimws(.),"")) %>% 
view() %>% 
write.csv(covid_death,"C:/Users/adnan/OneDrive/Desktop/c2019/data/ccccc/covid_death.csv",row.names = FALSE,na="")%>%
 view()

