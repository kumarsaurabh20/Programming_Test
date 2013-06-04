#data exploration on categorical variables
library(MASS)
birthwt
race <- factor(birthwt$race, levels=c(1,2,3), labels=c("white","african-american","other"), ordered=is.ordered(birthwt$race))
raceFreq <- table(race)
#you can now calculate the relative frquencies/percentiles of individual category just 
#to make sure that the racial make up of our sample is similar to that of the whole US 
#population. Pc=Nc/N{dividing frequencies with total no. of observations}
# p1=96/189=50.8%; p2=26/189=13.8%;p3=67/189=35.4%
#We can now compare this relative frequencies with their corresponding proportion in the 
#US population.
relFreq <- raceFreq/nrow(birthwt)
old=options(digits=1)
relFreq
cbind(relFreq)
#for race the category 1(white), has the highest freq so we say that mode of the variable
#race is 1. For categorical variable mode of the variable is the value with higest frequency

#for categorical variables, bar graphs are simplest way of visualizing data
#Describes the possible values(categories) a categorical variable can take, as well as 
#no. of times each category has been observed in our sample. 
barplot(relFreq, xlab="Races",ylab="Relative Frequency",main="Relative Frequency Bar Graph of Races")
#Categories can also be displayed using pie charts. Though Pie chart fn is not included 
#now in R, lattice package has functions dotchart() and stripchart()
#=============================================================================

#Visualization of numerical data
