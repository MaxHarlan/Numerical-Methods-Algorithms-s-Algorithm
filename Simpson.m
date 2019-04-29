function I = Simpson(x,y)
%This function integrates a given amount of numbers of x and y values set 
%into an array. this will then use the simpson and/or the trapezoidal
%method to determine the integrated form of a function.

ylength = length(y);
%Uses the length function of the y values.

xlength = length(x);
%Uses the length fucntion on the x values.

distance_change = linspace(x(1) , x(xlength) , xlength);
%Determines spacing of the x values by evenly spacing them out using the
%linspace function.

h = x(2) -x(1)
%This is step size for the function.

if nargin > 2 || nargin < 2
    error('You must input 2 values')
    %error for any argument number not 2.

elseif ylength ~= xlength
    error('The vectors for x and y must be the same length')
    %error check for differing sizes if arrays.
    
elseif x ~= distance_change
    error('x must be equally linerally spaced.')
    %the x values must be equivalent to linerally spaced values.
    
end

    half = ylength/2;
    %gives half of the y length of the array
    
    trap = (h)*((y(ylength) + y(ylength-1))/2);
    %The trapezoidal method equation.
    
    simp = (h/3)*(y(1) + (4*sum(y(2:2:ylength-2)))+(2*sum(y(3:2:ylength-2)))+y(ylength-1));
    %The simpson method equation
    
    if round(half) == ylength/2
        
        I = trap + simp;
        disp('Due to odd number of spaces, trapezoidal rule must be used for part of the equation.')
        %Uses trapezoidal and simpson method for uneven spacing.
        
    else
        I = simp;
        %Uses just simpson for evenly spaced values.
        
    end
    
    I
    %Integrated Value
    
end