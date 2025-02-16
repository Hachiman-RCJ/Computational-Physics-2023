%This is a template function to write your simple harmonic oscillator
%solver

clear all;
close all;

%Initialize constants
tmin=0;       %time span, s
tmax=500;
global omega; %define omega to be a global variable 
omega=0.1;    %angular velocity, rad/s
global damp; % define damp to be a global variable
damp=0.02; % damping term s^-1

%Initial values
x0=0;   %Initial position, m
v0=1;   %Initial velocity, m/s
h1=1; % steppping size
h2=5;
h3=10;
h4=50;

%Define the time span and the intial values
tspan=[tmin tmax];
initvals=[x0 v0];

% define exact position  simple harmonic oscillator equations
ExactX=@(t) (1/omega)*sin(omega*t);


%Solve all cases using 2nd order RK2
[trk2A,urk2]=rk2mat(@sho,tmin,tmax,h1,initvals);
xrk2A=urk2(1,:);
vrk2A=urk2(2,:);

[trk2B,urk2]=rk2mat(@sho,tmin,tmax,h2,initvals);
xrk2B=urk2(1,:);
vrk2B=urk2(2,:);

[trk2C,urk2]=rk2mat(@sho,tmin,tmax,h3,initvals);
xrk2C=urk2(1,:);
vrk2C=urk2(2,:);

[trk2D,urk2]=rk2mat(@sho,tmin,tmax,h4,initvals);
xrk2D=urk2(1,:);
vrk2D=urk2(2,:);

% this calling function includes the damping term

[trk2E,urk2]=rk2mat(@shodamped,tmin,tmax,h1,initvals);
xrk2E=urk2(1,:);
vrk2E=urk2(2,:);


%figure();
%Plot the results 
figure(1)
plot1=plot(trk2A,xrk2A,'r',trk2A,vrk2A,'b',trk2A,ExactX(trk2A),'k','LineWidth',2);
legend('Numerical Position','Numerical Velocity','Exact Position');
set(gca,'FontSize',14.);
xlabel('Time','FontSize',14.);
ylabel('Output','FontSize',14.);
title('Harmonic Oscillator with h=1');

hold on;

figure(2)
plot2=plot(trk2B,xrk2B,'r',trk2B,vrk2B,'b',trk2B,ExactX(trk2B),'k','LineWidth',2);
legend('Numerical Position','Numerical Velocity','Exact Position');
set(gca,'FontSize',14.);
xlabel('Time','FontSize',14.);
ylabel('Output','FontSize',14.);
title('Harmonic Oscillator with h=5');

figure(3)
plot3=plot(trk2C,xrk2C,'r',trk2C,vrk2C,'b',trk2C,ExactX(trk2C),'k','LineWidth',2);
legend('Numerical Position','Numerical Velocity','Exact Position');
set(gca,'FontSize',14.);
xlabel('Time','FontSize',14.);
ylabel('Output','FontSize',14.);
title('Harmonic Oscillator with h=10');

figure(4)
plot4=plot(trk2D,xrk2D,'r',trk2D,vrk2D,'b',trk2D,ExactX(trk2D),'k','LineWidth',2);
legend('Numerical Position','Numerical Velocity','Exact Position');
set(gca,'FontSize',14.);
xlabel('Time','FontSize',14.);
ylabel('Output','FontSize',14.);
title('Harmonic Oscillator with h=50');


figure(5)
plot5=plot(trk2E,xrk2E,'r',trk2E,vrk2E,'b','LineWidth',2);
legend('Numerical Position','Numerical Velocity','Exact Position');
set(gca,'FontSize',14.);
xlabel('Time','FontSize',14.);
ylabel('Output','FontSize',14.);
title('Harmonic Oscillator with damping and h=1')



function dudt = shodamped(t,u)
        
        %u(1) is x
        %u(2) is v
        
        %Define global variable omega
        %It is global because you can change
        %the value outside the function
        global omega;
        global damp;
       
        %Set the shape of the dudt array
        dudt=zeros(2,1);
        
        %First order DE dx/dt
        dudt(1)=u(2);
        %First order DE dv/dt
        dudt(2)= -damp*u(2)-(omega^2)*u(1);
        
end 


function dudt = sho(t,u)
        
        %u(1) is x
        %u(2) is v
        
        %Define global variable omega
        %It is global because you can change
        %the value outside the function
        global omega;
       
       
        %Set the shape of the dudt array
        dudt=zeros(2,1);
        
        %First order DE dx/dt
        dudt(1)=u(2);
        %First order DE dv/dt
        dudt(2)=-(omega^2)*u(1);
        
end 


% now we will write a 2nd order runga kutta function

function [t,u] = rk2mat(dudt,tmin,tmax,h,u0)

    %Number of steps to take
    N=round(tmax-tmin)/h;

    %Define initial values
    t(1)=tmin;
    u(:,1)=u0;

    for i=2:N


        k1=dudt(t(i-1),u(:,i-1));
        k2=dudt(t(i-1),u(:,i-1)+.5*k1*h);

        u(:,i)=u(:,i-1)+k2*h;
        t(i)=t(i-1)+h;

    end %of for loop
    
end %of function


