## Code zum Erzeugen der Graphiken zum Veranschaulichen 
## der unterschiedlichen Güte der Laplace-Approximation 
## bei verschiedenen Verteilungen

library(ggplot2)
library(numDeriv)

## ==================================================================
## Funktion "laplace_approximation" 
## zum Berechnen der Laplace-Approximation für eine Funktion probfunc



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
## ==================================================================

## Funktion "compFunc_sameImage" 
## zum Darstellen zweier gegebener Funktionen func1 und func2
## in einer gemeinsamen Graphik
## func1 : rot, durchgezogene Linie
## func2 : blau, gestrichelte Linie


compFunc_sameImage <- function(lowB, upB, func1, func2){
  base <- 
    ggplot() + 
    xlim(lowB,upB)
  g <- 
    base +
    geom_function(fun = func1, 
                  color = "Red", linetype = "solid", 
                  linewidth = 1) +
    geom_function(fun = func2, 
                  color = "Blue", linetype = "longdash", 
                  linewidth = 1) +
    theme(axis.line = 
            element_line(
              arrow = arrow(length = unit(0.1, "inches")), 
            ))
  return(g)
}

## =================================================================
## Funktion "comp_lapAppr_sameImage" zum Darstellen 
## einer Funktion func und ihrer Laplace-Approximation lapAppr
## in einer gemeinsamen Graphik
## Originalfunktion func : rot, durchgezogene Linie
## Laplace-Approximation : blau, gestrichelte Linie

comp_lapAppr_sameImage <- function(func, lowB, upB){
  lapAppr <- laplace_approximation(func, lowB, upB)
  g <- compFunc_sameImage(lowB, upB, func, lapAppr )
  return(g)
}

## =================================================================
## =================================================================

## Beispiele mit Normalverteilung

test_Norm <- function(m0, sd0){
  f <- function(x){
    dnorm(x, mean = m0, sd = sd0)
  }
  return(f)
}

gNorm_0_1   <- comp_lapAppr_sameImage(test_Norm(0,1), -4, 4)
gNorm_25_7  <- comp_lapAppr_sameImage(test_Norm(25,7), 20, 29)

## -----------------------------------------------------------------
## Beispiele mit t-Verteilung

test_tdistr <- function(df0, ncp0){
  f <- function(x){
    dt(x, df = df0, ncp = ncp0)
  }
  return(f)
}

gtDistr_2_0   <- comp_lapAppr_sameImage(test_tdistr(2, 0), -4, 4)
gtDistr_20_0  <- comp_lapAppr_sameImage(test_tdistr(20, 0), -4, 4)
gtDistr_200_0 <- comp_lapAppr_sameImage(test_tdistr(200, 0), -4, 4)
gtDistr_2_5   <- comp_lapAppr_sameImage(test_tdistr(2, 5), -2, 10)


## -----------------------------------------------------------------
## Beispiele mit Gamma-Verteilung

test_Gamma <- function(shape_selected, rate_selected){
  f <- function(x){
    dgamma(x, shape_selected, rate_selected)
  }
  return(f)
}
## Bemerkung: Damit die Laplace-Approximation funktioniert, 
## muss shape_selected > 1 sein

gGamma_1.1_1   <- comp_lapAppr_sameImage(test_Gamma(1.1, 1), 0, 4)
gGamma_1.5_1   <- comp_lapAppr_sameImage(test_Gamma(1.5, 1), 0, 4)
gGamma_2_1     <- comp_lapAppr_sameImage(test_Gamma(2, 1), 0, 4)
gGamma_20_1    <- comp_lapAppr_sameImage(test_Gamma(20, 1), 0, 40)
gGamma_20_10   <- comp_lapAppr_sameImage(test_Gamma(20, 10), 0, 4)


## -----------------------------------------------------------------
## Beispiele mit Beta-Verteilung

test_Beta <- function(a_selected, b_selected){
  f <- function(x){
    dbeta(x, a_selected, b_selected)
  }
  return(f)
}

gBeta_2_2     <- comp_lapAppr_sameImage(test_Beta(2,2), 0, 1)
gBeta_20_20   <- comp_lapAppr_sameImage(test_Beta(20,20), 0, 1)
gBeta_200_200 <- comp_lapAppr_sameImage(test_Beta(200,200), 0, 1)

gBeta_2_4     <- comp_lapAppr_sameImage(test_Beta(2,4), 0, 1)
gBeta_4_2     <- comp_lapAppr_sameImage(test_Beta(4,2), 0, 1)

gBeta_2_40    <- comp_lapAppr_sameImage(test_Beta(2,40), 0, 1)
gBeta_2_20    <- comp_lapAppr_sameImage(test_Beta(2,20), 0, 1)
gBeta_2_200   <- comp_lapAppr_sameImage(test_Beta(2,200), 0, 1)

gBeta_20_200  <- comp_lapAppr_sameImage(test_Beta(20,200), 0, 1)

## -----------------------------------------------------------------
