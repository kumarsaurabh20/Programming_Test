#Function getIntNormValues: 
#takes raw intensities from the input file and depending on the selected probe, it will normalize the raw intesities
# and return a matrix with columns carrying probe names and normalized values for prediction 
#Author: Kumar Saurabh Singh
#Date: 14 March 2014

#######################################################################################################


getIntNormValues <- function(probe, columns) {

  #create empty matrix to carry control probe intensity.
  norm.val <- matrix(0, length(probe), ncol(columns) - 1)

  #removing probe names and selecting values of control probes
  col.name <- colnames(columns)
  col.name <- col.name[-1]  
  for (i in c(1:length(probe))) {
  norm.val[i,] <- subset(columns, columns[, 1] == probe[i], select = col.name)
  }

  #copy the signal intensities to other column depending in number of normalizing probes
  length <- length(probe) - 1
  for (i in 1:length) { columns <- cbind(columns, columns[,2])}
  
  #normalize each column by dividing all probe intensity with individual control probe intensity 
  column.filter <- columns[, -1]
  col <- ncol(column.filter)
  row <- nrow(column.filter)
  tab.norm.1 <- matrix(0, row,col)
  
  for(i in c(1:col)) {tab.norm.1[,i] <- unlist(lapply(as.numeric(column.filter[,i]), function(x) {x/as.numeric(norm.val[i,1])}))}

  #create a new matrix by combining probe list to the normalized values.
  table.norm <- cbind(columns[,1], tab.norm.1)
  
  #return the newly created table
  return(table.norm)


}
