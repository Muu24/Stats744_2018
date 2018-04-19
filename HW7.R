library(leaflet)
m <- leaflet()
dat <- addTiles(m)
##Test Beijing
addMarkers(dat,lng=116.391, lat=39.912, popup="Beijing")

##Test Major cities in China
##https://zh.wikipedia.org/wiki/%E4%B8%AD%E8%8F%AF%E4%BA%BA%E6%B0%91%E5%85%B1%E5%92%8C%E5%9C%8B%E5%9F%8E%E5%B8%82%E4%BA%BA%E5%8F%A3%E6%8E%92%E5%90%8D
dat1 <- read.csv(text = "City,lng,lat,pop
    Beijing,116.4666667,39.9,19612368
               Shanghai,121.4833333,31.23333333,23019196
               Tianjin,117.1833333,39.15,12938693 	
               Chongqing,106.5333333,29.53333333,16044027 	
               Haerbin,126.6833333,45.75,9413359 	
               Changchun,125.3166667,43.86666667,6421956
               Shenyang,123.4,41.83333333,8106171
                Huhehaote,111.8,40.81666667,2866615
                Shijianzhuang,114.4666667,38.03333333,2921433 	
               Taiyuan,112.5666667,37.86666667,4201592
               Jinan,117,36.63333333,1064210
               Zhengzhou,113.7,34.8,8627089 	
               Xian,108.9,34.26666667,8467838 	
               Lanzhou,103.8166667,36.05,3142523 	
               Yinchuan,106.2666667,38.33333333,840869 	
               Xining,101.75,36.63333333,1087192 	
              Wulumuqi,87.6,43.8,1384349 	
               Hefei,117.3,31.85,5702466 	
               Nanjing,118.8333333,32.03333333,8003744
               Hangzhou,120.15,30.23333333,8700373
               Changsha,113,28.18333333,1279469 	
               Nanchang,115.8666667,28.68333333,4331668
               Wuhan,114.35,30.61666667,8312700 
               Chengdu,104.0833333,30.65,11108534 	
               Guiyang,106.7,26.58333333,4322611 	
               Fuzhou,119.3,26.08333333,1660688
               Taibei,121.5166667,25.05,2705000
               Guangzhou,113.25,23.13333333,5630733 	
               Haikou,110.3333333,20.03333333,830192
               Nanning,108.3333333,22.8,2608571
               Kunming,102.6833333,25,1995438
               Lasa,91.16666667,29.66666667,373946
               Hongkong,114.1666667,22.3,7071576
               Macao,113.5,22.2,552503")
addMarkers(dat,lng=dat1$lng,lat=dat1$lat,popup=dat1$City)
##add Populations as circle
dat1%>%leaflet()%>%addTiles()%>%
  addCircleMarkers(lng=~lng,lat=~lat,radius = ~pop/1000000)
#addCircleMarkers(dat,lat=dat1$lat,lng=dat1$lng,radius = dat1$pop)


