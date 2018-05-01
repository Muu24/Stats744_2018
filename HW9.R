library(igraph)

dat1<- graph( c("Geoffrey_Hinton(UT,Google)","Andrew_Ng(Standford,Baidu,Coursera)","Yann_LeCun(Facebook)","Bredan_Frey(UT,Deep_Genomics)",
                "Radford_M_Neal(UT)","ILya_Sutskever(DNNresearch,Google_brain,Open_AI)","George_Boole(Boole Algebra)","Mary Ellen",
                "Charles Howard Hinton(Novelist)","George Hinton","Howard Everest Hinton","Ethel Lilian Voynich (Author of The Gadfly)"),
            isolates=c("Geoffrey_Hinton(UT,Google)","Andrew_Ng(Standford,Baidu,Coursera)","George_Boole(Boole Algebra)","Ethel Lilian Voynich (Author of The Gadfly)"))  
plot(dat1, edge.arrow.size=.5, vertex.color="darkred", vertex.size=10,
     vertex.frame.color="gray", vertex.label.color="black",vertex.label.cex=0.7) 
##reproduce hw8 interesting relationships among some big guys

## JD: Visualization is pretty hard to read; balls on names.
