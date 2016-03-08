function [] = hw2_q1(gamma)
% the only command line argument for this function is the gamma
% in the equation f(x) = cosh(x)+cos(x) - gamma

% Plotting definitions
x= linspace(-4,4);
y = cosh(x)+cos(x)-gamma;

figure;

plot(x,y);
grid on ;

% my_newton call definitions
str = num2str(gamma);
f1 = 'cosh(x)+cos(x)-';
f = strcat(f1,str);
my_bisect(f,1,5,10e-10,50000);
fprintf('function: %s\n',f);
end