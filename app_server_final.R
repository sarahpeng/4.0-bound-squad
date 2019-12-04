
my_server <- function(input, output) {

  output$my_plot <- renderPlotly({
    plot_ly(
    data = data,
    labels = ~State,
    values = data[[input$year]],
    type = "pie",
    mode = "markers") %>%
    layout(title = 'Percentage each state had of overall deaths in 2014',
           xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE, title = "State"),
           yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE, title = "year of total children fatalities"))
})
  output$histogram_plot <- renderPlotly({
    plot_ly(t2017,
            x = t2017$State,
            y = t2017[[input$choice]], 
            type = "bar",
            name = "2017 Victims") %>% 
      layout(
        title = "2017 Victims vs. Fatalities",
        xaxis = list(title = "States", tickangle = -45),
        yaxis = list(title = "# of Children"),
        margin = list(b = 100),
        barmode = "dodge")
    })
  
  output$bar_plot2013 <- renderPlotly({
    plot_ly(t2013,
            x = t2013$State,
            y = t2013[[input$choice2]], 
            type = "bar",
            name = "2013 Victims") %>% 
      layout(
        title = "2013 Victims vs. Fatalities",
        xaxis = list(title = "States", tickangle = -45),
        yaxis = list(title = "# of Children"),
        margin = list(b = 100),
        barmode = "dodge"
      )
  })
  output$plot_NY <- renderPlotly({
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
      )
  })
}

