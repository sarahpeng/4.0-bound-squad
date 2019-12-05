# setup
library(dplyr)
library(knitr)
library(htmltools)
library(ggplot2)
library(plotly)
library(tidyverse)
library(R.utlis)

# import data
child_fatalities <- read.csv("finaldata/child-fatalities.csv",
               stringsAsFactors = FALSE)
child_victims <- read.csv("finaldata/child-victims.csv", 
               stringsAsFactors = FALSE)

#combining data 
cvictims <- child_victims %>% 
  group_by(State) %>% 
  select(State, 
         X2013_Victims = X2013.Victims..unique.count.,
         X2014_Victims = X2014.Victims..unique.count.,
         X2015_Victims = X2015.Victims..unique.count.,
         X2016_Victims = X2016.Victims..unique.count.,
         X2017_Victims = X2017.Victims..unique.count.)
cfatalities <- child_fatalities %>% 
  group_by(State) %>% 
  select(State,
         X2013_Fatalities = X2013.Total.Child.Fatalities,
         X2014_Fatalities = X2014.Total.Child.Fatalities,
         X2015_Fatalities = X2015.Total.Child.Fatalities,
         X2016_Fatalities = X2016.Total.Child.Fatalities,
         X2017_Fatalities = X2017.Total.Child.Fatalities)

child_fatalities[53,1] <- "zAll States"
cvictims[53,1] <- "zAll States"

total <- merge(cvictims, cfatalities, by = "State")
#make new column 
total$Total_Victims <- as.numeric(gsub(",", "", total$X2013_Victims)) +
                       as.numeric(gsub(",", "", total$X2014_Victims)) + 
                       as.numeric(gsub(",", "", total$X2015_Victims)) + 
                       as.numeric(gsub(",", "", total$X2016_Victims)) + 
                       as.numeric(gsub(",", "", total$X2017_Victims))

total$Total_Fatalities <- as.numeric(gsub(",", "", total$X2013_Fatalities)) +
                          as.numeric(gsub(",", "", total$X2014_Fatalities)) + 
                          as.numeric(gsub(",", "", total$X2015_Fatalities)) + 
                          as.numeric(gsub(",", "", total$X2016_Fatalities)) + 
                          as.numeric(gsub(",", "", total$X2017_Fatalities))
#dataframe without all states total
total2 <- total[-c(9,40,53), ]

#2013 dataframe
t2013 <- total %>% 
  group_by(State) %>% 
  select(State,
         X2013_Victims, X2013_Fatalities)
#2017 dataframe
t2017 <- total %>% 
  group_by(State) %>% 
  select(State,
         X2017_Victims, X2017_Fatalities)

# make bar chart
#total fatalities vs. victims
library(plotly)
histogram_plot <- plot_ly(total2,
                          x = ~State, y = ~Total_Victims, type = "bar",
                          name = "Total Victims ") %>% 
  add_trace(y = ~Total_Fatalities, name = "Total Fatalities") %>% 
  layout(
    title = "Total of Children Vicitms and Fatalities (2013-2017)",
    xaxis = list(title = "States", tickangle = -45),
    yaxis = list(title = "# of Children"),
    margin = list(b = 100),
    barmode = "stack")
histogram_plot

#2017 fatalities vs. vicitms
bar_plot2017 <- plot_ly(t2017,
                        x = ~State, y = ~X2017_Victims, type = "bar",
                        name = "2017 Victims") %>% 
  add_trace(y = ~X2017_Fatalities, name = "2017 Fatalities") %>% 
  layout(
    title = "2017 Victims vs. Fatalities",
    xaxis = list(title = "States", tickangle = -45),
    yaxis = list(title = "# of Children"),
    margin = list(b = 100),
    barmode = "dodge")
bar_plot2017

#2013 fatalities vs. vicitms
bar_plot2013 <- plot_ly(t2013,
                        x = ~State, y = ~X2013_Victims, type = "bar",
                        name = "2013 Victims") %>% 
  add_trace(y = ~X2013_Fatalities, name = "2013 Fatalities") %>% 
  layout(
    title = "2013 Victims vs. Fatalities",
    xaxis = list(title = "States", tickangle = -45),
    yaxis = list(title = "# of Children"),
    margin = list(b = 100),
    barmode = "dodge")
bar_plot2013
