##passing multiple arguments without knowing number of arguments
#int1 <- 3
#int2 <- 5
#do.call(sum, lapply(ls(pat="^int\\d$"), get))
## [1] 8
## Or use a safer version that will only look for objects located in the 
## environment from which it was called.  
#do.call(sum, lapply(ls(pat="^int\\d$"), get, envir=parent.frame(), inherits=FALSE))
##OR
## sum those arguments whose names match ^int\\d$
#sumint <- function(...) {
#  arg.names <- as.character(match.call()[-1])
#  ix <- grep("^int\\d$", arg.names)
#  do.call("sum", list(...)[ix])}
## test    
#a <- b <- 10
#int3 <- 30
#sumint(a, int3, b, int3, b, pi) # 60
##=============================================



getCoefForNorm <- function(probe, col_1, col_2, col_3, col_4) {
  
  
  
  
  
}

# make sure to convert them in character and numeric vectors
probe <- c('POSITIVE_25_dT','Poly-T-CY5')
col1 <- c('POSITIVE_25_dT', 'Poly-T-CY5', 'EukS_1209_25_dT', 'Test15 (EukS_1209_25dT)','EukS_328_25_dT')
col2 <- c(7.55E+07, 4.51E+08, 4102788.91290624, 3242670.65825, 4564828.4446875)
col3 <- c(5.73E+07, 3.97E+08, 1.68E+07, 1.99E+07, 2.18E+07)
col4 <- c(1.01E+08, 2.39E+08, 2.62E+08, 3.92E+08, 4.40E+08)
col5 <- c(8.87E+07, 3.41E+08, 5.41E+08, 3.73E+08, 6.77E+08)

#prepare a function and call with list of arguments for variables
#do.call(sum, lapply(ls(pat="^pol\\d$"), get, envir=parent.frame(), inherits=FALSE))
list <- ls(pat="^col\\d$")

table <- data.frame(list)
#match the selected probe in the table
newData <- subset(table, col_1 == probe[1], select=c(col_2, col_3, col_4, col_5))
newData2 <- subset(table, col_1 == probe[2], select=c(col_2, col_3, col_4, col_5))

#convert the found row of values from data.frame to numeric
values <- as_numeric(newData)
values2 <- as.numeric(newData2)

#divide each column of the table by the respective probe values and create a new table repat it with different probes.
col <- length(newData)
row <- length(col_1)
tab_norm_1 <- matrix(0, row,col)
for(i in c(1:length(newData))) {tab_norm_1[,i] <- unlist(lapply(table[,i], function(x) {x/newData[i]}))}
tab_norm_2 <- matrix(0, row,col)
for(i in c(1:length(newData))) {tab_norm_2[,i] <- unlist(lapply(table[,i], function(x) {x/newData2[i]}))}
tab_norm_1 
tab_norm_2
#make a new table with the cell count and different probe normalization and calculate for individual probes
#need to create two functions. One which takes the two tables with cell count data enveloping a function for calculating multiple linear regression
#taking indidual rows from two tables, making a new table along with cells data and the performing regression and returning theta values/reression
#equation.

#take transpose of two tables
t_tab_norm_1 <- t(tab)
t_tab_norm_2 <- t(tab_norm_2)
#cell count data
cells <- c(270, 1351, 6757, 27027)
myData <- list()
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- data.frame(cells, t_tab_norm_1[,i], t_tab_norm_2[,i])}
#created a list having different data frames for individual probes. Now just put each member of the list to a lm() function and returned theta
# values must be put in the equation and multiply and get the actual cell count.

#finally return a data.frame with probe names and cell counts

calLinMod <- function(x) {
            x <- as.data.frame(x)
            if (ncol(x) == 3) {fit <- lm(x[,1] ~ x[,2] + x[,3], data=x)}
            if (ncol(x) == 4) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4], data=x)}
            if (ncol(x) == 5) {fit <- lm(x[,1] ~ x[,2] + x[,3] + x[,4] + x[,5], data=x)}
            return(as.numeric(coef(fit)))
}

lapply(myData, calLinMod)





