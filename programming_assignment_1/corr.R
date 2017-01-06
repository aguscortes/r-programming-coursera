corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0        
        library(stringr)
        data <- vector()
        final <- numeric(0)
        
        dataPaths <- file.path(directory, paste(str_pad(1:332, 3, "left", "0"), ".csv", sep = ""))
        
        for (i in dataPaths) {
                currentFile <- read.csv(i)
                if (sum(complete.cases(currentFile)) > threshold) {
                        currentFile <- currentFile[complete.cases(currentFile),]
                        cor_actual <- cor(currentFile[,2], currentFile[,3]) 
                        final <- c(final, cor_actual)                                                
                }
        }
                
        final
}