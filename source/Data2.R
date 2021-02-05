#use the following libraries
library(tidyr)
library(dplyr)

# change to match your csv file location
# change to match your csv file location
setwd('D:/MyWorks/Softwares/DataWranglingTest/source')

df <-  read.csv("univstat.csv")

gatherdata <- df%>%gather(term,n, X2011.1:X2018.3)
#View(gatherdata)


seperatedData <- gatherdata%>%separate(term, c("xyear", "sem"))



mutatedData <-seperatedData%>%mutate("year" = substring(xyear, first = 2))

semTransform <- spread(mutatedData, key = "sem", value = "n" )

semTransform %>% group_by(courses)
bsitData = semTransform %>% filter(courses == "BSIT")
abpsychoData = semTransform %>% filter(courses == "AB PSYCHO")
bsptData = semTransform %>% filter(courses == "BSPT")

#graph plot for BSIT
plot(bsitData$year, bsitData$`1`, type = "b", col="red", xlab = "Year", ylab = "Student Population",  yaxs="i", ylim = c(-10,510), main = "BSIT")
lines(bsitData$year, bsitData$`2`, type = "b", col="green")
lines(bsitData$year, bsitData$`3`, type = "b", col="blue")
legend(2018,470, legend = c("1-Sem", "2-Sem", "Summer"), fill = c(fill="red", fill="green", fill="blue"),  border = "black", xjust=1, yjust = 1)


#graph plot for AB PSYCHO
#plot(abpsychoData$year, abpsychoData$`1`, type = "b", col="red", xlab = "Year", ylab = "Student Population",  yaxs="i", ylim = c(-10,145) , main = "AB PSYCHO" )
#lines(abpsychoData$year, abpsychoData$`2`, type = "b", col="green")
#lines(abpsychoData$year, abpsychoData$`3`, type = "b", col="blue")
#legend(2018,130, legend = c("1-Sem", "2-Sem", "Summer"), fill = c(fill="red", fill="green", fill="blue"),  border = "black", xjust=1, yjust = 1)


#graph plot for BSPT
#plot(bsptData$year, bsptData$`1`, type = "b", col="red", xlab = "Year", ylab = "Student Population",  yaxs="i", ylim = c(-10,210) , main = "BSPT" )
#lines(bsptData$year, bsptData$`2`, type = "b", col="green")
#lines(bsptData$year, bsptData$`3`, type = "b", col="blue")
#legend(2018,190, legend = c("1-Sem", "2-Sem", "Summer"), fill = c(fill="red", fill="green", fill="blue"),  border = "black", xjust=1, yjust = 1)
