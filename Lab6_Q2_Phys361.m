% Lab_Q2_Phys361

% objective: We are trying to use the data provided to calcualte the
% approximate velocity, acceleration function, of an accelerating airplane
% in a runaway using the forward, backward and central difference equations
% We will also plot our answers

clear all
h=1;
y=[8,242,2244,2872,5377,8130,12617,1538,19872,25608,32412,38309,447261];

% call function
yd2=SecondDeriv(h,y)


function yd2=SecondDeriv(h,y)

%make an array for the data values computed by the second derivative
% central difference formula
yd2=zeros(length(y),3);


for i=1:length(y)
    if(length(y)>i && i>=2)
        yd2(i,1)=(y(i+h)-2*y(i)+y(i-h))./(h^2) % middle difference
        
    end

    if(length(y)-1>i)
        yd2(i,2)=(y(i+1+h)-2*y(i+1)+y(i+1-h))./(h^2) % forward difference
       
    end

    if(length(y)>=i && i>=3)
        yd2(i,3)=(y(i-1+h)-2*y(i-1)+y(i-1-h))./(h^2) % backward difference
    end


end



plot(1:13,y,1:13,yd2);
%legend('original function', 'second derivative')

end


