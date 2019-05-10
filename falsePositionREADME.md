The false position method is a function that uses user input variable
guess for the upper and lower bound x-variable guesses of which the root
is somewhere in between. Plus, the user must put in a function in terms
of y that is attempted to be evaluated. The other values are given values
that are standard to all functions, which are the error should be within
0.0001% of the actual root and the maximum number of iterations run is
200. The function will break when it reaches either of those points.

The inputs should consist of a function, upper and lower bound, and
depending on situation, an error percentage and maximum number of
iterations.

The outputs should consist of the root itself, the y value, the
approximate error, and number of total iterations to get the root.

Inputs:

  func: Function or equation to be tested upon
  
  xl: lower guess at the root
  
  xu: upper guess at the root
  
  es: error that the estimated guess will be within the actual guess
  
  maxiter: the maximum amount of iterations to be ran
  
Outputs:
  
  root: guess at root
  
  fx: y value of function
  
  ea: approximate error
  
  iter: amount of iterations ran
