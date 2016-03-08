function corrected_trap( f,a,b,N,fpa,fpb )
% This function computes the corrected trapezoidal rule using 
% the error term

h = (b-a)/N;

y=0;
x=a;
iter =0;
% display array

% calculate f(x_i) not including the endpoints
for i =1: N-1
    x = (a+i*h); 
    y = y + 2*f(x);
end

%add endpoints to y
y= y+f(a);
y = y + f(b);
y = ((h/2)* y) - ((h.^2/12) * (fpb-fpa));

expected = integral(f,a,b);
%disp(expected);
err = abs(expected - y);
err2 = abs(err/h.^4);

%format short e
% display junk
%disp(' ');
%disp('   N            h           approx           err           err/h^2');
%disp('--------------------------------------------------------------------------');
disp([N h y err err2]);
%disp(' ');



end

