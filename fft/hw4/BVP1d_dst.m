function [ vh, xh ] = BVP1d_dst(N)
%
%This function will solve a 2 point 1d boundary value problem
%With direchlet boundary conditions
%
% -u'' +u = (pi^2*sin(pi*x)- 2*pi*cos(pi*x))e^x
% u(0) = u(1) = 0

% solution u(x) = e^x * sin(pi*x)


h = 1/N;
xh = (0:N)'*h; %discrete grid
lam = 2*(1-cos(xh(2:N)*pi))/(h^2); % evals of A_h

f = exp(xh).*(pi.^2 .* sin(pi*xh)- 2*pi.*cos(pi*xh)); %rhs
vh= dst(f(2:N));

vh = vh ./(lam+1); % lambda assuming sigma is 1

vh = dst(vh);
vh = [0; vh; 0;]; %add boundary conditions 


