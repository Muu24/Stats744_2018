
#summarize
#contour vs hexbin
#loess vs gam

#high dimensional
#multiway
#hypervariate
library('sos')
library(ggplot2)
library(tidyverse)
findFn('barley')
install.packages('agridat')
library(agridat)
str(fisher.barley)
(gg0<-ggplot(ff,aes(x=gen,y=yield,colour=year,group=year))
#+geom_boxplot(aes(x=gen,y=yield,fill=factor(year)),notch = TRUE)
+geom_point()+geom_line()+facet_wrap(~env,nrow=1))
print(gg0)
ff<-(fisher.barley %>% mutate(gen=reorder(gen,yield),env=reorder(env,yield),year=factor(year)))
str(ff)
library(ggmosaic)
#install.packages('ggmosaic')

library(pgmm)
data("olive")
str(olive)
?olive
library(vcd)
library(readr)
#olive.regions<-read_csv('')
#full_join(olive,olive_regions,by =c('Region'='region_num','Area'='area_num'))
colvec<-c('red','blue','goldenrod')
pairs(olive,gap=0,col=colvec[as.numeric(olive$Region)])
library(GGally)
ggpairs(olive,columns = 1:8,mapping = aes(colour=region))+theme(panel.spacing=grid::unit(0,"lines"))+scale_color_brewer()


library(corrplot)
corrplot(cor(olive[,3:8]))
?corrplot
corrplot.mixed()