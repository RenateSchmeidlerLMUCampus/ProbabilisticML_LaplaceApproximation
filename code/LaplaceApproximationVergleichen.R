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




## Graphische Gegenüberstellung von zwei Funktionen

library(ggplot2)
compFunc_sameImage <- function(lowB, upB, func1, func2){
  base <- 
    ggplot() + 
    xlim(lowB,upB)
  g <- 
    base +
    geom_function(fun = func1, color = "Red") +
    geom_function(fun = func2, color = "Blue")
  return(g)
}

comp_lapAppr_sameImage <- function(func, lowB, upB){
  lapAppr <- laplace_approximation(func, lowB, upB)
  g <- compFunc_sameImage(lowB, upB, func, lapAppr )
  return(g)
}



## Funktionen für Tests

test_Beta <- function(a_selected, b_selected){
  f <- function(x){
    dbeta(x, a_selected, b_selected)
  }
  return(f)
}

test_Gamma <- function(shape_selected, rate_selected){
  f <- function(x){
    dgamma(x, shape_selected, rate_selected)
  }
  return(f)
}

test_bimodNorm <- function(m1, m2, sd1, sd2){
  f <- function(x){
    dnorm(x, mean = m1, sd = sd1) + dnorm(x, mean = m2, sd = sd2)
  }
  return(f)
}


## 

comp_lapAppr_sameImage(test_Gamma(2,4), 0, 1)
