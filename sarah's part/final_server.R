my_server <- function(input,output) {
  output$histogram_plot <- renderPlotly({
    plot_ly(t2017,
            x = t2017$State,
            y = t2017[[input$choice]], 
            type = "bar",
            name = "2017 Victims") %>% 
            # add_trace(y = ~X2017_Fatalities, name = "2017 Fatalities") %>% 
      layout(
        title = "2017 Victims vs. Fatalities",
        xaxis = list(title = "States", tickangle = -45),
        yaxis = list(title = "# of Children"),
        margin = list(b = 100),
        barmode = "dodge") })
    
  output$bar_plot2013 <- renderPlotly({
      plot_ly(t2013,
              x = t2013$State,
              y = t2013[[input$choice2]], 
              type = "bar",
              name = "2013 Victims") %>% 
              # add_trace(y = ~X2013_Fatalities, name = "2013 Fatalities") %>% 
      layout(
        title = "2013 Victims vs. Fatalities",
        xaxis = list(title = "States", tickangle = -45),
        yaxis = list(title = "# of Children"),
        margin = list(b = 100),
        barmode = "dodge"
      )
  })        
}



