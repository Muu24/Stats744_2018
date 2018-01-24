library(readr)
library(ggplot2)
library(tidyverse)
library(dplyr)
aa<-read.csv('vaccine_data_online.csv')
bb<-(aa %>% mutate(cases =log(cases+1))
     %>% mutate(vaccine=if_else(vaccine==FALSE,FALSE,TRUE)) )
cc<- (bb %>% filter(vaccine==TRUE))
#head(bb[bb$vaccine==TRUE,])
gg0<-ggplot(bb,aes(x=year,y=cases,colour=disease))
gg1<-gg0+geom_line()+facet_wrap(~disease)+geom_vline(data=cc,aes(xintercept = year))
gg1
#library(directlabels)


##I don't know how to use tidy verse to make it. so I just make one of the graph
##Initially, I want to facet all the plots for disease, 
##but I don't know how to modify the data and plot the graph, sorry for just making one graph
cc
dd<-bb %>% filter(disease=='Pertussis') %>% mutate(fyear=if_else(year<1949,'V','NV'))
dd
dd$fyear
###
(dd
  %>% group_by(fyear)
  %>% summarise(fmean=mean(cases),
                se=sd(cases)))->ee
ee
(ggplot(ee,aes(fyear,fmean,colour=fyear))+geom_point()   +geom_linerange(aes(ymin=fmean-se,ymax=fmean+se)))
