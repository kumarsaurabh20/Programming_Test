#Function selectProbeFromList: 
#From the long list of probes, requires prediction, from the input file, this function will retrieve only those probes for
#which calibration has been performed.
#Author: Kumar Saurabh Singh
#Date: 14 March 2014

#######################################################################################################
 
selectProbeFromList <- function(results, results2) {

commonProbesInTwoResults <- intersect(results[,1], results2[,1])

selectedProbesFromGpr <- matrix(0, length(commonProbesInTwoResults), ncol(results2))
  
  for (i in c(1:length(commonProbesInTwoResults))) {
  selectedProbesFromGpr[i,] <- subset(results2, commonProbesInTwoResults[i] == results2[ , 1])
  }

return(selectedProbesFromGpr[,-1])

}
