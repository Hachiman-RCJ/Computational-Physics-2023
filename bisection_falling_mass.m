%FP_falling_mass 

%{ 
This program using the False Position root finding method to solve for the 
mass of a falling object with air resistance
%}

%Author: Roy Cruz Jr
%Date: Feb 2nd, 2023

%Version 2: False position method
clear all;
close all;

%Define constants
g=9.8;    %Acceleration of gravity (m/s^2)
cd=0.25;  %Drag coefficient (kg/m)
v=36;     %velocity at t=4 s (m/s)
t=4;      %time (s)

%Define the function 
func=@(x) sqrt(g*x/cd)*tanh(sqrt(g*cd/x)*t)-v;

%Plot the function to make sure there is a root
%fplot(func,[0 500]);
%grid on;

%Ask the user for the initial guess
xl=input('What is the lower bound for the mass in kg? ');
xu=input('What is the upper bound for the mass in kg? ');

%Evaluate at the initial guesses to make sure they surround the root
while func(xl)*func(xu)>0
    disp('Your guesses do not surround the root.')    
    xl=input('What is the lower bound for the mass in kg? ')
    xu=input('What is the upper bound for the mass in kg? ')
end

%Define initial values for while loop
approxerr=1;
count=0;
oldxr=100;

%Iterate with bisection method until error is less than 0.05 percent
while (approxerr > 0.00005) && (count < 1000)


    %Find the mid point of the guesses
    xr=(xu+xl)/2;

    %Figure out what side of the midpoint the root is on
    if func(xr)*func(xu) < 0
        %Replace the lower bound with the midpoint
        xl=xr;
    else
        %Replace the upper bound with the midpoint
        xu=xr;  
    end

    %Calculate the approximate error
    approxerr=abs((xr-oldxr)/xr);
    
    %Store old guess for root
    oldxr=xr;
    
    %Increase count value
    count=count+1;
    
end

%Output the results
output=strcat('The root is %5.2f kg. It was found after %i interactions. ',...
            ' The approximate error is %6.4f percent. \n');
fprintf(output,xr,count,approxerr*100);

%Use built in fuction (fzero) to find the root
fprintf('The root found with fzero is %5.2f. \n',fzero(func,100));






