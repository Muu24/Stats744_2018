library(tidyverse)
dat1<-(read_csv("vaccine_data_online.csv") %>% select(c(cases,disease,year,event)))
library(highcharter)
hchart(dat1, "line", hcaes(x = year, y = log(cases), group = disease),size=0.05)%>%
  hc_tooltip(pointFormat = "{point.cases} cases of {point.disease} reported in {point.x} <br> event: {point.event}")
# This graphic can be interacted in the way : displaying information
library(plotly)
dat2 <- (dat1
         %>% select(c(cases,disease,year)) 
         %>% mutate(cases=log(cases))
         %>% spread(key=disease,value=cases)
)         
plot_ly(data = dat2, x = ~year)%>%
  add_trace(y = ~Chickenpox, name = 'Chickenpox',type="scatter",mode = 'lines')%>%
  add_trace(y = ~Diphtheria, name = 'Diphtheria', type="scatter",mode = 'lines') %>%
  add_trace(y = ~Measles, name = 'Measles', type="scatter",mode = 'lines') %>%
  add_trace(y = ~Mumps, name = 'Mumps', type="scatter",mode = 'lines') %>%
  add_trace(y = ~Pertussis, name = 'Pertussis', type="scatter",mode = 'lines') %>%
  add_trace(y = ~Polio, name = 'Polio', type="scatter",mode = 'lines') %>%
  add_trace(y = ~Rubella, name = 'Rubella', type="scatter",mode = 'lines') %>%
  layout(yaxis = list(title="log cases"), title="Vaccine data")
# This graphic can be interacted in the way : 
# 1.display information for individual point 
# 2.display information and compare
# 3.zoom in and zoom out

# JD: What do you mean by "compare" above?
