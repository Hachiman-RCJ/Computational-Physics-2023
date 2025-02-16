% Lab_Q1_Phys361

% objective: We are trying to use the data provided to calcualte the
% velocity function of an accelerating airplane in a runaway using the
% forward, backward and central difference equations


h=1; % step size
y=[0,20,53,295,827,1437,2234,3300,4658]; % data

yd1=FirstDeriv(h,y)


function yd1=FirstDeriv(h,y)


% make an array to store computation from forward, backward and middle
%difference
yd1=zeros(length(y),3);
    
    for i=1:length(y)
        if  (length(y)>i>=1)
            yd1(i,1)=(y(i+1)-y(i))./h; % Forward difference 
            if(2<=i)
                yd1(i,2)=(y(i)-y(i-1))./h; % Backward difference
                if(length(y)>i>=1 && i>=2)
                    yd1(i,3)=(y(i+1)-y(i-1))./2*h; % Middle Difference
                end
            end
        end
    end

end




