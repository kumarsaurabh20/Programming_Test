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
#for numerical data, two most imp things to consider are location and spread. 
#Dotplots can reveal this info. Central tendency will tell the location of data 
#and distribution tells about the overall spread
bwt <- as.numeric(birthwt$bwt)
hist(bwt)
hist(birthwt$lwt, main=paste("Histogram of mothers wieght: ", "lwt"),xlab="Mothers weight",ylab="Weight Frequency",col="blue")
#Histograms are commonly use to visualize numerical variables. A histogram is bargraph 
#after the values of the variable is grouped(binned) in to a finite no. of intervals(bins).
#We treat each interval(bin) as category.
hist(birthwt$lwt, prob=TRUE)
lines(density(birthwt$lwt), col="red")
#height of histogram i.e freq can also be changed in to rel freq. but in histogram 
#instead of rel freq. density of individual graphs is chosen. 
#{Density=rel. freq/width(bin)} so 
#area = height * width | Fc*Wc | Pc/Wc * Wc | Area = Pc i.e area = rel. freq.
#So area of a bar in hist is a rel freq for the corresponding interval.
hist(birthwt$lwt, prob=TRUE)
lines(density(birthwt$lwt), col="red")
#This data set is right skewed i.e lower right tail. Datasets are symmetric if the 
#densities are almost same for intervals that are equally distant from the location.
#most of the histograms like this has one peak i.e. one mode or unimodal. 
#There are situations when we get two peaks that is bimodal histograms. Bimodal appears 
#to be a combination of two unimodal histograms. It indicates that underlying populations
#are not homogenous and may contain two or multiple populations.





