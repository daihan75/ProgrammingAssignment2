## Disclaimer: The comments are modified based on the Instructor's example.
## cachematrix.R contains a pair of functions to cache the Inverse of a Matrix
## 1. makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
## 2. cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.


## The first function, makeCacheMatrix creates a special "matrix", 
## which is really a list containing a function to
## set the matrix set()
## get the matrix get()
## set the inverse setinverse()
## get the inverse getinverse()

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set = function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() x
        setinverse = function(inverse) i <<- inverse 
        getinverse = function() i
        list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## The second function, cacheSolve generates the inverse of the special "matrix" 
## created with the above function. 
## However, it first checks to see if the inverse has already been calculated. 
## If so, it gets the inverse from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the data and 
## sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if (!is.null(i)){
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
