


## creating a function which creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
         inv <- NULL
         set <- function(y) {
         x <<- y
         inv <<- NULL
     }
      get <- function() x
      setinverse <- function(inverse) inv <<- inverse
      getinverse <- function() inv
      list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
 }


}


##  function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
##   the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
         inv <- x$getinverse()
          if(!is.null(inv)){
                   message("getting cached data")
                     return(inv)
 }
  data <- x$get
  inv <- solve(data)
  x$setinverse(inv)
  inv
}

> x = rbind(c(1, -1/4), c(-1/4, 1))
> m = makeCacheMatrix(x)
> m$get()
     [,1]  [,2]
[1,]  1.00 -0.25
[2,] -0.25  1.00
> cacheSolve(m)
          [,1]      [,2]
[1,] 1.0666667 0.2666667
[2,] 0.2666667 1.0666667

> cacheSolve(m)
getting cached data.
          [,1]      [,2]
[1,] 1.0666667 0.2666667
[2,] 0.2666667 1.0666667

>



        ## Return a matrix that is the inverse of 'x'

