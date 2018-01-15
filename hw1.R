library(tidyverse)
library(ggplot2)
##I eat a lot of fast food and Mcdonald is one of my most usually visit restaurant after midnight.
#So I am very interested in how I gain so much weights, so this data set is fairly interesting to me.
##The data set is from Kaggle and some note is available using R and python with plotly.
#The data set contains the menu with all nutrition information officially from Mcdonalds
##Some notes like: https://www.kaggle.com/limitpointinf0/mc-d-nutrition-eda
##As well as from https://github.com/jrauser/writing/blob/master/how_humans_see_data/hhsd_notes.Rmd
#I may reproduce some plots from the note
aa<-read.csv('menu.csv')
##Why if I read_csv('menu.csv'), this consider some categorigal data as char, so I use.function 
#and change into dataframe. 
bb<-as_data_frame(aa)
##data(package = .packages(all.available = TRUE))
str(bb)
##Test whether how much percentage of calories is from fat, what cause us really fat
bb %>% filter(!is.na(Calories.from.Fat)& !is.na(Calories))
##Well the Following Graph tell me that 30 fat contains approximately 250 fat
gg0<-ggplot(bb,aes(x=Calories,y=Saturated.Fat,colour=Category))+geom_point()+facet_wrap(~Category)+ geom_smooth(method='loess')+theme_minimal()
#scale_colour_hue(h = c(270, 360))+
gg0
##
gg1<-ggplot(bb,aes(x=Total.Fat,y=Total.Fat....Daily.Value.,colour=Category))+geom_point()#+geom_smooth(method='loess')+theme_minimal()
gg1
##
gg1<-ggplot(bb, aes(x=Category ,y=Calories, colour = Category)) +geom_boxplot()
gg1
#
print(gg0+geom_smooth(method='loess')
      +geom_smooth(method = "lm",col='red'))
gg2<-ggplot(bb,aes(x=Category,y=Calories.from.Fat))+geom_boxplot(colour=Category)
gg2
##bad graphs
ggplot(bb, aes(Calories , colour = Category)) + geom_freqpoly(binwidth=300)
ggplot(bb, aes(Calories.from.Fat , colour = Category)) + geom_freqpoly(binwidth=300)
##
bb <-mutate(bb,fCalories=cut_number(Calories,5))
ggplot(bb, aes(fCalories , colour = Category)) + geom_freqpoly(binwidth=1)
ggplot(bb, aes(Calories ,y=Cholesterol, colour = Category)) + geom_point()+facet_wrap(~Category)

###
ggplot(bb, aes(x=Cholesterol ,y=Calories, colour = Category)) +geom_boxplot()
##
result <- bb %>% 
  select(Category,Item,Serving.Size,Calories) %>% group_by(Category) %>% filter(Calories == max(Calories))# %>% summarise(Category,Calories)
  #arrange(Category, Item,Calories)
#result <- df %>% 
#  group_by(A, B) %>%
#  filter(value == max(value)) %>%
#  arrange(A,B,C)
result <- bb %>% 
  select(Category,Item,Serving.Size,Calories) %>% group_by(Category) %>% top_n(3)# %>% summarise(Category,Calories)
data.frame(result)
##Some dplyr attempts
bb %>% group_by(Category,Item,Serving.Size) %>%  summarise(Calories == max(Calories)) 
bb %>% group_by(Category,Item,Serving.Size,Calories)
bb %>% group_by(Category,Item,Serving.Size,Calories) %>%  top_n(3)
bb %>% group_by(Category,Item,Serving.Size) %>% slice(which.max(Calories))
bb %>% group_by(Category,Item,Serving.Size) %>%  filter(Calories == max(Calories)) 
##
#bb %>%  summarise_if(is.numeric, funs(max(., na.rm=TRUE)))
#This is very interesting for me that beverage has the least calories, I always think pops makes me fat.
ggplot(bb, aes(x=Category ,y=Cholesterol, colour = Category)) +geom_boxplot()
ggplot(bb, aes(x=Category ,y=Protein, colour = Category)) +geom_boxplot()
ggplot(bb, aes(x=Category ,y=Protein, colour = Category)) +geom_boxplot()
ggplot(bb, aes(x=Category ,y=Saturated.Fat, colour = Category)) +geom_boxplot()
##
ggplot(bb, aes(x=Category ,y=Carbohydrates, colour = Category)) +geom_boxplot()
##Comment:
##I don't quite understand the differences between sugers and carbohydrates, so here we have 
##This plot shows the statement: all sugers are carbohydrates, but not all carbohydrates are sugars...
ggplot(bb, aes(x=Sugars,y=Carbohydrates))+geom_point()+geom_abline(intercept = 0, slope = 1,colour='red')



###
(bb
  %>% group_by(Category,Calories.from.Fat,Calories)
  %>% summarise(prop=mean(Calories.from.Fat/Calories),
                n=n(),
                se=sqrt(prop*(1-prop)/n))
)->cc
(ggplot(cc,aes(Category,prop,colour=Category))+geom_jitter()
    +geom_linerange(aes(ymin=prop-se,ymax=prop+se)))
    #+scale_color_brewer(palette = "Dark2"))#+facet_wrap(~Category))
