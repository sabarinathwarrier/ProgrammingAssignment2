## This maintains the structure provided in the example while changing the functionality to calculating the inverse

## Create a list of functions to 
#   1. Set the matrix
#   2. Get the matrix
#   3. Set inverse
#   4. Get the inverse
# 'm' is sort of a flag

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Checks the cache for the inverse , if not present, evaluate and overwrite m. Else retrieve from cache.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinv()
  if(!is.null(m)) {
    message("Getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
  }
