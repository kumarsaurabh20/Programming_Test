#Function filterReplicatesFromGpr() 
#In the .gpr file many replicates of single probes are spotted. This script, retrieves the replicates for individual probes and then perform action to calculate mean signal from a bunch of replicates and returns a list of mean Total signal intensities.
#Author: Kumar Saurabh Singh
#Date: 12 June 2014

#######################################################################################################


filterReplicatesFromGpr <- function(names, totalSignalIntensities) {

 tab <- cbind(Name=names, F633=totalSignalIntensities)
 tab <- as.data.table(tab)
 
 uniqueProbes <- as.vector(tab$Name)
 uniqueProbeVec <- unique(uniqueProbes) 

 meanTSI <- list()
 myData <- list()

 for (i in c(1:nrow(uniqueProbes))) {
    
      myData[[i]] <- subset(tab, uniqueProbeVec[i] == tab[ , 1]) 
     
  } 

 for (j in c(1:length(uniqueProbeVec ))) {

      meanTSI[[j]] <-  sum(myData[[j]][,2])/nrow(myData[[j]]) 

 }

 meanTSI <- unlist(meanTSI)
 nameList <- list()

 for (i in c(1:length(uniqueProbeVec))) { nameList[[uniqueProbeVec[i]]] <- meanTSI[i] }

 return(nameList)

}
