page_one <- tabPanel( 
  "Introduction",
  h1(strong("Overview")),img(src='kids.jpeg', align = "right"),
  tags$head(tags$style('body {color:purple;}')),
  h4("Our project’s goal is to analyze children fatalities and victims through the foster system,
    specifically in the state of New York. We will be working with the Child Victim and Fatalities 
    data in the U.S. obtained through the healthdata website which publishes a large amount of 
    information containing state-level counts, percentages, and rates for select findings from the 
    National Child Abuse and Neglect Data System (NCANDS)."),
  h1(strong("Audiences")),
  h4("Our targeted audience will be social workers, parents and the general society. 
  We anticipate the public to be more aware of the number of child fatalities and victims 
  that can be linked to the foster system. We hope that our insights will bring to public 
  light the link between children in foster care and the number of child fatalities annually. 
  This data may help people thinking about putting their unborn children in foster care or 
  at least understand the possible consequences associated with foster care."
  ), 
)
data <- read.csv("finaldata/child-fatalities.csv", stringsAsFactors = FALSE)
# import data
child_fatalities <- read.csv("finaldata/child-fatalities.csv",
                             stringsAsFactors = FALSE)
child_victims <- read.csv("finaldata/child-victims.csv", 
                          stringsAsFactors = FALSE)

#combining data 
cvictims <- child_victims %>% 
  group_by(State) %>% 
  select(State, 
         X2013_Victims = X2013.Victims..unique.count.,
         X2014_Victims = X2014.Victims..unique.count.,
         X2015_Victims = X2015.Victims..unique.count.,
         X2016_Victims = X2016.Victims..unique.count.,
         X2017_Victims = X2017.Victims..unique.count.)
cfatalities <- child_fatalities %>% 
  group_by(State) %>% 
  select(State,
         X2013_Fatalities = X2013.Total.Child.Fatalities,
         X2014_Fatalities = X2014.Total.Child.Fatalities,
         X2015_Fatalities = X2015.Total.Child.Fatalities,
         X2016_Fatalities = X2016.Total.Child.Fatalities,
         X2017_Fatalities = X2017.Total.Child.Fatalities)

child_fatalities[53,1] <- "zAll States"
cvictims[53,1] <- "zAll States"

total <- merge(cvictims, cfatalities, by = "State")
#make new column 
total$Total_Victims <- as.numeric(gsub(",", "", total$X2013_Victims)) +
  as.numeric(gsub(",", "", total$X2014_Victims)) + 
  as.numeric(gsub(",", "", total$X2015_Victims)) + 
  as.numeric(gsub(",", "", total$X2016_Victims)) + 
  as.numeric(gsub(",", "", total$X2017_Victims))

total$Total_Fatalities <- as.numeric(gsub(",", "", total$X2013_Fatalities)) +
  as.numeric(gsub(",", "", total$X2014_Fatalities)) + 
  as.numeric(gsub(",", "", total$X2015_Fatalities)) + 
  as.numeric(gsub(",", "", total$X2016_Fatalities)) + 
  as.numeric(gsub(",", "", total$X2017_Fatalities))
#dataframe without all states total

#2013 dataframe
t2013 <- total %>% 
  group_by(State) %>% 
  select(State,
         X2013_Victims, X2013_Fatalities)
#2017 dataframe
t2017 <- total %>% 
  group_by(State) %>% 
  select(State,
         X2017_Victims, X2017_Fatalities)
  
    page_four <- tabPanel(
      "Children Fatalities",
      titlePanel("Total Child Fatalities in a chosen year"),
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
    page_three <- tabPanel(
      "2017 Stats",
      titlePanel("Total Children Victims and Fatalities in 2017"),
      
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
          plotlyOutput("histogram_plot")
        )
      )
    )
    
    page_two <- tabPanel(
      "2013 Stats",
      titlePanel("Total Children Victims and Fatalities in 2013"),
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
    
    children <- read.csv("finaldata/children.csv", stringsAsFactors = FALSE)
    
    children_1 <- children %>% 
      group_by(County) %>% 
      mutate(CPS = Indicated.CPS.Reports, Admissions = Admissions, Year = Year, Discharges = Discharges) %>% 
      select(County, Year, CPS, Admissions, Discharges) 
    
    page_five <- tabPanel("Foster Care",
                       titlePanel("Admitted children into Foster Care vs. Indicated CPS Reports in NY"),
                       sidebarLayout(
                         sidebarPanel(
                           selectInput(
                             inputId = "stats_NY",
                             label = "County",
                             choices = c("CPS","Admissions", "Discharges"),
                           ),
                         ),
                         mainPanel(
                           plotlyOutput("plot_NY")
                         )
                       ))
    
  page_six <- tabPanel(
    "Conclusion",
    h1(strong("Summary")),
    h3(strong("Children Fatalities and Victims")),
    h5("The 2013 Stats and 2017 Stats tab shows the 2013 and 2017 Children Victims or Fatalities. This allows user to 
        input a either Victims or Fatalities to see the number of victims and fatalities total in each state 
        from 2013 or 2017. The user can check the number of victims vs. fatalities 
        in either year 2013 or 2017 between states and observe the difference."),
    h3(strong("Children Deaths by state each year")),
    h5("The Children Fatalities tab shows the Total Children Fatalities by State in a chosen year is used to 
       look at individual years from the dataset and view each state’s percentage of overall child deaths 
       in the total dataset.This helps the viewer not only analyze the trend of growth or shrinkage as years  
       increase but also visualizes top states where this issue is most impactful, in this case being 
       Texas every year in a positive growing trend."),
    h3(strong("Children Admitted to Foster Care vs. Child Protective Services by County")),
    h5("The Admitted children into Foster Care vs. Indicated CPS Reports in NY tab, is located
    on Foster Care tab, and can be utilized to view the amount of kids put into foster care,
    annually, and comparing this number with the total amount of reports filed with the
    Children’s Protective Services. This gives insight to the correlation between for CPS 
    reports and the total amount of children in foster care, who are the most vulnerable to such acts."
       )
  )
    my_ui <- navbarPage(
      theme = shinytheme("sandstone"),
      
      "Children Mortaliity Rates in Foster Care System", 
      page_one,         
      page_two,
      page_three,
      page_four,
      page_five,
      page_six
    )
