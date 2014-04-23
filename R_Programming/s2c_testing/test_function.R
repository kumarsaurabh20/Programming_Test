getFitCoefs <- function(probe, columns, cells) {

norm.val <- matrix(0, length(probe), ncol(columns) - 1)

col.name <- colnames(columns)
col.name <- col.name[-1]
  
  for (i in c(1:length(probe))) {
  norm.val[i,] <- subset(columns, columns[, 1] == probe[i], select = col.name)
  }
  

  column.filter <- columns[, -1]
  col <- ncol(column.filter)
  row <- nrow(column.filter)
  tab.norm.1 <- matrix(0, row,col)
  t.tab.norm.1 <- matrix(0, col,row)
  tab.norm.2 <- matrix(0, row,col)
  t.tab.norm.2 <- matrix(0, col,row)
  tab.norm.3 <- matrix(0, row,col)
  t.tab.norm.3 <- matrix(0, col,row)
  tab.norm.4 <- matrix(0, row,col)
  t.tab.norm.4 <- matrix(0, col,row)
  tab.norm.5 <- matrix(0, row,col)
  t.tab.norm.5 <- matrix(0, col,row)
  tab.norm.6 <- matrix(0, row,col)
  t.tab.norm.6 <- matrix(0, col,row)
  myData <- list()


 if (length(probe) > 1) {
	for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
t.tab.norm.2 <- t(tab.norm.2)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i])}
} else if (length(probe) > 2) {
	for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.3[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[3,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
t.tab.norm.2 <- t(tab.norm.2)
t.tab.norm.3 <- t(tab.norm.3)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i], t.tab.norm.3[,i])}
} else if (length(probe) > 3) {
	for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.3[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[3,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.4[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[4,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
t.tab.norm.2 <- t(tab.norm.2)
t.tab.norm.3 <- t(tab.norm.3)
t.tab.norm.4 <- t(tab.norm.4)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i], t.tab.norm.3[,i], t.tab.norm.4[,i])}
} else if (length(probe) > 4) {
	for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.3[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[3,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.4[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[4,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.5[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[5,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
t.tab.norm.2 <- t(tab.norm.2)
t.tab.norm.3 <- t(tab.norm.3)
t.tab.norm.4 <- t(tab.norm.4)
t.tab.norm.5 <- t(tab.norm.5)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i], t.tab.norm.3[,i], t.tab.norm.4[,i], t.tab.norm.5[,i])}
} else if (length(probe) > 5) {
	for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.3[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[3,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.4[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[4,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.5[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[5,i])}))}
	for(i in c(1:ncol(norm.val))) {tab.norm.6[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[6,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
t.tab.norm.2 <- t(tab.norm.2)
t.tab.norm.3 <- t(tab.norm.3)
t.tab.norm.4 <- t(tab.norm.4)
t.tab.norm.5 <- t(tab.norm.5)
t.tab.norm.6 <- t(tab.norm.6)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i], t.tab.norm.3[,i], t.tab.norm.4[,i], t.tab.norm.5[,i], t.tab.norm.5[,i])}
} else {for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
t.tab.norm.1 <- t(tab.norm.1)
for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i])}
}
  
 calLinMod <- function(x) {
            x <- as.matrix(x)
            if (ncol(x) == 2) {fit <- lm(x[,1] ~ x[,2])}
            if (ncol(x) == 3) {fit <- lm(x[,1] ~ x[,2] + x[,3])}
            if (ncol(x) == 4) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4])}
            if (ncol(x) == 5) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4] + x[,5])}
            if (ncol(x) == 6) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4] + x[,5] + x[,6])}
            if (ncol(x) == 7) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4] + x[,5] + x[,6] + x[,7])}
            return(as.numeric(coef(fit)))
       }

 fitted.coeffs <- lapply(myData, calLinMod)
 coeffs.list <- unlist(fitted.coeffs)
 coeffs.matrix <- matrix(coeffs.list, nrow(columns), length(probe) + 1, byrow = T)
 probe.list <- columns[, 1]
 result.matrix <- cbind(probe.list, coeffs.matrix)

 return(result.matrix)
}








































