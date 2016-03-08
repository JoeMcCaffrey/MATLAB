function [vh,xh,err] = poiss1d_2P(N)
%
%  1D Poisson solve assuming homogeneous Dirichlet BC
%  DST implemented by matrix multiply by P 
%
%  -u'' = f
%  u(0)=u(1)=0 
%
%  u(x) = exp(sin(pi*x))-1 
%  f(x) = -(pi^2)*exp(sin(pi*x)).*(cos(pi*x).^2-sin(pi*x))

h = 1/N;          
xh = (0:N)'*h;          % discrete grid
uh = exp(sin(pi*xh))-1; % true solution

lam = 2*(1-cos(xh(2:N)*pi))/(h^2);  % evals of A_h
f =  -pi^2*(cos(pi*xh).^2-sin(pi*xh)).*exp(sin(pi*xh));  % rhs

P = createP(N); 

% vh = P*((P*f(2:N))./lam);  step by step:
 
f_hat = P*f(2:N);   % find f in the Fourier sine basis, note P_inv = P
v_hat = f_hat./lam; % compute soln in Fourier space
vh    = P*v_hat;    % compute soln in physical space
vh = [0; vh; 0];    % append BCs

figure(1)
uh = exp(sin(pi*xh))-1; 
x = 0:0.01:1; u = exp(sin(pi*x))-1; 
err = max(abs(uh-vh))
plot(x,u,xh,vh,'*')





