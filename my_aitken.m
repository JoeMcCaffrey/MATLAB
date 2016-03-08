function[] = my_aitken(xn,xn1,xn2)
%
% The only command line arg for this fucntion is the value
% for Xn this will compute Xn+1 using Aitkens extrapolation


format long e


a = ((xn)*(xn2)-(xn1)^2)/(xn-2*xn1+xn2);


disp(a);


end
