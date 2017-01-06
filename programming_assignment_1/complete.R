complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        library(stringr)
        data <- vector()
        
        for (i in id) {
                currentFile <- read.csv(file.path(directory, paste(str_pad(i, 3, "left", "0"), ".csv", sep = "")))
                data <- rbind(data, c(i, sum(complete.cases(currentFile))))
        }
        data
}