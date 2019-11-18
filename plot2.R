
plot_year_admissions_CPS <- function(children){
  
ggplot(data = children) + 
  geom_col(mapping = aes(x = Year, y = Discharges, fill = Indicated.CPS.Reports)) +
  labs(
    title = "", # plot title
    x = "Year", # x-axis label
    y = "Discharged children into foster care", # y-axis label
    color = "Urbanity" # legend label for the "color" property
  )
  
}  

plot_year_admissions_CPS(children)

