library(shiny)
library(dplyr)
library(plotly)
library(rsconnect)
library(ggplot2)
library(shinyWidgets)


source("app_ui.R")
source("app_server.R")

shinyApp(ui = my_ui, server = my_server)