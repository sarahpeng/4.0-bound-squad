library(dplyr)
children_fatalities <- read.csv(file = "./data/children_fatalities.csv",
                    stringsAsFactors = FALSE,
                    fileEncoding = "UTF-8-BOM")

summary_table <-  function(dataset) {
                    
                  table <- dataset %>% 
                  group_by(State) %>%
                  select(State, X2013.Total.Child.Fatalities, X2014.Total.Child.Fatalities,
                         X2015.Total.Child.Fatalities) %>%
                  filter(State != "National") %>% 
                  summarise(year_2013_to_2015 = (sum(as.numeric(X2013.Total.Child.Fatalities))
                                                 + sum(as.numeric(X2014.Total.Child.Fatalities))
                                                 + sum(as.numeric(X2015.Total.Child.Fatalities)))) %>% 
                  arrange(-year_2013_to_2015) %>% 
                  head(7)
                    
                  return(table)            
} 

aggregate_table <- summary_table(children_fatalities)
