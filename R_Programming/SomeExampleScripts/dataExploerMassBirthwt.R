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

#Sample mean is very useful for summary statistics but it is sensitive to very large or 
#very small observations which might be outliers. Sample median is less sensitive to 
#outliers. Mean and median are raerly enough to fully describe a distribution. 
#Sample variance and sample std. deviation. The sum of deviations of values from the 
#mean is alwaz zero. While comparing two samples less std. devaition means the sample is 
#less dispersed as compared to the other sample.
#The Q quantile is the point that is greater than or equal to atleats 100q% of the values 
#and smaller than or equal to atleast 100(1-q)% of the values.
#If the observation is less than Q1-1.5*IQR or greater than Q3+1.5*IQR then that 
#observation is an outlier. Where IQR is the range or difference of Q3 and Q1.
#In data preprocessing just check for the missing values and outliers. It is up to the 
#researcher to decide weather to remove the missing value of impute/guess. Missing data 
#imputation techniques using statistical methods to fill in missing values tend to be 
#very complex. However if done properly they can improve the analysis.
#Data transformation techniques to reduce the influence of extreme values is usually 
#applied. Two of the most common transformation functions are very common for this 
#purpose: Logarithm and Square root. Log function is usally used to transform right 
#skewed variables with positive values. the Sq. root function is used for right skewed 
#count variables.
#Mean and std. dev. are usually get affected by change in units or addition or 
#multiplication of observations with constants. In that case Coefficient of variation 
#is generally used which is std. dev. divided by sample mean. In general CoV is used to 
#compare variables in terms of theor dispersion when the means are substantially 
#different(possibly as result of having different measurement units).
# when observations are multiplied by any scaler positive constand their original 
#means get shifted but CoV doesnt change. Howeve if observations are scaled with some 
#constand and then shifted(addition/subtraction) at the same time, then CoV get affected.

#variable standardization/mean normalization/scaling of features is generally used to 
#scale our observations to be comapred easily. Doing this will change the mean between 
#observation to zero and std. dev to one. It is done bt subtracting the observations 
#with the sample mean and dividing it by sample std. dev.
library(MASS)
data(Pima.tr)
head(Pima.tr)
help(Pima.tr) # to view if any description on data set is available
type.freq <- table(Pima.tr$type)
type.freq
barplot(type.freq, xlab="Type",ylab="Frequency", main="Frequency bar graph of type")
n <- sum(type.freq)
type.rel.freq <- type.freq/n
type.rel.freq
round(type.rel.freq,2)*100
barplot(type.rel.freq, xlab="Type",ylab="Relative Frequency", main="Rel. Frequency bar graph of type")
mean(Pima.tr$npreg)
median(Pima.tr$bmi)
quantile(Pima.tr$bmi, probs=c(0.1,0.25,0.50,0.9))
summary(Pima.tr$bmi)
boxplot(Pima.tr$bmi, ylab="BMI")
boxplot(Pima.tr$bmi, ylab="BMI", horizontal=TRUE)
IQR(Pima.tr$bmi)
var(Pima.tr$bmi)
sd(Pima.tr$bmi)
