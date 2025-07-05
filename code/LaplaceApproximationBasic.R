## R-Function for Computing the Laplace Approximation

## Requirements:
## - R-package numDeriv

library(numDeriv)


laplace_approximation <- function(probfunc, lowBound, uppBound){
  
  ### (A) Preparation ----------------------------------------------- 
  neg_log_f <- function(x){
    -log(probfunc(x))
  }
  
  ### (B) Optimization ----------------------------------------------
  optim <- optimize(neg_log_f, 
                    lower = lowBound, upper = uppBound)
  th_hat <- optim$minimum
  
  ### (C) Hessian ---------------------------------------------------
  H <- hessian(neg_log_f, x = th_hat)
  
  ### (D) Inverse Hessian -------------------------------------------
  inv_H <- solve(H)
  
  ### (E) Result ----------------------------------------------------
  f <- function(x){
    dnorm(x, mean = th_hat, sd = sqrt(inv_H))
  }
  return(f)
}
