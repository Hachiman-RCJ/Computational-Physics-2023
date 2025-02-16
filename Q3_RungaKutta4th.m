% Creating a function using the 4th Order Runge-Kutta 

clear all;
close all;

%define constants

L=15; % hendries or kg*m^2/s^2 * A^2
R=1000; %  ohms
freq=100000; % frequency kHz

%Define ode, anonoumous function
dIdt=@(t,I) ((10*sin(2*pi*freq*t))/L)-(R/L)*I;


%Define initial values and time step
I0=0; 
t0=0;
tmax=10^-4;
h=10^-9; % increments for input


%Call 4th Order Runge Kutta function to solve ODE
[t,I] = rk4(dIdt,t0,tmax,I0,h);



%Define exact solution
%yexact=@(time) 70/9*exp(-0.3*time)-43/9*exp(-1.2*time);

%Plot the results
hold on;
plot(t,I,'.','MarkerSize',15.);
%fplot(yexact,[t0 tmax],'r');
set(gca,'FontSize',14.);
xlabel('Time (s)','FontSize',14.);
ylabel('Current (A)','FontSize',14.);
legend('Numerical Solution','Exact Solution');
hold off;

function [t,I] = rk4(dIdt,t0,tmax,I0,h);

%calc number of times to go through loop
N=(tmax-t0)/h;

%initialize arrays for time and y values
 I(1)=I0;
 t(1)=t0;
 
% %for loop to fill rest of y and t arrays
for i=1:N

    
     
%calc ks
     k1 = dIdt(t(i),I(i));
     k2 = dIdt(t(i)+(1/2)*h,I(i)+(1/2)*h*k1);
     k3 = dIdt(t(i)+.5*h,I(i)+.5*h*k2);
     k4 = dIdt(t(i)+h,I(i)+h*k3);

     
%%update t and y arrays
     t(i+1)=t(i)+h;
     I(i+1)=I(i)+(1/6)*h*(k1+2*k2+2*k3+k4);
 end
end



     
