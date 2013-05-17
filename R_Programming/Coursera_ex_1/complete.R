complete <- function(directory, id) {
  id <- as.numeric(id)
  dir <- as.character(directory)
  a <- sprintf("%s/%03d.csv", dir, id)
  
  nob <- lapply(a, function(file) {
    file <- as.character(file)
    a <- read.csv(file)
    nrow(na.omit(a))
  })

 data.frame(id=as.integer(id), nobs=as.integer(nob))
}