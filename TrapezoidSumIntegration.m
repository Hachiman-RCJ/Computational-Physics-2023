%integrate with the trapezoid method introduced in Calculus


clear all;
close all;
%define parameters
% assume that the function is f(x)=x
x=[0,0.3,0.6,0.9,1.2,1.5,1.8];
y=[0.5,0.6,0.8,1.3,2,3.2,4.8];


Trapsum=TrapInt(x,y);

Total=(.5)*(y(1)+y(7)+2*Trapsum) % total summation we get (pretty close)

trapz(x,y); % built in fucntion for trapezoid sum


function Trapsum=TrapInt(x,y)

h=1; % step size
a=x(1);
b=x(7);
n=round(b-a/h);% number of paritions
Trapsum=0;


%calculate the area using the trapezoid method

for i=1:n-1

Trapsum=Trapsum+sum(y(1+i*h));

end


end




