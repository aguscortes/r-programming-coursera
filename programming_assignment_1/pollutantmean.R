pollutantmean <- function(directory, pollutant, id = 1:332) {
        library(stringr)
        data <- vector()

        dataPaths <- file.path(directory, paste(str_pad(id, 3, "left", "0"), ".csv", sep = ""))
        
        for (i in dataPaths) {
                currentFile <- read.csv(i)
                data <-  c(data, currentFile[[pollutant]])
        }
        print(mean(data, na.rm=TRUE))
}