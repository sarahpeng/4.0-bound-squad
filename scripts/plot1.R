library(ggplot2)
library(tidyverse)
library(dplyr)
library(leaflet)
library(knitr)
library(plotly)

children <- read.csv("./data/children.csv", stringsAsFactors = FALSE, fileEncoding = "UTF-8-BOM")

plot_years_vs_admissions <- function(children) {
  
ggplot(data = children, mapping = aes(x = Year, y = Admissions)) + 
  geom_point() +
  labs(
    x = "Admitted children into foster care", # x-axis label
    y = "County", # y-axis label
    color = "Urbanity" # legend label for the "color" property
  ) 
}

plot_years_vs_admissions(children)
#downward trend of foster kids
