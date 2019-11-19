library(dplyr)
library(tidyr)
dataset <- read.csv(file = "./data/children fatalities.csv",
                    stringsAsFactors = FALSE)


# A function that takes in a dataset and returns a list of info about it:


# The highest children fatalities number national wide
# The total number of national figures in four years 
get_summary_info <- function(dataset) {
  ret <- list()
  
  ret$length <- length(dataset)
  
  ret$highest_national_fatalities <- dataset %>% 
    filter(State == "National") %>% 
    gather(National) %>% 
    filter(value != "National") %>%
    filter(value == max(value)) %>% 
    pull(value)
  
  ret$total_national_fatalities_in_4_years <- dataset %>%
    filter(State == "National") %>%
    gather(National) %>% 
    filter(value != "National") %>%
    select(value) %>% 
    mutate(paste0(substr(value,1,2),substr(value,3,5))) %>% 
    mutate(numeric_val = as.numeric(value)) %>%
    sum() %>% 
    pull()
  return (ret)
} 

