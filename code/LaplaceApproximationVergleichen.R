## 



library(numDeriv)


laplace_approximation <- function(probfunc, lowBound, uppBound){
  neg_log_f <- function(x){
    -log(probfunc(x))
  }
  optim <- optimize(neg_log_f, 
                    lower = lowBound, upper = uppBound)
  th_hat <- optim$minimum
  H <- hessian(neg_log_f, x = th_hat)
  inv_H <- solve(H)
  
  f <- function(x){
    dnorm(x, mean = th_hat, sd = sqrt(inv_H))
  }
  return(f)
}



## Tests 

## 
