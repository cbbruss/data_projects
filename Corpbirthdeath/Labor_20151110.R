data = read.csv("bls_data.csv",header=TRUE)
deaths = data[,4]
deathrate = data[,4]/91
births = data[,3]
birthrate = data[,3]/91

library(ggplot2)
m <- ggplot(data, aes(x=Deaths))
m + geom_histogram(aes(fill = ..count..),binwidth=5)

qs = c()
for (i in 1:nrow(data)){
  qs=c(qs,paste(data[i,2],data[i,1],sep="-"))
}

p<-ggplot(data,aes(1:41))+geom_line(aes(y=Deaths,colour="red"),size=1.5)+geom_line(aes(y=Births,colour="blue"),size=1.5)
p<-p+xlab("Date")
p<-p+ylab("Number per Quarter")
p<-p+scale_x_discrete(breaks=c(1,6,12,18,24,30,36,41),labels=qs[c(1,6,12,18,24,30,36,41)])
p<-p+scale_colour_discrete(name  ="Legend",labels=c("New Businesses", "Business Deaths"))
p<-p+theme(axis.title=element_text(size=14,family="Lato"),legend.text=element_text(size=14,family="Lato")
        ,legend.title=element_text(size=16,family="Lato")
        ,axis.title.y=element_text(vjust=1.5))
p <- p + theme(
  panel.background = element_rect(fill = "transparent",colour = NA), # or theme_blank()
  panel.grid.minor = element_blank(), 
  panel.grid.major = element_blank(),
  plot.background = element_rect(fill = "transparent",colour = NA)
)
p
