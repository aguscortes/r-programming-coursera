corr <- function(directory, threshold = 0) {
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