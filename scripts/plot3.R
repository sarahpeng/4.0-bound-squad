library(ggplot2)
library(tidyverse)
library(dplyr)
library(leaflet)
library(knitr)
library(plotly)

df <- read.csv("./data/children_fatalities.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")

histogram_plot <- plot_ly(df,
                          x = ~State, y = ~X2016.Total.Child.Fatalities, type = "bar",
                          name = "2016 Child Fatalities"
) %>%
  add_trace(y = ~X2017.Total.Child.Fatalities, name = "2017 Child Fatalities") %>%
  layout(
    xaxis = list(title = "States", tickangle = -45),
    yaxis = list(title = "# of Child Fatalities"),
    margin = list(b = 100),
    barmode = "stack"
  )
histogram_plot