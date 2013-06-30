data.qr.decomposition <- function(file) {

file <- as.character(file)  
data <- read.csv(file)
x <- as.numeric(data$X)
y <- as.numeric(data$Y)
plot(x, y)
data.model <- lm(y~x)
print(data.model)
abline(data.model)

}