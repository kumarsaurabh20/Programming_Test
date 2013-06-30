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
theta = data.matrix(data.frame(theta0=0, theta1=0))
plot(x, y)

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
      
      histSEF <- rep(0, each=num_iters)
      #histSEF <- t(t(histSEF))
      #thetaHistory <- rep(0, each=num_iters)
      
      for(iter in 1:num_iters) {
        
        init <- 0
        
          for(i in 1:m) {
          
            init <- init + (alpha/m) * (mX[i,] %*% t(theta) - y[i]) * mX[i,]
            print(init)
                        
          }
       
      theta = theta - init
      #print(theta)   
      
      histSEF[iter] <- computeLineOfFit(mX,y,theta)   
      #thetaHistory[iter] <- theta
        
      plot(1:num_iters, histSEF, xlab="Number of Iterations", ylab="Minimized Squared error function", main="Gradient Descent Check")  
        
      }
      
      return(theta)
      
    }

 gradDescentUniVar(mX,y,theta,alpha,num_iters)

}