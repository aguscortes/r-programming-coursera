complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        data <- vector()
        
        for (i in id) {
                currentFile <- read.csv(file.path(directory, paste(sprintf("%03d",i), ".csv", sep = "")))
                data <- rbind(data, c(i, sum(complete.cases(currentFile))))
        }

        result <- data.frame(data[1,], data[2,])
        cnames <- c("id", "nobs") 
        colnames(result) <- cnames
        result
}