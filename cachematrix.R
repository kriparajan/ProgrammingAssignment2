## The following functions will cache the inverse of a matrix.

## the function makeCacheMatrix computes the inverse of a special "matrix" 
##that can allow data to be cached later on.

makeCacheMatrix <- function(x = matrix()) {
        ## the inverse property
        m<-NULL
        
        ## the way to set the matrix
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        ## the way to get the matrix
        get <- function() {
                ## Return the matrix
                x
        }
        ## set the inverse of the matrix
        setInverse <- function(inverse) {
                i <<- inverse
        }
        ## get the inverse of the matrix
        getInverse <- function() {
                ## Return the inverse property
                m
        }
        ## Return a list of the methods
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
        
}


## the cachesolve function is able to compute the inverse of the "special"
## matrix that is returned by the function makeCacheMatrix

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getInverse()
        ##if the inverse is already set then return 
        if( !is.null(m) ) {
                message("getting cached data")
                return(m)
        }
        ## Get the matrix from our object 
        data <- x$get()
        m <- solve(data,...) 
        ## Set the inverse to the object
        x$setInverse(m)
        ## Return the matrix
        m      
}



