#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


my_server <- function(input, output) {
  output$my_plot <- renderPlotly(
    plot_ly(
    data = data,
    labels = ~State,
    values = data[[input$year]],
    type = "pie",
    mode = "markers") %>%
    layout(title = 'Percentage each state had of overall deaths in 2014',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE, title = "State"),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE, title = "year of total children fatalities")
  )
)}
