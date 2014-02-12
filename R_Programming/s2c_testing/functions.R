#Function getPrediction: 
#function accepts two matrix, one is coefficients and other is normalized values of raw intensities.
#it returns a vector of cell counts.
#Author: Kumar Saurabh Singh
#Date: 14 March 2014

#######################################################################################################


getPrediction <- function(results, results2) {
     
match.probes <- match(results2[,1], results[,1])
results.filter <- results[, -1]
results2.filter <- results2[, -1]
results2.filter <- apply(results2.filter,2, function(x) as.numeric(x))
results.filter <- apply(results.filter,2, function(x) as.numeric(x))
results.filter <- convertNa(results.filter)
dummyMatrix <- matrix(1, nrow(results2.filter), 1)
results2.filter <- cbind(dummyMatrix, results2.filter)
new.metrix <- results.filter*results2.filter
cell.counts <- vector()
for (i in c(1:nrow(results2.filter))) { cell.counts[i] <- sum(new.metrix[i,])}

return(cell.counts)
}
