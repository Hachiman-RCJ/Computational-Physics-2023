%Lab5_Q3_Phys361

publish('Lab6_Q3_Phys361.m','pdf')

t=0:5:60; % ms
a=[0,3,8,20,33,42,40,48,60,12,8,4,3]; % acceleration values


function I=SimpsonPts(t,a)

h=input('What is the value of h? ');
n=length(x)-1;

% integrate with the simpson method
if mod(n,3)==0

    s1=0;
    s2=0;

    for i=1:(n/3)-1
        j=3*(i+1);
        s2=s2+y(j)+y(j+1);
    end

    % total summation with simpson method

    ts=(3*h/8)*(y(1)+3*s1+2*s2+y(n+1));
    I=ts;
end

if mod(n,3)==1

    % integrate the 1st interval with trapezoid method

    for i=1:1
        t1=0;
        t1=t1+(y(i)+y(i+1)*(x(i+1)-x(1)));
        p1=(1/2)*t1;

    end


    % integrate others with simpson method

    k1=0;
    k2=0;

    for i=1:(n-1)/3
        j=3*i+1;
        k1=k1+(y(j+1)+y(j+2));
    end

    for i=1:((n-1)/3)-1
        j=3*i+1;
        k2+y(j+1);
    end

    % total summation with simpson 3/8 method

    ts2=(3*h/8)*(y(2)+3*k1+2*k2+y(n+1));

    % add both parts of integration 

    l1=p1+ts2;
    I=l1;

end

if mod(n,3)==2
    % integrate the first 2 intervals with simpson 1/3
    m1=(h/3)*(y(1)+4*y(2)+y(3));

    n1=0;
    n2=0;

    for i=1:(n-2)/3
        j=3*i+1;
        n2=n2+y(j+2);
    end

    % total summation with simpson 3/8 method
    R1=(3*h/8)*(y(3)+3*n1+2*n2+y(n+1));

    I=R1+m1;
end

SimpsonPts(t*10^(-3),(a/9.81).^2.5)

end