mulVarLinReg <- function(file, alpha, num_iters) {

file <- as.character(file)
alpha <- as.numeric(alpha)
num_iters <- as.numeric(num_iters)

calibMultiData <- read.csv(file)
x1 <- as.numeric(calibMultiData$X1)
x2 <- as.numeric(calibMultiData$X2)
y <- as.numeric(calibMultiData$Y)
mX <- cbind(x1,x2)
numOfRows <- length(y)

mean <- cbind(mean(mX[,1]), mean(mX[,2]))
sd <- cbind(sd(mX[,1]), sd(mX[,2]))
con <- rep(1, length(y))
mX <- (mX - (con %*% mean))/(con %*% sd)
cX <- cbind(x0=rep(1,each=length(y)), mX)


theta = t(data.matrix(data.frame(theta0=0, theta1=0, theta2=0)))


    SEF <- function(cX, y, theta) {  
      m <- length(y)
      J <- 0         
      J <- (1/(2*m)) * t((cX %*% theta) - y) %*% ((cX %*% theta) - y)  
    }

    multiGradDesc <- function(cX, y, theta, alpha, num_iters) {
    histSEF <- rep(0, each=num_iters)  
     m = length(y) 
      
       for(iter in 1:num_iters) {
         
         theta = theta - (alpha/m) * t(t((cX %*% theta) - y) %*% cX)
         histSEF[iter] <- SEF(cX,y,theta)
         print(histSEF)
         plot(1:num_iters, histSEF, xlab="Number of Iterations", ylab="Minimized Squared error function", main="Gradient Descent Check") 
       }
  
    return(theta)
    
    }

 multiGradDesc(cX,y,theta,alpha,num_iters)

}