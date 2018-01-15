library(ggplot2)
#library(readr)
#library(dplyr)
library(tidyverse)
#cdat<-read_csv()
#print()
x<-c(rnorm(120,30,20))
y<-c(x*5+rnorm(120,30,100))
z<-c(rep(40,1),rep(40,2),rep(40,3))
cdat<-as.data.frame(cbind(x,y,z))
gg0<-ggplot(cdat,aes(x=x,y=y))+geom_point()
gg0
print(gg0)
print(gg0+geom_smooth(method='loess')
         +geom_smooth(method = "lm",col='red'))

##cut_number, cut numerical into categorical
#cdat <-mutate(cdat,f_age=cut_number(age,3))

gg1<-ggplot(cdat,aes(x=x,y=y,colour~z))+geom_point((aes(shape=z)),size=4)
gg1

##
cdat<-read_csv("Carbohydrate_diet.csv")
head(as.data.frame(cdat))
cdat <-mutate(cdat,f_age=cut_number(age,3))
gg1<-ggplot(cdat,aes(x=weight,y=carbohydrate,colour=f_age))+geom_point((aes(shape=f_age)),size=4)

gg1+geom_smooth(method="lm")+facet_wrap(~f_age)

gg2<-ggplot(cdat,aes(f_age,carbohydrate))+geom_boxplot()
gg2+geom_point(alpha=0.3)

##
library(mlmRev)
gg0<-ggplot((Contraception),aes(age,use))+geom_point()
gg0
gg0+geom_jitter()
gg0+stat_sum()

##
(as_data_frame(Contraception)
%>% group_by(age,urban)
%>% summarise(prop=mean(as.numeric(use)-1),
  n=n(),
  se=sqrt(prop*(1-prop)/n))
)->contr_sum
contr_sum %>% group_vars()
contr_sum %>% group_by(n,add=FALSE) %>%group_vars

(ggplot(contr_sum,aes(age,prop,colour=urban))+geom_point(aes(size=n))
+geom_linerange(aes(ymin=prop-se,ymax=prop+se))
+scale_color_brewer(palette = "Dark2"))

