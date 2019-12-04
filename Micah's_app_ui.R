

data <- read.csv("child-fatalities.csv", stringsAsFactors = FALSE)
  
    page_two <- tabPanel(
      "Children Deaths by State Each Year",
      titlePanel("Use this to look at which state has the most deaths of children in a chosen year"),
      sidebarLayout( 
      sidebarPanel(
        selectInput(inputId = "year",
                  label = "choose a year",
                  choices = c("2013" = "X2013.Total.Child.Fatalities",
                              "2014" = "X2014.Total.Child.Fatalities",
                              "2015" = "X2015.Total.Child.Fatalities",
                              "2016" = "X2016.Total.Child.Fatalities",
                              "2017" = "X2017.Total.Child.Fatalities")
                  ),
      ),
      
      mainPanel(
        plotlyOutput("my_plot")
        )
      )
    )


