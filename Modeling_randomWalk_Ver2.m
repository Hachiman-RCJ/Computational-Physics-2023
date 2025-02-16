% Modeling_randomWalk_Ver2

% the objective of this code is to simulate brownian motion 
% for multiple particles

% Author: Roy Cruz Jr
% Date: 3/15/2023


clear all;
close all;


%define the following parameters
n=100; % number of iterations
pt=input('How many particles are inside the lattice (cube)? ');
poscord=zeros(n,4,pt); %  x,y & z direction data with time
maxInt= input('What is the Length of the cube? ');
h=input('Choose a step size for the particle '); % step size

% give each particle a random position in the lattice cube

for i=1:pt
    poscord(1,2,i)=randi(maxInt);
    poscord(1,3,i)=randi(maxInt);
    poscord(1,4,i)=randi(maxInt);
end




% Output all particles position 

for j=1:pt
    for i=1:n

        % updating the x values
        if( rand > .5)
            poscord(i+1,2,j)=poscord(i,2,j)+h;
        else
            poscord(i+1,2,j)=poscord(i,2,j)-h;
        end
    
        if (poscord(i+1,2,j)<=0)
            poscord(i+1,2,j)=0 ;
        end
    
    
           % updating  y values 
           if( rand > .5)
            poscord(i+1,3,j)=poscord(i,3,j)+h;
        else
            poscord(i+1,3,j)=poscord(i,3,j)-h;
        end
    
        if (poscord(i+1,3,j)<=0)
            poscord(i+1,3,j)=0 ;
    
        end
   

        % updating z values
        if( rand > .5)
            poscord(i+1,4,j)=poscord(i,4,j)+h;
        else
            poscord(i+1,4,j)=poscord(i,4,j)-h;
        end
    
        if (poscord(i+1,4,j)<=0)
            poscord(i+1,4,j)=0 ;
    
        end
    
        % recording time
        poscord(i+1,1,j)=poscord(1,1,j)+1;
    end

end



% plot all particles trajectories in a for loop

for j=1:pt
    for i=1:n

        CM=jet(pt);
        
        plot3(poscord(i,2,j),poscord(i,3,j),poscord(i,4,j),'.', 'Markersize',10,'Color',CM(j,:));
        xlabel('x-direction position');
        ylabel('y-direction position');
        zlabel('z-direction position');
        hold on;
        grid on;
        
        %tracing trajectory of each particle at each time step
        
        dots=plot3(poscord(i,2,j),poscord(i,3,j),poscord(i,4,j),'.','MarkerSize',12,'Color',CM(j,:));
        
        
        axis manual; 
        
        p.Xdata=poscord(i,2,j);
        p.Ydata=poscord(i,3,j);
        p.Zdata=poscord(i,4,j);
        drawnow
        axis([0,2*maxInt,0,2*maxInt,0,2*maxInt]);
        line([poscord(i,2,j),poscord(i+1,2,j)],[poscord(i,3,j),poscord(i+1,3,j)],[poscord(i,4,j),poscord(i+1,4,j)],'Color','k');

    end
end




