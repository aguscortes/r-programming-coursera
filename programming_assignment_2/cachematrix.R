## Save in a cache or returns the value of the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) { ## Defined set function to provide values from 
                x <<- y      ## parent environment
                s <<- NULL
        }
        get <- function() x                 ## Defined get function that returns x
        setsolve <- function(sol) s <<- sol ## Defined setsolve that takes sol variable from parent environment
        getsolve <- function() s            ## Defined setsolve that returns s
        
        ## Above functions are rurned into a list object          
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)          
}


## cacheSolve returns a matrix that is the inverse of "x"
## either from the cache or doing the actual math if it doesn't exist.

cacheSolve <- function(x, ...) {
        s <- x$getsolve()       # Assigns to s the result of 
                                # the object method getsolve        
        if(!is.null(s)) {                       # Check if the cache must be used
                message("getting cached data")  # Inform the user
                return(s)
        }
        data <- x$get()                 # assigns the matrix value from the object
        ## Tip by Leonard Greski:
        ## check to see whether matrix is invertible, meaning that
        ## the determinant must be non-zero
        if (det(data == 0)) {
                ## can't invert this matrix, so set the cache to NULL
                ## and return
                message("Determinant is zero: matrix not invertible, setting cache to NULL")
                x$setsolve(NULL)
                return(NULL)
        }
        s <- solve(data, ...)           # Calculates the inverse
        x$setsolve(s)                   # Assigns the values to the object
        s                               # Returns the inverse of the matrix        
}