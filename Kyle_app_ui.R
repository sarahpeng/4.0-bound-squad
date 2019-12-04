library(ggplot2)
library(shiny)
library(dplyr)
library(tidyr)
library(plotly)

children <- read.csv("children.csv", stringsAsFactors = FALSE)

children_1 <- children %>% 
  group_by(County) %>% 
  mutate(CPS = Indicated.CPS.Reports, Admissions = Admissions, Year = Year, Discharges = Discharges) %>% 
  select(County, Year, CPS, Admissions, Discharges) 

  
# ui for NY plot

page_1 <- tabPanel("Bar Graph",
                   titlePanel("Admitted children into foster care vs. indicated CPS reports by region"),
                    sidebarLayout(
                      sidebarPanel(
                        selectInput(
                          inputId = "stats_NY",
                          label = "County",
                          choices = c("CPS","Admissions", "Discharges"),
                        ),
                        
                        # selectInput(
                        #   inputId = "year",
                        #   label = "Year",
                        #   choices = unique(children_1$Year),
                        # )
                      ),
                      mainPanel(
                        plotlyOutput("plot_NY")
                      )
                    ))

NY_ui <- navbarPage("Children stats",
                    page_1)