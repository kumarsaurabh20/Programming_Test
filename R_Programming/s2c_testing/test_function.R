#make a new table with the cell count and different probe normalization and calculate for individual probes. Need to create two functions. One which takes the two tables with cell count data enveloping a function for calculating multiple linear regression taking indidual rows from two tables, making a new table along with cells data and the performing regression and returning theta values/reression equation.

#take transpose of two tables

#cell count data

#created a list having different data frames for individual probes. Now just put each member of the list to a lm() function and returned theta values must be put in the equation and multiply and get the actual cell count.

#finally return a data.frame with probe names and cell counts


calCellCount <- function(probe, columns, cells, probeList, intValues) {

     predictValues <- cbind(probeList, intValues)
     listModels <- getFitCoefs(probe, columns, cells)

     apply(predictValues, 2, function(x) {
           for(i in c(1:nrow(tab1))) {
              if (x[i] == tab2[i,1]) {print(x[i]); next;} 
              }
           })




}



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
  tab.norm.2 <- matrix(0, row,col)
  tab.norm.3 <- matrix(0, row,col)
  tab.norm.4 <- matrix(0, row,col)
  tab.norm.5 <- matrix(0, row,col)
  tab.norm.5 <- matrix(0, row,col)

  for(i in c(1:ncol(norm.val))) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[1,i])}))}
  for(i in c(1:ncol(norm.val))) {tab.norm.2[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[2,i])}))}
  
 t.tab.norm.1 <- t(tab.norm.1)
 t.tab.norm.2 <- t(tab.norm.2)


 myData <- list()
 for (i in c(1:ncol(t.tab.norm.1))) {myData[[i]] <- cbind(cells, t.tab.norm.1[,i], t.tab.norm.2[,i])}

 calLinMod <- function(x) {
            x <- as.matrix(x)
            if (ncol(x) == 3) {fit <- lm(x[,1] ~ x[,2] + x[,3])}
            if (ncol(x) == 4) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4])}
            if (ncol(x) == 5) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4] + x[,5])}
            return(as.numeric(coef(fit)))
       }

 fitted.coeffs <- lapply(myData, calLinMod)
 coeffs.list <- unlist(fitted.coeffs)
 coeffs.matrix <- matrix(coeffs.list, nrow(columns), length(probe) + 1, byrow = T)
 probe.list <- columns[, 1]
 result.matrix <- cbind(probe.list, coeffs.matrix)

 return(result.matrix)
}


