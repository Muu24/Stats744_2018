library(networkD3)
##George Boole , Geoffrey Hinton, Andrew Ng and Ethel Lilian Voynich
##https://zhuanlan.zhihu.com/p/22405961
source<-c(0,0,0,0,1,6,8,8,8,9,10,6)
target<-c(2,3,4,5,5,7,9,9,7,10,0,11)
value<-rep(1,length(source))
Links<-data.frame(source,target,value)
name<-c("Geoffrey_Hinton(UT,Google)","Andrew_Ng(Standford,Baidu,Coursera)","Yann_LeCun(Facebook)","Bredan_Frey(UT,Deep_Genomics)",
        "Radford_M_Neal(UT)","ILya_Sutskever(DNNresearch,Google_brain,Open_AI)","George_Boole(Boole Algebra)","Mary Ellen",
        "Charles Howard Hinton(Novelist)","George Hinton","Howard Everest Hinton","Ethel Lilian Voynich (Author of The Gadfly)")
group<-c(0:11)
size<-rep(1,length(name))
Nodes<-data.frame(name,group,size)

forceNetwork(Links = Links, Nodes = Nodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 1, fontSize = 16 , arrows = TRUE,
             zoom = TRUE, legend = TRUE)

