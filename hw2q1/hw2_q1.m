
% Plotting definitions
x= linspace(-4,4);
%x = -4:pi/100:4;
y = cosh(x)+cos(x)-1;
x0=0;
y0=0;

%x = logspace(-4,4);
figure;

plot(x,y);
grid on ;
%figure(1);
%loglog(x,f,'-s');


% my_newton call definitions
f = 'cosh(x)+cos(x)';
fp = 'sinh(x)-sin(x)';
my_newton(f,fp,2,10e-10,50000);
