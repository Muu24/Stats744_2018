library(readr)
library(tidyverse)
library(directlabels)
#library(readxl)
dd<-read_csv('POCIS_Raw_McCallum.csv')
#aa<-read_excel('Mental Health in Tech Survey (Responses).xlsx')
aa<-read_csv('drugnames.csv')
#install.packages("readxl")
#aa
library(zoo)
#merge(dd,aa[,c(1,3)])
dd[,'SamplerType']<-as_factor(dd[,'SamplerType'])
dd1<-dd %>% mutate(SamplerType=factor(SamplerType),`Sample ID`=factor(`Sample ID`),Site=factor(Site))
#dd1$SamplerType
#dd1$MetCode
dd2<-dd1 %>% gather(key=type, value=concentration, -c(MetCode,SamplerType,`Sample ID`,Site))
dd2$type
dd$ATN
dd$PPN
dd$MTP
view(dd)
dd2$concentration
dd1[c(5:10)]
dd2$concentration
#dd3<-dd2 %>% transmute(type=abbr, category=drugcat)
#dd3<-merge(dd2,aa)
#dd3
aa1<-aa %>% mutate(type=abbr)
aa2<-(aa1 %>% mutate(type=if_else(type=='dm.SRT','dm-SRT',type))
%>% mutate(type=if_else(type=='o.dm.VLF','o-dm-VLF',type))
%>% mutate(type=if_else(type=='n.dm.VLF','n-dm-VLF',type)))
ddmerge <- dd2 %>% left_join(aa2[,c(3,4)])
aa2$type
dd2$type
ddmerge$drugcat
ddmerge1<-ddmerge %>% mutate(type=factor(type),drugcat=factor(drugcat),concentration=concentration+1)
gg0<-ggplot(ddmerge1,aes(x=Site,y=concentration,colour=type, group=type))#+scale_y_log10() 
gg1<-gg0+geom_line()+geom_jitter()+scale_y_log10()+facet_wrap(~drugcat)#+facet_wrap(~Sample ID)
direct.label(gg1)#+scale_color_brewer(palette = 'Dark2')
#library(directlabels)
#direct.label(gg1+scale_color_brewer(palette = 'Dark2'))
#?merge
str(ddmerge1)

###

###neater work 
library(dplyr)
library(tidyr)
library(directlabels)
library(ggplot2)

dd1 <- read.csv("POCIS_Raw_McCallum.csv")
dd2 <- read.csv("drugnames.csv")


head(dd1)

dd <- (dd1
       %>% gather(key=abbr,value=con,-c(MetCode,SamplerType,Sample.ID,Site))
       %>% left_join(dd2)
       %>% mutate(con=con+1)
)

gg <- (ggplot(data=dd,aes(x=Site,y=con,group=abbr,color=abbr))
       + geom_line()
       + facet_wrap(~drugcat)
       + scale_y_log10()
       + geom_point()
)
direct.label(gg)


###
#library(dplyr)
#library(tidyr)
#library(ggplot2)

#dd1 <- read.csv("POCIS_Raw_McCallum.csv")
#dd2 <- read.csv("drugnames.csv")


#head(dd1)

#dd <- (dd1
 #      %>% gather(key=abbr,value=con,-c(MetCode,SamplerType,Sample.ID,Site))
#       %>% left_join(dd2)
#       %>% mutate(Site=factor(Site,levels=c("WWTP","Outfall","Downstream", "Reference")))
#)

#gg <- (ggplot(data=dd,aes(x=Site,y=con,group=abbr,color=abbr))
#       + geom_line()
#       + geom_point(position = position_dodge(width=0.2),aes(shape="circle"))
#       + scale_shape(solid = FALSE,guide=FALSE)
#       + facet_wrap(~drugcat)
#       + scale_y_log10(breaks=c(1,10,100,1000))
#       + theme(axis.text.x = element_text(angle=45))
#)
#direct.label(gg)

