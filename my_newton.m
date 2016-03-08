function [root,vals,iter,ierr] = my_newton(f,fp,x0,tol,itermax)
%
% MY_NEWTON:  [root,vals,iter,ierr] = newton(f,fp,x0,tol,itermax)
%
%         Implements Newton's Method to find a root of f(x).
%
% Input:     f - a function of x as a string, e.g., f='x^2-3'
%           fp - the derivative of f as a string, e.g., fp='2*x'
%           x0 - initial guess 
%          tol - stopping critera; when abs(f(x)) <= tol 
%      itermax - maximum number of iterations
%
% Output: root - approximate root of f
%         vals - a history of the iterations
%         iter - number of iterations
%         ierr - error flag:  0 - no error
%                             1 - itermax reached
% 
%
format long e
ierr = 0;
iter = 1;
x = x0;
fx = eval(f);
vals(iter,1) = x; vals(iter,2) = fx;

while ((iter <= itermax) && (abs(fx) > tol))
      iter = iter+1;
      fpx = eval(fp);
% get new iterate; note fx was previously computed
      x = x-fx/fpx;
      fx = eval(f);
      vals(iter,1) = x; vals(iter,2) = fx;
end

disp(' ')
disp('            x_n                       f(x_n) ')
disp('    ------------------------------------------------ ')
disp(vals)
disp(' ')
root = x;
if (iter > itermax)
   ierr = 1;
end          
         

