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
ggplot(Bl, aes(x = Dil, y = Cq)) + geom_point() + geom_smooth(method='loess', color="blue") +xlab("Dilution")+ylab("Cq Value")
fit <- lm(Bl$Cq~log(Bl$Dil)) #code for a logistic regression of fit
summary(fit) #spits out the results

#eDNA standards plot
ggplot(eDNA, aes(x = Dil, y = Cq)) + geom_point() + geom_smooth(method='loess', color="blue") +xlab("Dilution")+ylab("Cq Value")
fit <- lm(Bl$Cq~log(Bl$Dil)) #code for a logistic regression of fit
summary(fit) #spits out the results
