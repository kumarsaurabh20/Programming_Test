#Binomial distribution: assume that we want to examine 10 people for a disease that 
#has a probability of 0.2 in the population of interest. The number of people
#(out of 10) who are affected denoted as Y, has Binomial(10,0.2) distribution. 
#Let us first simulate five random samples from this distribution(examine 5 groups 
#each with 10 people).

rbinom(5, size=10, prob=0.2)

#Here 5 is the number of random samples. Size is num of Bernoulli trial(here n =10) 
#and prob is the probability of interest (1 out of two binary values)
#Each randomly generated number in the output represents the num of people 
#affected by the disease out of 10 people
#below is the simulation for a disease status for a group of 10 people.
rbinom(10, size=10, prob=0.2) 


#Now suppose we want to know the probability of observing 3 out of 10 people
#affected by the disease: P(X=3). Then we need probability mass function dbinom()

dbinom(3, size=10, prob=0.2)

#We can also create a vector X of the possible values of the X and then use this 
#vector as input to dbinom() function

x <- 0:10
Px <- dbinom(x, size=10, prob=0.2)
round(Px,2)

#Uisng vectors x and Px, we can plot the prob. mass function(pmf)

plot(x, Px, type="h", xlab="Number of Success", ylab="Probability Mass", main="Binomial(10,0.2)")
points(x,Px,pch=16)
abline(h=0,col="gray")

#In the plot() the 1st argument provides the values for a vertical axis. We use the 
#type="h" option to create "histogram like" vertical lines. The points at top are 
#added with the points() function, whose option pch=16 gives filled-in circle. 
#Similar to the plot() function, the first and second arguments provides coordinates 
#to the points. Lastly the gray horizontal line at 0 is added with 
#abline(h=0, col="gray").
#The function points and abline only add points and lines to an existing plot. The 
#cannot be used alone. The abline() can be used to draw a straight line to an 
#exhisting plot. h=2 argument draws a horizontal like 2 units above the x axis. 
#abline(a=-5, b=2) draw a line with intercept -5 and slope of 2. By default abline 
#draw a solid line. We can alter this by using lty=2 and other values (try other values).
abline(h=0, lty=2)

#Now suppose that we are interested in the probability of observing three or fewer 
#affected people in a group of 10. We could ofcourse sum the values of pmf: 
#P(Y<=3) = P(Y=0) + P(Y=1) + P(Y=2) + P(Y=3). However, it is easier to use the 
#cumulative distribution function for a binomial random variable. pbinom(), to 
#obtain the lower tail probability:
pbinom(3, size=10, prob=0.2, lower.tail=TRUE)

#By changing the lowe.tail value to FALSE we can calcuate upper tail probability P(Y>3)
#On the other hand to obtain the 0.879 quantile, we use the qbinom() function

qbinom(0.879, size=10, prob=0.2, lower.tail=TRUE)

#===============================================================================

#Poisson Distribution

#Suppose that on average 4 people visit the hospital each hour. Then we can 
#represents the hourly number of hospital visitation as X~Poisson(4) and simulate 
#12 samples from this distribution
rpois(12,4)

#The randomly generated numbers can be regarded as the number of people visiting the hospital at diff hours. Similar to the rbinom(), the 1st arg is the number of samples, and the remaining argumnet represent the distribution parameter(lambda)
#Suppose that we want to know the prob that six people visit the hospital in an hour, then we would use the prob mass function dpois()

dpois(6,4)

#We can create a plot of the pmf by first creating a vector of possible values and finding their corresponding densities.

#To find the prob of 6 or fewer ppl visitin th ehospital(as opposed to the prob of 6 exact people visit), we need to find the lower tail prob of x=6. for this we use ppois()

ppois(6,4)

#The 0.889 quantile of the distribution is 
qpois(0.889,4)

#====================================================================

#Normal Distribution

#Suppose that BMI in a specific population has a normal distribution with mean of 25 and variance of 16: X~N(25,16). Then we can simulate 5 values from this distribution using rnorm() function:

rnorm(5, mean=25, sd=4)

# Thes enumbers can be regarded as BMI values for 5 randomly selected people from 
#this population. In the rnorm() function, the first parameter is the number of 
#samples, the second parameter is the ean and the third parameter is the standard 
#deviation(not the variance)

# Now let us plot the pdf of the distribution. A normal random variable can take 
#any value form -infinity to +infinity. However according to the 68-95-97.7% rule 
#approx. 99.7 of the values fall with in the interval [13,37] i.e 3 std dev of the 
#mean Therefor the interval [10,40] is wide enough to plot the distribution. 
x <- seq(from =10, to=40, length=100)
#Here vectror x is seq of length 100 from 10 to 40
fx <- dnorm(x, mean=25, sd=4)
plot(x, fx, type="l", xlab="BMI", ylab="Density", main="N(25,16)")

#The dnorm() returns the hight of the density curve at a specific point and 
#requires the parameters of the mean and the std. deviation sd. In the plot() 
#function, we are using type="l", to plot the points as a continuous line.

#Recall that for cont. variables, the prob. of a specific value is alwaz zero. 
#Instead, for continuous variables, we are interested in the prob of observing a 
#value in a given interval. For e.g. the prob of observing a BMI less than or equal 
#to 18.5 is the area under the density curve to the left of 18.5. In R, we find 
#this prob. with the cumulative distribution finction pnorm():

pnorm(18.5, mean=25, sd=4, lower.tail=TRUE)
pnorm(18.5, mean=25, sd=4, lower.tail=FALSE)

#qnorm() returns the quantile for normal distribution. Ex. the 0.05 quantile for he above distribution is 
qnorm(0.05,mean=25,sd=4, lower.tail=T)

#We can find the prob of a BMI between 25 and 30 by subtracting their lower tails 
#prob, P(25<X<=30)=P(X<=30)-P(X<=25)

pnorm(30, mean=25, sd=4) - pnorm(25, mean=25,sd=4)

#We can also create a plot of cdf by using vector x as input to pnorm() function:
Fx <- pnorm(x, mean=25, sd=4)
plot(x, Fx, type="l", xlab="BMI", ylab="Cumulative Probability", main="N(25,16)")
abline(h=0,col="gray")

#For the t-distribution, the function rt(), dt(), pt(), qt() are useful. Please check.











