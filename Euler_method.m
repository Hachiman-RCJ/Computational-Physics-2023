
% Program: Euler_method.m
% This program solves the radiactive decay ODE using Euler's method


%Author: Roy Cruz Jr
%Date: Feb 21, 2023

%Version 1: Base code


clear all;
close all;


% define the constants

gamma=0.05; % decay constant 1/seconds


% define my ODE
decayODE=@(N) -gamma*N;


% define the initial values, number of atoms and time


Ninit=1; % percentage of atoms present at tmin

tmin=0; % initial time, seconds
tmax=500; % final time, seconds

h1=1; % time step, seconds
h2=5;
h3=10;
h4=50;




% call function using the Euler's method to solve ODE

[time1,time2,time3,time4,y1,y2,y3,y4] = odeEuler(decayODE,tmin,tmax,h1,h2,h3,h4,Ninit);


%define the exact solution
Nexact1=Ninit*exp(-gamma*time1);
Nexact2=Ninit*exp(-gamma*time2);
Nexact3=Ninit*exp(-gamma*time3);
Nexact4=Ninit*exp(-gamma*time4);



% Plot the results

%plot(time1,y1,'r',time2,y2,'b',time3,y3,'g',time4,y4,'k');
%hold on
%plot(time1,Nexact1,time2,Nexact2,time3,Nexact3,time4,Nexact4);

figure
subplot(1,4,1);
plot1=plot(time1,y1,'.',time1,Nexact1,'k');
set(gca,'FontSize',14);
xlabel('Time','FontSize',14);
ylabel('Percent of Nuclei Remaining','FontSize',14);
legend('NS1','ES1');
axis([0,50,0,1]);

hold on;


subplot(1,4,2);
plot2=plot(time2,y2,'.',time2,Nexact2,'k');
set(gca,'FontSize',14);
xlabel('Time','FontSize',14);
ylabel('Percent of Nuclei Remaining','FontSize',14);
legend('NS2','ES2');
axis([0,50,0,1]);

subplot(1,4,3);
plot3=plot(time3,y3,'.',time3,Nexact3,'k');
set(gca,'FontSize',14);
xlabel('Time','FontSize',14);
ylabel('Percent of Nuclei Remaining','FontSize',14);
legend('NS3','ES3');
axis([0,50,0,1]);

subplot(1,4,4);
plot4=plot(time4,y4,'.',time4,Nexact4,'k');
set(gca,'FontSize',14);
xlabel('Time','FontSize',14);
ylabel('Percent of Nuclei Remaining','FontSize',14);
legend('NS4','ES4');
axis([-10,50,0,1]);





%define the function

function [time1,time2,time3,time4,y1,y2,y3,y4] = odeEuler(ode,tmin,tmax,h1,h2,h3,h4,yinit);


% This function solves ode using Euler's method

% Number of times the for loop will run
    num1=(tmax-tmin)/h1;
    num2=(tmax-tmin)/h2;
    num3=(tmax-tmin)/h3;
    num4=(tmax-tmin)/h4;
    

  
% initializing value and time array
    y1(1)=yinit;
    y2(1)=yinit;
    y3(1)=yinit;
    y4(1)=yinit;
    time1(1)=tmin;
    time2(1)=tmin;
    time3(1)=tmin;
    time4(1)=tmin;
    

   % use for loop to store output values
    
    for i=1:num1
    
    y1(i+1) = y1(i)+ode(y1(i))*h1;

    time1(i+1)=time1(i)+1;
    
    end


    for i=1:num2
    
    
    y2(i+1) = y2(i)+ode(y2(i))*h2;  
    time2(i+1)=time2(i)+1;
    end


    for i=1:num3
    
    
    y3(i+1) = y3(i)+ode(y3(i))*h3;
    time3(i+1)=time3(i)+1;
    
    end

for i=1:num4
    
    
    y4(i+1) = y4(i)+ode(y4(i))*h4;
    time4(i+1)=time4(i)+1;

   
    end


end