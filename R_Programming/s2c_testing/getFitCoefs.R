#Function getFitCoefs: 
#take inputs from calibration data, uploaded by the user and returns a matrix of sleected probe names and their linear
# regression coefficients. 
#Author: Kumar Saurabh Singh
#Date: 14 March 2014

#######################################################################################################


getFitCoefs <- function(probe, columns, cells) {

columns <- matrix(0, length(probes), count)

     for (i in c(1:count)) {
         if (i == 1) { columns <- cbind(get(paste0("col",i))) } 
         else { columns <- cbind(columns, get(paste0("col",i))) }    
         }
     
	norm_val <- matrix(0, length(norm_probes), ncol(columns) - 1)

        for (i in 1:length(norm_probes)) {
        dummy <- columns[norm_probes[i] == columns[,1]]
        print(dummy)
        dummy <- dummy[-1]
        norm_val[i,] <- dummy
        }

  column_filter <- columns[, -1]
  col <- ncol(column_filter)
  row <- nrow(column_filter)
  tab_norm_1 <- matrix(0, row,col)
  t_tab_norm_1 <- matrix(0, col,row)
  tab_norm_2 <- matrix(0, row,col)
  t_tab_norm_2 <- matrix(0, col,row)
  tab_norm_3 <- matrix(0, row,col)
  t_tab_norm_3 <- matrix(0, col,row)
  tab_norm_4 <- matrix(0, row,col)
  t_tab_norm_4 <- matrix(0, col,row)
  tab_norm_5 <- matrix(0, row,col)
  t_tab_norm_5 <- matrix(0, col,row)
  tab_norm_6 <- matrix(0, row,col)
  t_tab_norm_6 <- matrix(0, col,row)
  myData <- list()


  if (length(norm_probes) == 2) {
	for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_2[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[2,i])}))}
t_tab_norm.1 <- t(tab_norm_1)
t_tab_norm_2 <- t(tab_norm_2)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i], t_tab_norm_2[,i])}
} else if (length(norm_probes) == 3) {
	for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_2[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[2,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_3[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[3,i])}))}
t_tab_norm_1 <- t(tab_norm_1)
t_tab_norm_2 <- t(tab_norm_2)
t_tab_norm_3 <- t(tab_norm_3)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i], t_tab_norm_2[,i], t_tab_norm_3[,i])}
} else if (length(norm_probes) == 4) {
	for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_2[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[2,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_3[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[3,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_4[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[4,i])}))}
t_tab_norm_1 <- t(tab_norm_1)
t_tab_norm_2 <- t(tab_norm_2)
t_tab_norm_3 <- t(tab_norm_3)
t_tab_norm_4 <- t(tab_norm_4)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i], t_tab_norm_2[,i], t_tab_norm_3[,i], t_tab_norm_4[,i])}
} else if (length(norm_probes) == 5) {
	for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_2[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[2,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_3[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[3,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_4[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[4,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_5[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[5,i])}))}
t_tab_norm_1 <- t(tab_norm_1)
t_tab_norm_2 <- t(tab_norm_2)
t_tab_norm_3 <- t(tab_norm_3)
t_tab_norm_4 <- t(tab_norm_4)
t_tab_norm_5 <- t(tab_norm_5)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i], t_tab_norm_2[,i], t_tab_norm_3[,i], t_tab_norm_4[,i], t_tab_norm_5[,i])}
} else if (length(norm_probes) == 6) {
	for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_2[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[2,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_3[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[3,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_4[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[4,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_5[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[5,i])}))}
	for(i in c(1:ncol(norm_val))) {tab_norm_6[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[6,i])}))}
t_tab_norm_1 <- t(tab_norm_1)
t_tab_norm_2 <- t(tab_norm_2)
t_tab_norm_3 <- t(tab_norm_3)
t_tab_norm_4 <- t(tab_norm_4)
t_tab_norm_5 <- t(tab_norm_5)
t_tab_norm_6 <- t(tab_norm_6)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i], t_tab_norm_2[,i], t_tab_norm_3[,i], t_tab_norm_4[,i], t_tab_norm_5[,i], t_tab_norm_5[,i])}
} else {for(i in c(1:ncol(norm_val))) {tab_norm_1[,i] <- unlist(lapply(as.numeric(column_filter[,i]), function(x) {x/as.numeric(norm_val[1,i])}))}
t_tab_norm_1 <- t(tab_norm_1)
for (i in c(1:ncol(t_tab_norm_1))) {myData[[i]] <- cbind(cells, t_tab_norm_1[,i])}
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

 fitted_coeffs <- sapply(myData, calLinMod)
 coeffs_matrix <- matrix(fitted_coeffs, nrow(columns), length(norm_probes) + 1, byrow = T)
 probe_list <- columns[, 1]
 result_matrix <- cbind(probe_list, coeffs_matrix)

 return(result_matrix)
}








































