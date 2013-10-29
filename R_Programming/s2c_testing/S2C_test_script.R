UniVarLinReg <- function(file, alpha, num_iters) {
 
file <- as.character(file)
alpha <- as.numeric(alpha)
num_iters <- as.numeric(num_iters)
calibData <- read.csv(file)
x <- as.numeric(calibData$X)
y <- as.numeric(calibData$Y)
numOfRows <- length(y)
frame1 <- data.frame(d0=rep(1,each=length(y)), d1=y)
mX <- data.matrix(frame1)
theta = data.matrix(data.frame( theta0=0, theta1=0 ))
thetaRep = data.matrix(data.frame(theta0=rep(0, num_iters), theta1=rep(0, num_iters)))
histSEF <- rep(0, each=num_iters)

    computeLineOfFit <- function(mX, y, theta) {
      
      m <- length(y)
      SEF <- 0
      
          for(i in 1:m) {
          
          SEF <- SEF + (1/(2*m)) * (mX[i,] %*% t(theta) - y[i])^2 
          
        }
      return(SEF)
    }



    gradDescentUniVar <- function(mX,y,theta,alpha,num_iters) {
      
      m <- length(y)
      #histSEF <- t(t(histSEF))
      #thetaHistory <- rep(0, each=num_iters)
      
      for(iter in 1:num_iters) {
        
        init <- 0
        
          for(i in 1:m) {
          
            init <- init + (alpha/m) * (mX[i,] %*% t(theta) - y[i]) * mX[i,]
      
          }
      theta = theta - init
      thetaRep[iter,] = theta
      #print(theta)   
      histSEF[iter] <- computeLineOfFit(mX,y,theta)   
      #thetaHistory[iter] <- theta        
      }
      
      plot(1:num_iters, histSEF, xlab="Number of Iterations", ylab="Minimized Squared error function", main="Gradient Descent Check")  
      output <- list(thetaOriVal=theta, thetaAll=thetaRep, J=histSEF)
      return(output)
    }
 result <- gradDescentUniVar(mX,y,theta,alpha,num_iters) 
 return(result)
}

#Run the script as below to retrieve the values
#a <- UniVarLinReg("array_for_R.txt", 0.01,150)
#b <- unlist(a)
#b[1]
#b[2]
#b[3]
#...
#require(graphics)
#plot(cars)
#(z <- line(cars))
#abline(coef(z))
## Tukey-Anscombe Plot :
#plot(residuals(z) ~ fitted(z), main = deparse(z$call))

#a[[2]]
#theta.values <- a[[2]]
#theta.values.frame <- data.frame(theta.values)
#theta0Values <- theta.values.frame$theta0
#theta1Values <- theta.values.frame$theta1
#a[[2]] <- NULL