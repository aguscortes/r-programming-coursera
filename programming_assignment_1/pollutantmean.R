pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        library(stringr)
        data <- vector()

        dataPaths <- file.path(directory, paste(str_pad(id, 3, "left", "0"), ".csv", sep = ""))
        
        for (i in dataPaths) {
                currentFile <- read.csv(i)
                data <-  c(data, currentFile[[pollutant]])
        }
        print(mean(data, na.rm=TRUE))
}