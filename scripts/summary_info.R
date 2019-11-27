library(dplyr)
library(tidyr)
children_fatalities <- read.csv(file = "./data/children_fatalities.csv",
                                stringsAsFactors = FALSE,
                                fileEncoding = "UTF-8-BOM")

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
    mutate(numeric_val = as.numeric(paste0(substr(value,0,1),substr(value,3,5)))) %>% 
    select(numeric_val) %>% 
    sum()
  
  return (ret)
} 

summary_info <- get_summary_info(children_fatalities)



