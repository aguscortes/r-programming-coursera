complete <- function(directory, id = 1:332) {
        library(stringr)
        data <- vector()
        
        for (i in id) {
                currentFile <- read.csv(file.path(directory, paste(str_pad(i, 3, "left", "0"), ".csv", sep = "")))
                data <- rbind(data, c(i, sum(complete.cases(currentFile))))
        }
        data
}