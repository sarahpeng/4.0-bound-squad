library(ggplot2)
library(plotly)
library(shiny)
library(dplyr)


source("app_ui.R")

server_final <- function(input, output) {
  
  # output$plot_NY <- renderPlot({
  #   
  #   ggplot(data = children_1) +
  #     geom_bar(mapping = aes(x = children_1[[input$stats_NY]], y = Admissions), stat = "identity") 
  # })
  
  output$plot_NY <- renderPlotly(
                      plot_ly(children_1,
                              x = children_1$County, 
                              y = children_1[[input$stats_NY]], 
                              type = "bar",

                              # everytime plotly grabs the x, it's grabbing the entire column instead of a row.
                              # how to grab one singulary county...
                      name = "CPS") %>%
     # add_trace(y = ~Admissions, name = "Admissions") %>%
    layout(
      title = "Admissions into foster care compared to CPS reports by County",
      xaxis = list(title = "County in NY"),
      yaxis = list(title = ""),
      margin = list(b=100),
      barmode = "group"
    ))
}
