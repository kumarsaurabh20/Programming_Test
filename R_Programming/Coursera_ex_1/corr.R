corr <- function(directory, threshold = 0) {
  dir <- as.character(directory)
  t <- as.numeric(threshold)
  files <- list.files(dir) 
  count <- mapply(calcor,files,t)
  final <- as.vector(count)
  final <- final[!is.na(final)]
  return(final)
}
         
  calcor <- function(file,t) {
            file <- as.character(file)
            fulldata <- read.csv(file.path("specdata",file))
            datacase <- fulldata[complete.cases(fulldata),]
            z <- as.numeric(nrow(datacase))
            if(z > t) {
            cordataresult <- cor(as.vector(datacase[,2]), as.vector(datacase[,3]))
            return(cordataresult)
            } else {return(NA)}
    }  