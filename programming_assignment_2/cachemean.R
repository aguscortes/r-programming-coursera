makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) { 
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set,          # gives the name 'set' to the set() function defined above
             get = get,          # gives the name 'get' to the get() function defined above
             setmean = setmean,  # gives the name 'setmean' to the setmean() function defined above
             getmean = getmean)  # gives the name 'getmean' to the getmean() function defined above        
}

cachemean <- function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}