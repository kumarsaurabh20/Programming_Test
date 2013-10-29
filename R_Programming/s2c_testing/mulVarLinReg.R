mulVarLinReg <- function(file, alpha, num_iters) {

file <- as.character(file)
alpha <- as.numeric(alpha)
num_iters <- as.numeric(num_iters)

calibMultiData <- read.csv(file)
x1 <- as.numeric(calibMultiData$X1)
x2 <- as.numeric(calibMultiData$X2)
x3 <- as.numeric(calibMultiData$X3)
y <- as.numeric(calibMultiData$Y)
#mX <- cbind(x1,x2)
numOfRows <- length(y)
theta = t(data.matrix(data.frame(theta0=0, theta1=0, theta2=0))) 
thetaRep = data.matrix(data.frame(theta0=rep(0, num_iters), theta1=rep(0, num_iters), theta2=rep(0, num_iters)))

if(length(x3) == 0) { 
  mX <- cbind(x1,x2)
  mean <- cbind(mean(mX[,1]), mean(mX[,2]))
  sd <- cbind(sd(mX[,1]), sd(mX[,2]))
  theta = t(data.matrix(data.frame(theta0=0, theta1=0, theta2=0))) 
  thetaRep = data.matrix(data.frame(theta0=rep(0, num_iters), theta1=rep(0, num_iters), theta2=rep(0, num_iters)))
} else {
  mX <- cbind(x1,x2,x3)
  mean <- cbind(mean(mX[,1]), mean(mX[,2]), mean(mX[,3]))
  sd <- cbind(sd(mX[,1]), sd(mX[,2]), sd(mX[,3]))
  theta = t(data.matrix(data.frame(theta0=0, theta1=0, theta2=0, theta3=0)))
  thetaRep = data.matrix(data.frame(theta0=rep(0, num_iters), theta1=rep(0, num_iters), theta2=rep(0, num_iters), theta3=rep(0, num_iters)))
}


#mean <- cbind(mean(mX[,1]), mean(mX[,2]))
#sd <- cbind(sd(mX[,1]), sd(mX[,2]))
con <- rep(1, length(y))
mX <- (mX - (con %*% mean))/(con %*% sd)
cX <- cbind(x0=rep(1,each=length(y)), mX)


#theta = t(data.matrix(data.frame(theta0=0, theta1=0, theta2=0)))


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
         thetaRep[iter,] = theta
         histSEF[iter] <- SEF(cX,y,theta)
        
         plot(1:num_iters, histSEF, xlab="Number of Iterations", ylab="Minimized Squared error function", main="Gradient Descent Check") 
       }
    output <- list(thetaOriVal=theta, thetaAll=thetaRep, J=histSEF) 
    return(output)
    
    }

 result <- multiGradDesc(cX,y,theta,alpha,num_iters)
 return(result)

}