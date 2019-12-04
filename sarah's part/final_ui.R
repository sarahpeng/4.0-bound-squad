page_one <- tabPanel(
  "First Page",
  titlePanel("2013-2017 Total Children Victims and Fatalities"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "choice",
        label = "Choose Total Vicitms or Fatalities",
        choices = c("2017 Victims" = "X2017_Victims",
                    "2017 Fatalities" = "X2017_Fatalities")
      ),
      
    ),
    mainPanel(
      h3("Total of Children Vicitms and Fatalities (2013-2017)"),
      plotlyOutput("histogram_plot")
  )
)
)

page_two <- tabPanel(
  "Second Page",
  titlePanel(""),
  sidebarLayout(
    sidebarPanel(
      radioButtons(
        inputId = "choice2",
        label = "Choose Total Vicitms or Fatalities",
        choices = c("2013 Victims" = "X2013_Victims",
                    "2013 Fatalities" = "X2013_Fatalities")
      ),
    ),
    mainPanel(
      plotlyOutput("bar_plot2013")
    )
  )
)

my_ui <- navbarPage(
  "Children Fatalities & Victims Data",
  page_one,
  page_two
)


