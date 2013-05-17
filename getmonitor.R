getmonitor <- function(id, directory, summarize = FALSE) {
  
  id <- as.numeric(id)
  dir <- as.character(directory)
  lookf <- as.data.frame(read.csv(file.path(dir, sprintf("%03d.csv", id))))
  if(summarize == TRUE) {print(summary(lookf))}
  return(lookf)
}