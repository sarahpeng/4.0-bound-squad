library(ggplot2)
library(tidyverse)
library(dplyr)
library(leaflet)
library(knitr)
library(plotly)

children <- read.csv("children.csv", stringsAsFactors = FALSE)

plot_years_vs_admissions <- function(children) {
  
ggplot(data = children, mapping = aes(x = Year, y = Admissions)) + 
  geom_point() +
  labs(
    title = "Admitted children into foster care by Year", # plot title
    x = "Admitted children into foster care", # x-axis label
    y = "County", # y-axis label
    color = "Urbanity" # legend label for the "color" property
  ) +
  
  geom_smooth()
}

plot_years_vs_admissions(children)
#downward trend of foster kids
