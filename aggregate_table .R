library(dplyr)
dataset <- read.csv(file = "./data/children fatalities.csv",
                    stringsAsFactors = FALSE)

summary_table <- function(dataset) {
                table <- dataset %>% 
                         group_by(State) %>%
                         select(State, X2013.Total.Child.Fatalities, X2014.Total.Child.Fatalities,
                                X2015.Total.Child.Fatalities) %>%
                         summarise(year_2013_to_2015 = sum(X2013.Total.Child.Fatalities) 
                                                       + sum(X2014.Total.Child.Fatalities) 
                                                       + sum(X2015.Total.Child.Fatalities)) %>% 
                         arrange(-year_2013_to_2015) %>% 
                         head(7)
                    
                return(table)            
} 
