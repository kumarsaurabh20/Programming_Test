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

#In the plot() the 1st argument provides the values for a vertical axis. We use the type="h" option to create "histogram like" vertical lines.



