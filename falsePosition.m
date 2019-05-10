% The false position method is a function that uses user input variable
% huess for the upper and lower bound x-variable guesses of which the root
% is somewhere in between. Plus, the user must put in a function in terms
% of y that is attempted to be evaluated. The other values are given values
% that are standard to all functions, which are the error should be within
% 0.0001% of the actual root and the maximum number of iterations run is
% 200. The function will break when it reaches either of those points.

%The inputs should consist of a function, upper and lower bound, and
%depending on situation, an error percentage and maximum number of
%iterations.

%The outputs should consist of the root itself, the y value, the
%approximate error, and number of total iterations to get the root.

function [root, fx, ea, iter]= falsePosition(func, xl, xu, es, maxiter) %This function should have user input of the function equation,initial lower bound and upper bound guess. The error and maximum iterations will be given for each eqaution.

iter = 0; %Starting amount of iterations
xr = 0; %Starting new root
ea = 100; %starting error

        if nargin == 3 %Correlation for 3 input arguments 
            es = .0001; %The relative error will be within 0.0001%
            maxiter = 200; %The maximum iterations the funtion will run will be given as 200.
        elseif nargin < 3 %Correlation for less than 3 input arguments
            error('There must be the correct amount of input variables.') %Must have at least 3 input arguments
        elseif nargin == 4 %Correlation for 4 input arguments
            maxiter = 200; %Only need maxiumum iteration of 200 times
        end
         
    while ea > es && iter < maxiter %While loop that runs false position function until the percent error is smaller than 0.0001% and the maximum iterations is 200.
        
        guess = xr; %Will establish new root guess
        yl = feval(func,xl); %evaluates function at lower x bound
        yu = feval(func,xu); %evaluates function at upper x bound
        yr = feval(func,xr); %evaluates function at new x bound
        xr = xu-(((yu)*(xl-xu))/((yl)-(yu))); %This is the formula for the false position
        ea = abs(((xr-guess)/xr)*100); %This is the formula for approximate error 
        
        if (sign(yu)) == (sign(yr)) %If the signs of the function are equal of the upper bound and new root.
            xu = xr; %Then the new root will be the upper bound
        elseif (sign(yl)) == (sign(yr)) %If the signs of the function are equal of the lower bound and new root.
            xl = xr; %Then the new root will be the lower bound      
        end
        
        iter = iter + 1;%Increases the amount of iteration by 1 each time it is run in the while loop.
        
     end
    
    root = xr %This is the root after so many iterations or withing a certain error percentage
    
    fx = feval(func,xr) %This is the y value of the function
    
    ea = ea %This is the approximate error
    
    iter = iter %This is the number of iterations
    
end


