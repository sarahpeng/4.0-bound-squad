library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
library(ggplot2)
library(knitr)
library(htmltools)
library(tidyverse)
library(shinythemes)



source("app_ui_final.R")
source("app_server_final.R")

shinyApp(ui = my_ui, server = my_server)