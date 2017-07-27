#Cq Standards#
#Tidy up the data and graph them (with a trendline?)

#Read in files
Bl <- read.csv("Blood Standards.csv")
eDNA <-read.csv("+eDNA Standards.csv")

#clean up
names(Bl) <- c("Dil", "Cq", "ng/uL") #Re-name columns
names(eDNA) <- c("Dil", "Cq", "ng/uL")

library(ggplot2)
library(plyr)
library(dplyr)

#Plotting

#plot(Cq~Dil, Bl, xlab="Dilution Factor", ylab="Cq Value",abline(line), col="red", untf=TRUE))

#Blood standards plot
ggplot(Bl, aes(x = Dil, y = Cq)) + geom_point(size=6)+ geom_smooth(method='loess', color="blue", se=F) +xlab("Dilution")+ylab("Cq value")+theme_classic(base_size = 11, base_family = "")+theme(axis.title.x = element_text(size=60),
       axis.text.x  = element_text(vjust=0.5, size=50),
       axis.title.y = element_text(size=60),
       axis.text.y= element_text(vjust=0.5, size=50))
  
  
fit <- lm(Bl$Cq~log(Bl$Dil)) #code for a logistic regression of fit
summary(fit) #spits out the results

#eDNA standards plot
ggplot(eDNA, aes(x = Dil, y = Cq)) + geom_point(size=6) + geom_smooth(method='loess', color="blue",se=F) +xlab("Dilution")+ylab("Cq Value")+theme_classic(base_size = 11, base_family = "")+theme(axis.title.x = element_text(size=60),                                  axis.text.x  = element_text(vjust=0.5, size=50),                                        axis.title.y = element_text(size=60),                                                   axis.text.y= element_text(vjust=0.5, size=50))


fit <- lm(Bl$Cq~log(Bl$Dil)) #code for a logistic regression of fit
summary(fit) #spits out the results


ggplot(Bl, aes(x = Dil, y = Cq)) + geom_point() +stat_smooth(method="loess",formula=y~x,col="blue", se=T)


