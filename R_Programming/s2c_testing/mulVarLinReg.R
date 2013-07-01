calibMultiData <- read.csv(file)
x1 <- as.numeric(calibMultiData$X1)
x2 <- as.numeric(calibMultiData$X2)
y <- as.numeric(calibMultiData$Y)

cX <- cbind(x1,x2)

frame1 <- data.frame(d0=rep(1,each=length(y)),d1=mX, d2=y)
mX <- data.matrix(frame1)

numOfRows <- length(y)

theta = data.matrix(data.frame(theta0=0, theta1=0, theta2=0))

